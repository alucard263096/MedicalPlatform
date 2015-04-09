using SunStar.DataBaseFactory;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoctorImport
{
    public partial class Form1 : Form
    {
        List<string> lstLang;

        public Form1()
        {
            InitializeComponent();
            lstLang = new List<string>();
            lstLang.Add("zh-cn");
            lstLang.Add("zh-hk");
            lstLang.Add("en-us");
        }

        

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog of = new OpenFileDialog();
            if (of.ShowDialog() == DialogResult.OK)
            {
                string filepath = of.FileName;
                DataTable exceldt = ReadExcel(filepath);

                DBInstance mysqldb = new DBInstance(DBProvider.MySql, "Server=localhost;User Id=root;Password=root;Persist Security Info=True;Database=MedicalPlatform");

                using (DbConnection conn = mysqldb.GetDbConnection())
                {
                    conn.Open();
                    using (DbTransaction tx = conn.BeginTransaction())
                    {

                        //string str = "insert into tb_Seq values (@car_id,@car)";
                        //for (int i = 1; i < 65535; i++)
                        //{
                        //    List<DBParam> l = new List<DBParam>();
                        //    l.Add(new DBParam("@car_id", DbType.String, i));
                        //    l.Add(new DBParam("@car", DbType.Int32, i));
                        //    dn.ExecuteNonQuery(tx, str, l);
                        //}
                        foreach (DataRow item in exceldt.Rows)
                        {
                            int specialist_id = getSpecialistId(mysqldb, tx, Convert.ToString(item["科室"]).Replace(" ", ""));
                            string chinaname = Convert.ToString(item["中文名"]).Replace(" ", "");
                            string englishname = Convert.ToString(item["英文名"]).Replace(" ", "");
                            string licence_code = Convert.ToString(item["执业许可证号"]).Replace(" ","");
                            string sexual = Convert.ToString(item["性别"]).Replace(" ", "") == "男" ? "M" : "F";
                            string officename = Convert.ToString(item["所在诊所中文名"]).Replace(" ", "");
                            string officeengname = Convert.ToString(item["所在诊所英文名"]).Replace(" ", "");
                            string officeaddress = Convert.ToString(item["地址"]).Replace(" ", "");
                            string summary = Convert.ToString(item["医生介绍"]).Replace(" ", "");
                            string post_process = Convert.ToString(item["任职历程"]).Replace(" ", "");
                            string pro_title = Convert.ToString(item["专业资格"]).Replace(" ", "");

                            if (doctorDuplic(mysqldb,licence_code))
                            {
                                continue;
                            }

                            string sql = @"INSERT INTO `medicalplatform`.`dr_tb_doctor`
(`id`,
`licence_code`,
`photo`,
`sexual`,
`exec_year`,
`hospital_list_id`,
`general_price`,
`specialist_id`,
`specialist_price`,
`use_lang_id`,
`is_general`,
`remarks`,
`status`,
`created_date`,
`created_user`,
`updated_date`,
`updated_user`)
VALUES
(@id,
@licence_code,
@photo,
@sexual,
0,
0,
0,
@specialist_id,
0,
'1,2',
'Y',
'',
'I',
now(),
1,
now(),
1)
";
                            int id = getLastDoctorId(mysqldb);
                            List<DBParam> l = new List<DBParam>();
                            l.Add(new DBParam("@id", DbType.Int32, id));
                            l.Add(new DBParam("@licence_code", DbType.String, licence_code));
                            l.Add(new DBParam("@photo", DbType.String, licence_code + ".png"));
                            l.Add(new DBParam("@sexual", DbType.String, sexual));
                            l.Add(new DBParam("@specialist_id", DbType.Int32, specialist_id));

                            mysqldb.ExecuteNonQuery(tx, sql, l);


                            foreach (var lang in lstLang)
                            {
                                l = new List<DBParam>();
                                l.Add(new DBParam("@id", DbType.Int32, id));
                                l.Add(new DBParam("@lang", DbType.String, lang));
                                l.Add(new DBParam("@name", DbType.String, lang == "en-us" ? englishname : chinaname));
                                l.Add(new DBParam("@post_process", DbType.String, post_process));
                                l.Add(new DBParam("@summary", DbType.String, summary));
                                l.Add(new DBParam("@pro_title", DbType.String, pro_title));
                                sql = @"INSERT INTO `medicalplatform`.`dr_tb_doctor_lang`
(`oid`,
`lang`,
`name`,
`post_process`,
`summary`,
`pro_title`,
`book_content`,
`open_hour`,
`advanced`)
VALUES
(@id,
@lang,
@name,
@post_process,
@summary,
@pro_title,
'',
'',
'')";
                                mysqldb.ExecuteNonQuery(tx, sql, l);
                            }

                            int officeid = getLastOfficeId(mysqldb);
                            sql = @"INSERT INTO `medicalplatform`.`dr_tb_office`
(`id`,
`coordinate`,
`remarks`,
`status`,
`created_date`,
`created_user`,
`updated_date`,
`updated_user`,
`block_id`,
`hot_district_id`,
`station1_id`,
`station2_id`)
VALUES
(@officeid,
'0,0',
'',
'A',
now(),
1,
now(),
1,
0,
0,
0,
0);
";
                            l = new List<DBParam>();
                            l.Add(new DBParam("@officeid", DbType.Int32, officeid));
                            mysqldb.ExecuteNonQuery(tx, sql, l);

                            foreach (var lang in lstLang)
                            {
                                l = new List<DBParam>();
                                l.Add(new DBParam("@officeid", DbType.Int32, officeid));
                                l.Add(new DBParam("@lang", DbType.String, lang));
                                l.Add(new DBParam("@name", DbType.String, lang == "en-us" ? officeengname : officename));
                                l.Add(new DBParam("@address", DbType.String, officeaddress));

                                sql = @"INSERT INTO `medicalplatform`.`dr_tb_office_lang`
(`oid`,
`lang`,
`name`,
`description`,
`address`,
`open_hour`)
VALUES
(@officeid,
@lang,
@name,
'',
@address,
'');
";
                                mysqldb.ExecuteNonQuery(tx, sql, l);
                            }
                            int ohid = getLastOHId(mysqldb);
                            sql = @"INSERT INTO `medicalplatform`.`dr_tb_office_openhour`
(`id`,
`doctor_id`,
`office_id`,
`meet_day1`,
`meet_day2`,
`meet_day3`,
`meet_day4`,
`meet_day5`,
`meet_day6`,
`meet_day0`,
`remarks`,
`status`,
`created_user`,
`created_date`,
`updated_user`,
`updated_date`)
VALUES
(@id,
@doctor_id,
@office_id,
'',
'',
'',
'',
'',
'',
'',
'',
'',
1,
now(),
1,
now());
"; 
                            l = new List<DBParam>();
                            l.Add(new DBParam("@id", DbType.Int32, ohid));
                            l.Add(new DBParam("@doctor_id", DbType.Int32, id));
                            l.Add(new DBParam("@office_id", DbType.Int32, officeid));

                        }
                        tx.Commit();
                    }

                }

            }

        }

        private bool doctorDuplic(DBInstance mysqldb, string licence_code)
        {
            string sql = "select 1 from dr_tb_doctor where licence_code=@licence_code";
            List<DBParam> l = new List<DBParam>();
            l.Add(new DBParam("@licence_code", DbType.String, licence_code));
            DataTable dt = mysqldb.ExecuteDataTable(sql, l);
            return dt.Rows.Count > 0;
        }

        private int getSpecialistId(DBInstance mysqldb, DbTransaction tx, string name)
        {
            string sql = "select oid from dr_tb_specialist_lang where name=@name";
            List<DBParam> l = new List<DBParam>();
            l.Add(new DBParam("@name", DbType.String, name));
            DataTable dt = mysqldb.ExecuteDataTable(sql, l);
            if (dt.Rows.Count > 0)
            {
                return Convert.ToInt32(dt.Rows[0]["oid"]);
            }
            else
            {
                int id = getLastSpecialistId(mysqldb);
                sql = @"INSERT INTO `medicalplatform`.`dr_tb_specialist`
(`id`,
`effect_list`,
`remarks`,
`status`,
`created_date`,
`created_user`,
`updated_date`,
`updated_user`)
VALUES
(@id,
'',
'',
'A',
now(),
1,
now(),
1)
 ";
                l = new List<DBParam>();
                l.Add(new DBParam("@id", DbType.Int32, id));
                mysqldb.ExecuteNonQuery(tx, sql, l);

                foreach (var item in lstLang)
                {

                    l = new List<DBParam>();
                    l.Add(new DBParam("@id", DbType.Int32, id));
                    l.Add(new DBParam("@lang", DbType.String, item));
                    l.Add(new DBParam("@name", DbType.String, name));
                    sql = @"INSERT INTO `medicalplatform`.`dr_tb_specialist_lang`(`oid`,`lang`,`name`) VALUES
(@id,@lang,@name)";
                    mysqldb.ExecuteNonQuery(tx, sql, l);
                }

                return id;
            }
        }

        private int getLastSpecialistId(DBInstance mysqldb)
        {
            if (LastSpecialistId == 0)
            {
                string sql = "select ifnull(max(id),1)+1 from dr_tb_specialist";
                DataTable dt = mysqldb.ExecuteDataTable(sql, null);
                LastSpecialistId = Convert.ToInt32(dt.Rows[0][0]);
            }
            ++LastSpecialistId;
            return LastSpecialistId;
        }

        private int getLastDoctorId(DBInstance mysqldb)
        {
            if (LastDoctorId == 0)
            {
                string sql = "select ifnull(max(id),1)+1 from dr_tb_doctor";
                DataTable dt = mysqldb.ExecuteDataTable(sql, null);
                LastDoctorId = Convert.ToInt32(dt.Rows[0][0]);
            }
            ++LastDoctorId;
            return LastDoctorId;
        }

        private int getLastOfficeId(DBInstance mysqldb)
        {
            if (LastOfficeId == 0)
            {
                string sql = "select ifnull(max(id),1)+1 from dr_tb_office";
                DataTable dt = mysqldb.ExecuteDataTable(sql, null);
                LastOfficeId = Convert.ToInt32(dt.Rows[0][0]);
            }
            ++LastOfficeId;
            return LastOfficeId;
        }
        private int getLastOHId(DBInstance mysqldb)
        {
            if (LastOHId == 0)
            {
                string sql = "select ifnull(max(id),1)+1 from dr_tb_office_openhour";
                DataTable dt = mysqldb.ExecuteDataTable(sql, null);
                LastOHId = Convert.ToInt32(dt.Rows[0][0]);
            }
            ++LastOHId;
            return LastOHId;
        }
        private DataTable ReadExcel(string filepath)
        {
            try
            {
                //install http://www.microsoft.com/zh-cn/download/confirmation.aspx?id=13255 first when WIN7 X64
                string strCon = " Provider = Microsoft.ACE.OLEDB.12.0; Data Source =" + filepath + ";Extended Properties='Excel 12.0;HDR=False;IMEX=1'";
                OleDbConnection myConn = new OleDbConnection(strCon);
                string strCom = " SELECT * FROM [ALL$] ";
                myConn.Open();
                OleDbDataAdapter myCommand = new OleDbDataAdapter(strCom, myConn);
                DataSet myDataSet = new DataSet();
                myCommand.Fill(myDataSet, "[ALL$]");
                myConn.Close();

                DataTable dt = myDataSet.Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int LastSpecialistId { get; set; }

        public int LastDoctorId { get; set; }

        public int LastOfficeId { get; set; }

        public int LastOHId { get; set; }
    }
}

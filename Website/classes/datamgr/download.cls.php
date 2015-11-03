<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class DownloadMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new DownloadMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	
	public function  getDownladCateList(){
		$sql="select distinct seq,id,name
		from tb_download_category 
		where  status ='A' 
		order by seq";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		$sum=count($result);
		for($i=0;$i<$sum;$i++)
		{
			$result[$i]["seq"]=$i;
			$filelist=$this->getActivedFileListByCategory($result[$i]["id"]);
			$result[$i]["filelist"]=$filelist;
			$result[$i]["filecount"]=count($filelist);
		}
		
		return $result;
	}
	
	
	public function getActivedFileListByCategory($category_id){
		$sql="select seq,name,`status`,id,length,filename,extlink
		from tb_download_file
		where category_id=$category_id 
		and status ='A' 
		order by seq";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
	
	public function searchDownloadCategory($name,$status)
	{
		$name=parameter_filter($name);
		if($name==""){
			$sql="select distinct dt.seq,dt.id,dt.name,dt.status
		,dt.created_user,c.user_name created_username,dt.created_date
		,dt.updated_user,u.user_name updated_username,dt.updated_date 
		from tb_download_category dt
		left join tb_user c on dt.created_user=c.user_id
		left join tb_user u on dt.updated_user=u.user_id
		where  dt.status like '%$status%'
		and dt.status <>'D' 
		order by dt.seq";
		}else{
		$sql="select distinct dt.seq,dt.id,dt.name,dt.status
		,dt.created_user,c.user_name created_username,dt.created_date
		,dt.updated_user,u.user_name updated_username,dt.updated_date 
		from tb_download_category dt
		inner join tb_download_file df on dt.id=df.category_id
		left join tb_user c on dt.created_user=c.user_id
		left join tb_user u on dt.updated_user=u.user_id
		where df.name like '%$name%' 
		and dt.status like '%$status%'
		and dt.status <>'D' 
		and df.status <>'D' 
		order by dt.seq";
		}
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		$sum=count($result);
		for($i=0;$i<$sum;$i++)
		{
			$result[$i]["filelist"]=$this->getFileListByCategory($result[$i]["id"]);
		}
		
		return $result;
	}
	
	public function getDownloadCategory($id){
		$sql="select * from tb_download_category where id=$id ";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		
		$result["filelist"]=$this->getFileListByCategory($id);
		return $result;
		
	}
	
	public function getFileListByCategory($category_id){
		$sql="select seq,name,`status`,id,length,filename,extlink
		from tb_download_file
		where category_id=$category_id 
		and status <>'D' 
		order by seq";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
	
	
	public function newFile($user_id){
		
		$this->dbmgr->begin_trans();
		
		$sql="select ifnull(max(id),0)+1 from tb_download_file";
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		
		$id=$result[0];
			$sql="insert into `tb_download_file` 
	(id, category_id, name,filename, length, extlink,
	seq, status, created_user, 
	created_date, updated_user, 
	updated_date)
	values
	($id, -1, '','', 0, '',
	0, 'A', $user_id, 
	now(), $user_id, 
	now())";
		
		$query = $this->dbmgr->query($sql);
		$this->dbmgr->commit_trans();
		
		return "right".$id;
	}
	
	
		
 public function save($id,$name,$seq,$status,$filelist,$sysUser_id)
	{
		$id=parameter_filter($id);
		$name=parameter_filter($name);
		$seq=parameter_filter($seq);
		$status=parameter_filter($status);
		$this->dbmgr->begin_trans();
		
		if($id=="")
		{
			
			$sql="select ifnull(max(id),0)+1 from tb_download_category";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$id=$result[0];
			$sql="insert into `tb_download_category` 
	(id, name, seq, status, created_user, 
	created_date, updated_user, 
	updated_date)
	values
	($id, '$name', '$seq', '$status', $sysUser_id, 
	now(), $sysUser_id, 
	now())";
			
		}
		else
		{
			$sql="update tb_download_category set 
					name='$name',
					seq='$seq'  ,
					status='$status',
					updated_user=$sysUser_id,
					updated_date=now()
					where id=$id ";
		}
		$query = $this->dbmgr->query($sql);
		
		$sql="update tb_download_file set 
					category_id=category_id*-1
					where category_id=$id ";
		$query = $this->dbmgr->query($sql);
		
		$sum=count($filelist);
		for ($i = 0; $i < $sum; $i++) {
			$a=$filelist[$i];
			$fid=parameter_filter($a["id"]);
			$fname=parameter_filter($a["name"]);
			$fseq=parameter_filter($a["seq"]);
			$ffilename=parameter_filter($a["filename"]);
			$extlink=parameter_filter($a["extlink"]);
			$flength=parameter_filter($a["length"]);
			$fstatus=parameter_filter($a["status"]);
			if($fid=="0"){
				continue;
			}
			$sql="update tb_download_file set 
					category_id=$id,
					name='$fname',
					seq='$fseq'  ,
					extlink='$extlink',
					filename='$ffilename',
					length=$flength,
					status='$fstatus',
					updated_user=$sysUser_id,
					updated_date=now()
					where id=$fid ";
			$query = $this->dbmgr->query($sql);
		}
		$this->dbmgr->commit_trans();
		
		return "right".$id;
	}
	
 	public function delete($list,$sysUser_id)
	{
		$this->dbmgr->begin_trans();
		$split = explode(",", $list);
		for($i=0;$i<count($split);$i++)
		{
			if(strlen($split[$i])>0)
			{
				$id=$split[$i];
				$sql="update tb_download_category set status='D',updated_user=$sysUser_id,updated_date=now() where id=$id";
				$query = $this->dbmgr->query($sql);
			}
		}
		$this->dbmgr->commit_trans();
	}
 }
 
 $downloadMgr=DownloadMgr::getInstance();
 $downloadMgr->dbmgr=$dbmgr;
 
 
 
 
?>
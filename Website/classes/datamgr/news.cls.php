<?php
/*
 * Created on 2011-2-7
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */  
 class NewsMgr
 {
 	private static $instance = null;
	public static $dbmgr = null;
	public static function getInstance() {
		return self :: $instance != null ? self :: $instance : new NewsMgr();
	}

	private function __construct() {
		
	}
	
	public  function __destruct ()
	{
		
	}
	public  function  getHotNewsList($count){
		$sql="select  id,title,published_date,summary,viewcount
		from tb_news 
		where  status ='A' 
		order by viewcount desc,published_date desc
		limit 0, $count ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		return $result;
	}
	
	
	public  function  getNewsList($page){
		$page=parameter_filter($page);
		$pagebeg=$page*15;
		$sql="select  id,title,published_date,summary,viewcount
		from tb_news 
		where  status ='A' 
		order by published_date desc
		limit $pagebeg , 15 ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 

		
		
		
		return $result;
		
	}
	
	
	
	public function search($title,$summary,$from,$to,$status)
	{
		$title=parameter_filter($title);
		$summary=parameter_filter($summary);
		$from=parameter_filter($from);
		$to=parameter_filter($to);
		
		
		$sql="select distinct n.id,n.title,n.published_date,n.summary,n.status
		,n.created_user,c.user_name created_username,n.created_date
		,n.updated_user,u.user_name updated_username,n.updated_date 
		from tb_news n
		left join tb_user c on n.created_user=c.user_id
		left join tb_user u on n.updated_user=u.user_id
		where  n.status like '%$status%'
		and ( n.title like '%$title%' )
		and ( n.summary like '%$summary%' )
		and ('$from'='' or n.published_date >= '$from 0:0:0' )
		and ('$to'='' or n.published_date <= '$to 23:59:59' )
		and n.status <>'D' 
		order by published_date desc
		limit 0, 100 ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array_all($query); 
		
		
		return $result;
	}
	
	
	
	public function getNews($id){
		$id=parameter_filter($id);
		$sql="select id,title,summary,published_date,content,status,viewcount
		from tb_news
		where id=$id ";
		
		$query = $this->dbmgr->query($sql);
		$result = $this->dbmgr->fetch_array($query); 
		return $result;
	}
 
	public function updateViewCount($id){
		$id=parameter_filter($id);
		$sql="update tb_news set viewcount=viewcount+1
		where id=$id ";
		
		$query = $this->dbmgr->query($sql);
	}
		
 public function save($id,$title,$summary,$published_date,$content,$status,$sysUser_id)
	{
		$id=parameter_filter($id);
		$title=parameter_filter($title);
		$summary=parameter_filter($summary);
		$published_date=parameter_filter($published_date);
		$content=parameter_filter($content);
		$status=parameter_filter($status);
		$this->dbmgr->begin_trans();
		
		if($id=="")
		{
			
			$sql="select ifnull(max(id),0)+1 from tb_news";
			$query = $this->dbmgr->query($sql);
			$result = $this->dbmgr->fetch_array($query); 
			
			$id=$result[0];
			$sql="insert into `tb_news` 
	(id, title, summary, published_date, 
	content, status, created_date, 
	created_user, updated_date, 
	updated_user)
	values
	($id, '$title', '$summary', '$published_date', 
	'$content', '$status', now(), 
	$sysUser_id, now(), 
	$sysUser_id)";
			
		}
		else
		{
			$sql="update tb_news set 
					title='$title',
					summary='$summary',
					published_date='$published_date',
					content='$content',
					status='$status',
					updated_user=$sysUser_id,
					updated_date=now()
					where id=$id ";
		}
		$query = $this->dbmgr->query($sql);
		
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
				$sql="update tb_news set status='D',updated_user=$sysUser_id,updated_date=now() where id=$id";
				$query = $this->dbmgr->query($sql);
			}
		}
		$this->dbmgr->commit_trans();
	}
 }
 
 $newsMgr=NewsMgr::getInstance();
 $newsMgr->dbmgr=$dbmgr;
 
 
 
 
?>
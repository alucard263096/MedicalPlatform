<?php
require ROOT.'/libs/xmlrpc.lib.php';
$xmlrpc_internalencoding='UTF-8';

class WebServiceClient {
	
	private $xmlrpc_client = null;
	private $server = '';
	private $port = '';
	private $path = '';
	
	public function __construct($path = '', $server = '', $port = '') {
		global $CONFIG;
		
		if ($path != '') {
			$this->path = $CONFIG['web_service']['path'].$path;
		} else {
			$this->path = $CONFIG['web_service']['path'];
		}
		if ($server != '') {
			$this->server = $server;
		} else {
			$this->server = $CONFIG['web_service']['server'];
		}
		if ($port != '') {
			$this->port = $port;
		} else {
			$this->port = $CONFIG['web_service']['port'];
		}
		if ($this->mxlrpc_client == null) {
			if ($this->path != '' && $this->server != '' && $this->port != '') {
				$this->xmlrpc_client = new xmlrpc_client($this->path, $this->server, $this->port);
			$this->xmlrpc_client->return_type = 'phpvals';
			}
		} else {
			$this->xmlrpc_client->path = $this->path;
			$this->xmlrpc_client->server = $this->server;
			$this->xmlrpc_client->port = $this->port;
		}
	}
	
	public function obj2xmlrpcval($obj) {
		$v = new xmlrpcval();
		
		if (is_array($obj)) {
			foreach ($obj as $key => $val) {
				$arr[$key] = $this->obj2xmlrpcval($val);
			}
			$v->addStruct($arr); 
		} else {
			$v->addScalar($obj);
		}
		
		return $v;
	}
	
	public function resetClient($path = '', $server = '', $port = '') {
		global $CONFIG;
		
		if ($path != '') {
			$this->path = $CONFIG['web_service']['path'].$path;
		}
		if ($server != '') {
			$this->server = $server;
		}
		if ($port != '') {
			$this->port = $port;
		}
		if ($this->mxlrpc_client == null) {
			$this->xmlrpc_client = new xmlrpc_client($this->path, $this->server, $this->port);
			$this->xmlrpc_client->return_type = 'phpvals';
		} else {
			$this->xmlrpc_client->path = $this->path;
			$this->xmlrpc_client->server = $this->server;
			$this->xmlrpc_client->port = $this->port;
		}
	}
	
	public function getResultFromServer($obj, $method = '') {
		logger_mgr::logDebug("[Web Service Client] >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		if (is_array($obj) && $method != '') {
			logger_mgr::logDebug("[Web Service Client] Calling server - Method name: ".$method);
			logger_mgr::logDebug("[Web Service Client] Calling server - Params: ");
			foreach ($obj as $key => $value) {
				logger_mgr::logDebug("[Web Service Client] (".$key." => ".$value.") ");
			}
			logger_mgr::logDebug("[Web Service Client] Calling server - Params End. ");
			$msg = new xmlrpcmsg($method, array($this->obj2xmlrpcval($obj)));
			
		} else {
			$msg = $obj;
		}
		
		$rsp = $this->xmlrpc_client->send($msg);
		
		if ($rsp->faultcode() == 0) {
			logger_mgr::logDebug("[Web Service Client] Got result from server - result size: ".count($rsp->value()));
		} else {
			logger_mgr::logDebug("[Web Service Client] Cannot get result from server - Method name: ".$method." Error: ".$rsp->faultCode()." Message: ".$rsp->faultString());
			logger_mgr::logError("[Web Service Client] Cannot get result from server - Method name: ".$method." Error: ".$rsp->faultCode()." Message: ".$rsp->faultString());
		}
		logger_mgr::logDebug("[Web Service Client] <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		return $rsp;
	}
}

$webServiceClient = new WebServiceClient();

?>
package controller;

import model.Log;

import org.apache.log4j.Logger;

public class CustomLog {
	
	private static Logger logger = null;
	
	public static void log(String classname,String level,String log){
		logger = Logger.getLogger(classname);
		Log temp = new Log(classname,level,log);
		if(level.equals(Message.LOG_INFO))
			logger.info(log+" :: "+temp.getHostAddress()+ " :: " + temp.getHostName());
		else if(level.equals(Message.LOG_DEBUG))
			logger.info(log+" :: "+temp.getHostAddress()+ " :: " + temp.getHostName());
		else if(level.equals(Message.LOG_ERROR))
			logger.info(log+" :: "+temp.getHostAddress()+ " :: " + temp.getHostName());
		else if(level.equals(Message.LOG_WARN))
			logger.info(log+" :: "+temp.getHostAddress()+ " :: " + temp.getHostName());
		else if(level.equals(Message.LOG_FATAL))
			logger.info(log+" :: "+temp.getHostAddress()+ " :: " + temp.getHostName());
		else if(level.equals(Message.LOG_TRACE))
			logger.info(log+" :: "+temp.getHostAddress()+ " :: " + temp.getHostName());
		
		Database.addLog(temp);
	}
	
}

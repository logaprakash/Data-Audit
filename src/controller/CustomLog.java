package controller;

import model.Log;

import org.apache.log4j.Logger;

public class CustomLog {
	
	private static Logger logger = null;
	
	public static void log(String classname,String level,String log){
		logger = Logger.getLogger(classname);
		if(level.equals(Message.LOG_INFO))
			logger.info(log);
		else if(level.equals(Message.LOG_DEBUG))
			logger.debug(log);
		else if(level.equals(Message.LOG_ERROR))
			logger.error(log);
		else if(level.equals(Message.LOG_WARN))
			logger.warn(log);
		else if(level.equals(Message.LOG_FATAL))
			logger.fatal(log);
		else if(level.equals(Message.LOG_TRACE))
			logger.trace(log);
		
		Database.addLog(new Log(classname,level,log));
	}
	
}

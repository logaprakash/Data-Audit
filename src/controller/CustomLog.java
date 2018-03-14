package controller;

import model.Log;

import org.apache.log4j.Logger;

public class CustomLog {
	
	private static Logger logger = null;
	
	public static void log(String classname,String level,String log){
		logger = Logger.getLogger(classname);
		if(level.equals("info"))
			logger.info(log);
		else if(level.equals("debug"))
			logger.debug(log);
		else if(level.equals("error"))
			logger.error(log);
		else if(level.equals("warn"))
			logger.warn(log);
		else if(level.equals("fatal"))
			logger.fatal(log);
		else if(level.equals("trace"))
			logger.trace(log);
		
		Database.addLog(new Log(classname,level,log));
	}
	
}

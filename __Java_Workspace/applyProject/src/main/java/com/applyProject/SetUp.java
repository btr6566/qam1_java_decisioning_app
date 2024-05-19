package com.applyProject;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class SetUp {
	
	static String configFile =  "\\src\\appConfig.properties";
	static String appConfigPath = System.getProperty("user.dir") + configFile;
	
	static String jdbcUser;
	static String jdbcPwd;
	
	static Integer minId;
	static Integer maxId;
	
	public static void loadSetUpProperties() {
			
			//https://www.baeldung.com/java-properties
			//https://stackoverflow.com/questions/13011892/how-to-locate-the-path-of-the-current-project-directory-in-java-ide

			Properties appConfig = new Properties();
			
			try {
				appConfig.load(new FileInputStream(appConfigPath));
			} catch (FileNotFoundException e) {
				e.getMessage();
				e.printStackTrace();
				
				//No point running if can't find this file, so exit
				System.exit(1);
				
			} catch (IOException e) {
				e.printStackTrace();
				
				//No point running if can't find this file, so exit
				System.exit(1);
			}
			
			//Read the Properties into Static Variables
			jdbcUser = appConfig.getProperty("jdbcUser");
			jdbcPwd = appConfig.getProperty("jdbcPwd");
			
			minId = Integer.parseInt(appConfig.getProperty("minId"));
			maxId = Integer.parseInt(appConfig.getProperty("maxId"));
			
	
	}
}

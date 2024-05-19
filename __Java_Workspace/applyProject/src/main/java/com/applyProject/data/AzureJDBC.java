package com.applyProject.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import java.sql.Statement;
import com.applyProject.programData.DecisioningDataRow;


////////////////////////
// Class Define
///////////////////////
public class AzureJDBC {

	private String jdbcConnectionURL;
	private String username;
	private String password;

	////////////////////////
	// Constructors
	///////////////////////
	public AzureJDBC(String username, String password) {
		
		this.username = username;
		this.password = password;
		
		
		//Plan A - Use a Regex Replace to add in Username & password to string
//		jdbcConnectionURL = jdbcConnectionURL.replaceAll("\\$\\$USER\\$\\$", this.username);
//		jdbcConnectionURL = jdbcConnectionURL.replaceAll("\\$\\$PASSWORD\\$\\$", this.password);
		
		
		//Plan B - Use the Formatted option (feels eaiser)
		jdbcConnectionURL = "jdbc:sqlserver://btrqasdlvl4.database.windows.net:1433;database=QA_Apply_1;user=%s;password=%s;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;".formatted(this.username, this.password);
		
		//For Debug
//		System.out.println("jdbcConnectionURL = " + jdbcConnectionURL);
		
	}
	
	public AzureJDBC(String jdbcConnectionURL) {
		this.jdbcConnectionURL = jdbcConnectionURL;
	}

	public AzureJDBC(String jdbcConnectionURL, String username, String password) {
		this.jdbcConnectionURL = jdbcConnectionURL;
		this.username = username;
		this.password = password;
	}
	
	
	

	////////////////////////
	// Test the DB Connection
	///////////////////////
	public void testAzureConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(this.jdbcConnectionURL);
			
			System.out.println("Database = "+conn.getCatalog());

			System.out.println("getConnection() = SUCCESS \n");
			
		} catch (SQLException e) {
			
			System.out.println("getConnection() = ERROR: see below \n");
			System.out.println(e.getMessage());
			System.out.println(e.getStackTrace());
		
			
		} finally {
			try {
				if (conn != null) { // so will ALWAYS close
					conn.close();
				}
			} catch (SQLException se) {
				se.getMessage();
				se.printStackTrace();
			}
		}
		
	}
	
	public void wakeUpAzureDb() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(this.jdbcConnectionURL);
			
			System.out.println("Database = "+conn.getCatalog());

			System.out.println("NOTE: Azure Database is already active");
			
		} catch (SQLException e) {
			
			System.out.println(e.getMessage());
			
			System.out.println("Waking up SQL Database.");
		
			
		} finally {
			try {
				if (conn != null) { // so will ALWAYS close
					conn.close();
				}
			} catch (SQLException se) {
				se.getMessage();
				se.printStackTrace();
			}
		}
		
	}
	
	
	//Left over from inital test with a Local Host MySQL Database
//	public void testMySQLConnection() {
//		Connection conn = null;
//		try {
//			conn = DriverManager.getConnection(jdbcConnectionURL, username, password);
//
//			System.out.println("getConnection() worked \n");
//			
//		} catch (SQLException e) {
//			
//			System.out.println("ERROR: see below \n");
//			System.out.println(e.getMessage());
//			System.out.println(e.getStackTrace());
//		
//			
//		} finally {
//			try {
//				if (conn != null) { // so will ALWAYS close
//					conn.close();
//				}
//			} catch (SQLException se) {
//				se.printStackTrace();
//			}
//		}
//	}
//	
	////////////////////////
	// READ
	///////////////////////
	
	public DecisioningDataRow getDecisionData(Integer id) {
		
		String decisionStatement = "SELECT\r\n"
				+ "    su.__PK\r\n"
				+ "    \r\n"
				+ "    --Champion\r\n"
				+ "    ,su.CAIS_E1B07\r\n"
				+ "    ,su.CAIS_E1B09\r\n"
				+ "    ,pv.TrendedData_TRD_A_13\r\n"
				+ "    ,su.CAIS_E1A09\r\n"
				+ "    ,pv.HighCostCredit_TRD_STL_14\r\n"
				+ "\r\n"
				+ "    --Challanger\r\n"
				+ "    ,pv.CII_NDSPACII\r\n"
				+ "    ,pv.TrendedData_TRD_A_06\r\n"
				+ "    ,su.CAIS_E1B13\r\n"
				+ "    ,su.CAIS_E1B01\r\n"
				+ "    ,pv.HighCostCredit_TRD_STL_19\r\n"
				+ "\r\n"
				+ "    --POLICY\r\n"
				+ "    ,su.CAIS_E1B08\r\n"
				+ "    ,pv.Scoring_E5S051\r\n"
				+ "FROM [Delphi].[VW_DelphiSummaryData] su\r\n"
				+ "INNER JOIN [Delphi].[VW_DelphiPremiumValueData] pv ON su.__PK = pv.__PK\r\n"
				+ "WHERE \r\n"
				+ "    su.__PK = ?;"
				;
		
		try (
                Connection conn = DriverManager.getConnection(jdbcConnectionURL, username, password);
				PreparedStatement statement = conn.prepareStatement(decisionStatement);
            ) {
			
			//add in passed in Id to prepared statement
			statement.setInt(1, id);
			
			ResultSet resultSet = statement.executeQuery();
			
			resultSet.next();
			
			//Create new row
			DecisioningDataRow out = new DecisioningDataRow();
			

			//Add to Object
			out.setPk(resultSet.getInt("__PK"));
			
			out.setE1B07(resultSet.getString("CAIS_E1B07"));
			out.setE1B08(resultSet.getString("CAIS_E1B08"));
			out.setTRD_STL_14(resultSet.getInt("HighCostCredit_TRD_STL_14"));
			
			
			out.setE1B09(resultSet.getInt("CAIS_E1B09"));
			out.setTRD_A_13(resultSet.getInt("TrendedData_TRD_A_13"));
			out.setE1A09(resultSet.getInt("CAIS_E1A09"));
			out.setE5S051(resultSet.getInt("Scoring_E5S051"));
			out.setNDSPCII(resultSet.getInt("CII_NDSPACII"));
			out.setTRD_A_06(resultSet.getInt("TrendedData_TRD_A_06"));
			out.setE1B13(resultSet.getInt("CAIS_E1B13"));
			out.setE1B01(resultSet.getInt("CAIS_E1B01"));
			out.setTRD_STL_19(resultSet.getInt("HighCostCredit_TRD_STL_19"));
			
            return out;
            
        } catch (SQLException e) {
            System.out.println("ERROR: " + e.getMessage());
            System.out.println("Stack Trace = " + e.getStackTrace());
        }
		return null;
		
	}
	
	
	public Integer getMinDecisionDataId() {
		
		String query = "SELECT min(__PK) AS __MIN FROM [Delphi].[VW_DelphiSummaryData]";
		
		Connection conn = null;
		Integer vResult = null;
		
		try {
			conn = DriverManager.getConnection(this.jdbcConnectionURL);
			
//			Statement statement = conn.createStatement();
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			
			resultSet.next();
			
			vResult = resultSet.getInt("__MIN");
			
		} catch (SQLException e) {
			
			System.out.println(e.getMessage());
			
		} finally {
			try {
				if (conn != null) { // so will ALWAYS close
					conn.close();
				}
			} catch (SQLException se) {
				se.getMessage();
				se.printStackTrace();
			}
		}
		
		
		return vResult;
	}
	
	public Integer getMaxDecisionDataId() {
		
		String query = "SELECT max(__PK) AS __max FROM [Delphi].[VW_DelphiSummaryData]";
		
		Connection conn = null;
		Integer vResult = null;
		
		try {
			conn = DriverManager.getConnection(this.jdbcConnectionURL);
			
//			Statement statement = conn.createStatement();
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			
			resultSet.next();
			
			vResult = resultSet.getInt("__max");
			
		} catch (SQLException e) {
			
			System.out.println(e.getMessage());
			
		} finally {
			try {
				if (conn != null) { // so will ALWAYS close
					conn.close();
				}
			} catch (SQLException se) {
				se.getMessage();
				se.printStackTrace();
			}
		}
		
		
		return vResult;
	}
	

	////////////////////////
	// CRUD TEST
	///////////////////////

	
	// Basic Test to try & query the DB
	public void getTest() {
		

         // The try syntax that auto closes resources if no longer needed?
         try (
                 Connection conn = DriverManager.getConnection(jdbcConnectionURL, username, password);
                 Statement statement = conn.createStatement();
                 ResultSet resultSet = statement.executeQuery("SELECT TOP 10 * FROM dbo.Customers;");
             ) {

                 resultSet.next(); // a Result Set starts from before 1st Row, this moves it actual start

//                 ResultSetMetaData meta = resultSet.getMetaData();
                 String customerID = resultSet.getString("CustomerID");
                 String companyName = resultSet.getString("CompanyName");

                 //Meta Data
//                 System.out.printf("meta.getCatalogName = %s\n", meta.getCatalogName(0));
                 
                 
                 //Actual Data
                 System.out.printf("customerID = %s\n",customerID);
                 System.out.printf("companyName = %s\n",companyName);

                 return;
                 
             } catch (SQLException e) {
                 System.out.println("ERROR: " + e.getMessage());
                 System.out.println("Stack Trace = " + e.getStackTrace());
         }
     }

}

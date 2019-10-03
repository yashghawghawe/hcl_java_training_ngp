package net.javaguides.jsp.jdbc.database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import net.javaguides.jsp.jdbc.bean.Employee;
public class EmployeeDao {

public int registerEmployee(Employee employee)throws ClassNotFoundException{
	String INSERT_USERS_SQL="INSERT INTO employee"+"(first_name,last_name,username,password,address,contact) values"+ "(?,?,?,?,?,?);" ;
	int result=0;
Class.forName("com.mysql.jdbc.Driver");
try(Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:8090/jsp_ajax?useSSL=false","root","1234");
		//step 2:create a statement using connection object
		PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USERS_SQL))
				{
			//preparedStatement.setInt(1,1);
			preparedStatement.setString(1,employee.getFirstname());
			preparedStatement.setString(2,employee.getLastname());
			preparedStatement.setString(3,employee.getUsername());
			preparedStatement.setString(2,employee.getPassword());
			preparedStatement.setString(2,employee.getAddress());
			preparedStatement.setString(2,employee.getContact());
			
			System.out.println(preparedStatement);
			//step 3:Execute the query or update Query
		}
		catch (SQLException e) {
			//process sql exception
			printSQLException(e);
		}
	return result;
}
	private void printSQLException(SQLException ex) {
		for(Throwable e:ex) {
			e.printStackTrace(System.err);
			System.err.println("SQLState:"+((SQLException)e).getSQLState());
			System.err.println("Error Code:"+((SQLException)e).getErrorCode());
			System.err.println("Message"+e.getMessage());
			Throwable t=ex.getCause();
			while (t !=null) {
				System.out.println("Cause:"+t);
				t=t.getCause();
			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

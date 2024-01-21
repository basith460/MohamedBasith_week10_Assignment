package com.assignment.week9;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionGL {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String url="jdbc:mysql://localhost:3309/gl";
		String username="root";
		String password="2809";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//Driver name

			Connection con=DriverManager.getConnection(url,username,password);
			System.out.println("Connection Established Successfully");

			//a.insert 5 records
			String a="insert into employee(Id,Name,Email_Id,Phone_Number) values   (1,'mohamed','mdb@gmail.com','4891916491'), (2,'enish','enishnath@gmail.com','198416225'),(3,'sathosh','sandy787@gmail.com','998756135'),(4,'shaha','deen@yahoo.com','99948754'),(5,'ghoiuse','mdghouse56@gmail.com','3674681315')";
			Statement st=con.createStatement();
			st.execute(a);


			//b. Modify Email_Id column to varchar(30) NOT NULL
			String b="alter table employee modify Email_Id varchar(20)";
			Statement st1=con.createStatement();
			st1.execute(b);

			//c. Insert 2 records and check.
			String c="insert into employee(Id,Name,Email_Id,Phone_Number) values   (6,'mohamedbasi','basi460@gmail.com','9951246291'), (7,'rasith','rasithmech@gmail.com','8394416225')";
			Statement st2=con.createStatement();
			st2.execute(c);


			//d. Update the name of employee Id 3 to Karthik and phone number to 1234567890.
			String d="update employee set Name='karthik',Phone_Number='1234567890' where Id=3";
			Statement st3=con.createStatement();
			st3.execute(d);

			//e. Delete employee records 3 and 4.
			String e="delete from employee where Id between 3 and 4";
			Statement st4=con.createStatement();
			st4.execute(e);

			//f. Remove all records from the table employee.
			String f="truncate table employee";
			Statement st5=con.createStatement();
			st5.execute(f);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}

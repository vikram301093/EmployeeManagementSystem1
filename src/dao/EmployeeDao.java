package dao;

import java.sql.Connection;

import conn.MyConnection;
import dto.Employee;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class EmployeeDao {

	private Connection con;
	
	 public EmployeeDao() {
	  con = new MyConnection().getMyConnnection();
	 }

	 public void create(){
		 try {
			PreparedStatement s = con.prepareStatement("create table IF NOT EXISTS employeeDB(first_name varchar(10),last_name varchar(10),dob date,address varchar(100),contact_no varchar(15),certificate varchar(30),percentage float, positionApplied varchar(30),employee_id varchar(10) ,PRIMARY KEY (employee_id)); ");
			s.execute();
			
		 } catch (SQLException e) {
			
			e.printStackTrace();
		}
	 }
	 
	 	 public void insert(Employee employee) {
	 try {
		//  System.out.println(employee);
		  create();
		  String dd = employee.getDOB().split(" ")[0];
	       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	       Date d = sdf.parse(dd);
	       sdf = new SimpleDateFormat("yyyy-MM-dd");
	       dd = sdf.format(d);
	       
	   PreparedStatement s = con.prepareStatement("insert into employeeDB values(?,?,?,?,?,?,?,?,?)");
	   s.setString(1, employee.getFirstName());
	   s.setString(2, employee.getLastName());
	   s.setString(3,dd);
	   s.setString(4, employee.getAddress());
	   s.setString(5, employee.getContactNo());
	   s.setString(6, employee.getCertificateName());
	   s.setFloat(7, employee.getPercentage());
	   s.setString(8, employee.getPosition());
	   s.setString(9, employee.getEmpId());
	   s.executeUpdate();
	  
	  } catch (Exception e) {
	   e.printStackTrace();
	  }
	 }
	
	public ArrayList<Employee> displayEmployee()
	 {
		create();
		 ArrayList<Employee> al = new ArrayList<Employee>();
		  try {
		   PreparedStatement s = con.prepareStatement("select * from employeeDB");
		   ResultSet rs = s.executeQuery();
		   while (rs.next()) {
			Employee e = new Employee();
			e.setFirstName(rs.getString("first_name"));
			e.setLastName(rs.getString("last_name"));
			
			String dd = rs.getDate("dob").toString();
			e.setDOB(dd);
			e.setAddress(rs.getString("address"));
			e.setContactNo(rs.getString("contact_no"));
			e.setCertificateName(rs.getString("certificate"));
			e.setPercentage(rs.getFloat("percentage"));
			e.setPosition(rs.getString("positionApplied"));
			e.setEmpId(rs.getString("employee_id"));
			al.add(e);
		   }
		
		  } catch (Exception e) {
		   e.printStackTrace();
		  }
		  return al; 
	 }
	public Employee searchEmployee(String firstname,String lastname)
	 {
		create();
		 
		 Employee e = new Employee();
		  try {
		   PreparedStatement s = con.prepareStatement("select * from employeeDB where first_name=? and last_name=?");
		   s.setString(1,firstname);
		   s.setString(2,lastname);
		   ResultSet rs = s.executeQuery();
		   while (rs.next()) {
			
			e.setFirstName(rs.getString("first_name"));
			e.setLastName(rs.getString("last_name"));
			
			String dd = rs.getDate("dob").toString();
			e.setDOB(dd);
			e.setAddress(rs.getString("address"));
			e.setContactNo(rs.getString("contact_no"));
			e.setCertificateName(rs.getString("certificate"));
			e.setPercentage(rs.getFloat("percentage"));
			e.setPosition(rs.getString("positionApplied"));
			e.setEmpId(rs.getString("employee_id"));
			
		   }
		 
		  } catch (Exception ex) {
		   ex.printStackTrace();
		  }
		  return e; 
	 }
	public void update(Employee emp){
		  
		try {
			   PreparedStatement s = con.prepareStatement("update employeeDB set first_name=?,last_name=?,contact_no=?,dob=?,address=?,certificate=?,percentage=?,positionApplied =? where employee_id = ?");
			   s.setString(1,emp.getFirstName());
			   s.setString(2,emp.getLastName());
			   s.setString(3,emp.getContactNo());
			   String dd = emp.getDOB().split(" ")[0];
		       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		       Date d = sdf.parse(dd);
		       sdf = new SimpleDateFormat("yyyy-MM-dd");
		       dd = sdf.format(d);
		       s.setString(4,dd);
		       s.setString(5,emp.getAddress());
			   s.setString(6, emp.getCertificateName());
			   s.setFloat(7, emp.getPercentage());
			   s.setString(8,emp.getPosition());
			   s.setString(9, emp.getEmpId());
			   
			   s.executeUpdate();
			 
			  } catch (Exception ex) {
			   ex.printStackTrace();
			  }
		
	}
}

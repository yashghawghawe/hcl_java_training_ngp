package com.yash.database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.yash.bean.User;

public class UserDao {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp_ajax", "root", "1234");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	public static int save(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			String Q2 = "insert into register " + "(name,password,email,sex,country) " + " values(?,?,?,?,?) ";
			PreparedStatement ps = con.prepareStatement(Q2);
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getCountry());
			status = ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			String strQ = " update register " + " set name=?,password=?, " + " email=?,sex=?,country=? where id=?";

			PreparedStatement ps = con.prepareStatement(strQ);
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getCountry());
			ps.setInt(6, u.getId());

			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int delete(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			String strQuery1 = "delete from register where id=?";
			PreparedStatement ps = con.prepareStatement(strQuery1);
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static List<User> getAllRecords() {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = getConnection();
			String strQuery1 = "select * from register";
			PreparedStatement ps = con.prepareStatement(strQuery1);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	public static User getRecordById(int id) {
		User u = null;
		try {
			Connection con = getConnection();

			String strQuery1 = "select * from register where id=?";

			PreparedStatement ps = con.prepareStatement(strQuery1);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));

				u.setCountry(rs.getString("country"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
}
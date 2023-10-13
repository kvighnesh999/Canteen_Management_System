package com.cms.DAO;

import java.sql.*;
import com.cms.entity.foodEntity;


public class cmsDao {
	private Connection con;

	public cmsDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertFoodItems(foodEntity food) {
		boolean flag=false;
		try {
			String query="insert into food values(?,?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1,food.getFoodNo());
			ps.setString(2,food.getFoodName());
			ps.setString(3,food.getFoodType());
			ps.setInt(4,food.getFoodPrice());
			ps.executeUpdate();
			
			flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean getfoodbyid(foodEntity food_id) {
		foodEntity food = null;
		try {
			String q = "select * from food where food_no="+food_id;
			Statement ps = this.con.createStatement();
			ps.execute(q);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deletefood(int foodId) {
		foodEntity food = null;
      try {
          String q = "delete from food where food_no="+foodId;
          Statement st = this.con.createStatement();
          st.execute(q);
          System.out.print("Food Details deleted successfully!");
         
      } catch (Exception e) {
          e.printStackTrace();
      }
		
		return false;
		
	}

}

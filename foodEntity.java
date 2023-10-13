package com.cms.entity;

public class foodEntity {
	private int foodNo;
    private String foodName;
    private String foodType;
    private int foodPrice;

    public foodEntity() {
		super();
	}

	public foodEntity(int foodNo, String foodName, String foodType, int foodPrice) {
        this.foodNo = foodNo;
        this.foodName = foodName;
        this.foodType = foodType;
        this.foodPrice = foodPrice;
    }

    public foodEntity(int foodNo) {
    	this.foodNo = foodNo;
	}

	public int getFoodNo() {
        return foodNo;
    }

    public void setFoodNo(int foodNo) {
        this.foodNo = foodNo;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodType() {
        return foodType;
    }

    public void setFoodType(String foodType) {
        this.foodType = foodType;
    }

    public int getFoodPrice() {
        return foodPrice;
    }

    public void setFoodPrice(int foodPrice) {
        this.foodPrice = foodPrice;
    }

	public String toString() {
		return "foodEntity [foodNo=" + foodNo + ", foodName=" + foodName + ", foodType=" + foodType + ", foodPrice="
				+ foodPrice + "]";
	}
    
}

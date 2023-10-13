package com.cms.entity;

public class orderfoodEntity {
	private int id;
    private int orderNo;
    private int foodNo;
    private int quantity;
    
    public orderfoodEntity() {
		super();
	}

	public orderfoodEntity(int id, int orderNo, int foodNo, int quantity) {
        this.id = id;
        this.orderNo = orderNo;
        this.foodNo = foodNo;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getFoodNo() {
        return foodNo;
    }

    public void setFoodNo(int foodNo) {
        this.foodNo = foodNo;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

	public String toString() {
		return "orderfoodEntity [id=" + id + ", orderNo=" + orderNo + ", foodNo=" + foodNo + ", quantity=" + quantity
				+ "]";
	}
    
}

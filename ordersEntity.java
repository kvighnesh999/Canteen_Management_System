package com.cms.entity;

import java.sql.Date;
public class ordersEntity {
	private int orderNo;
    private Date orderDate;
    
    public ordersEntity() {
		super();
	}

	public ordersEntity(int orderNo, Date orderDate) {
        this.orderNo = orderNo;
        this.orderDate = orderDate;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

	public String toString() {
		return "ordersEntity [orderNo=" + orderNo + ", orderDate=" + orderDate + "]";
	}
    
}

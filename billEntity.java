package com.cms.entity;

public class billEntity {
	private int billNo;
    private int orderNo;
    private int totalAmount;
    
    public billEntity() {
		super();
	}

	public billEntity(int billNo, int orderNo, int totalAmount) {
        this.billNo = billNo;
        this.orderNo = orderNo;
        this.totalAmount = totalAmount;
    }

    public int getBillNo() {
        return billNo;
    }

    public void setBillNo(int billNo) {
        this.billNo = billNo;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

	public String toString() {
		return "billEntity [billNo=" + billNo + ", orderNo=" + orderNo + ", totalAmount=" + totalAmount + "]";
	}
    
}

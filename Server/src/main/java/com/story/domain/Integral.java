package com.story.domain;

public class Integral {
	private int serial;
	private int belong;
	private int quantity;
	private int limit;
	private String provenance;
	private String checkCode;
	
	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getBelong() {
		return belong;
	}
	public void setBelong(int belong) {
		this.belong = belong;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getProvenance() {
		return provenance;
	}
	public void setProvenance(String provenance) {
		this.provenance = provenance;
	}
	public String getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	@Override
	public String toString() {
		return "insert.into.Integral{serial=" + serial + ", belong=" + belong
				+ ", quantity=" + quantity + ", limit=" + limit
				+ ", provenance='" + provenance + "'}";
	}
	
	
	
}

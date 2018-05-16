package com.story.domain;

public class Levels {
	private int id;
	private int belong;
	private int level;
	private String checkCode;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBelong() {
		return belong;
	}
	public void setBelong(int belong) {
		this.belong = belong;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	@Override
	public String toString() {
		return "insert.into.Levels{serial =" + id + ", belong=" + belong + ", level=" + level+ "}";
	}
	
	
	
	
}

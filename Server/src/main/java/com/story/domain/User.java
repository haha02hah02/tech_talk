package com.story.domain;

public class User {
	private int serial;
	private String name;
	private String password;
	private String invitation;
	private int sex;
	private boolean gm;
	private int version;
	private long ctime;
	private long signTime;
	private long lastTime;
	private boolean ban;
	private long banTime;
	private String checkCode;
	private String ip;
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getInvitation() {
		return invitation;
	}
	public void setInvitation(String invitation) {
		this.invitation = invitation;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public boolean isGm() {
		return gm;
	}
	public void setGm(boolean gm) {
		this.gm = gm;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public long getCtime() {
		return ctime;
	}
	public void setCtime(long ctime) {
		this.ctime = ctime;
	}
	public long getSignTime() {
		return signTime;
	}
	public void setSignTime(long signTime) {
		this.signTime = signTime;
	}
	public long getLastTime() {
		return lastTime;
	}
	public void setLastTime(long lastTime) {
		this.lastTime = lastTime;
	}
	public boolean isBan() {
		return ban;
	}
	public void setBan(boolean ban) {
		this.ban = ban;
	}
	public long getBanTime() {
		return banTime;
	}
	public void setBanTime(long banTime) {
		this.banTime = banTime;
	}
	public String getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	
	@Override
	public String toString() {
		return "insert.into.Account{serial=" + serial + ", name='" + name + "', password='"
				+ password + "', invitation='" + invitation + "', sex=" + sex
				+ ", gm=" + gm + ", version=" + version + ", ctime=" + ctime
				+ ", ip = '"+ip+"'"
				+ ", sign_time=" + signTime + ", last_time=" + lastTime
				+ ", ban=" + ban + ", ban_time=" + banTime + ", check_code='"
				+ checkCode + "'}";
	}
	
	
	
}

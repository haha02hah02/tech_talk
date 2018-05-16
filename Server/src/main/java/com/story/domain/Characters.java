package com.story.domain;

public class Characters {
	private int serial;
	private String name;
	private int belong;
	private int hp;
	private int mp;
	private int exp;
	private int body;
	private int hair;
	private int face;
	private int eardrop;
	private int cap;
	private int coat;
	private int longcoat;
	private int shoes;
	private int glove;
	private int cape;
	private int weapon;
	private int job;
	private int map;
	private int rmap;
	private long mtime;
	private long ctime;
	private int pants;
	
	
	
	public int getPants() {
		return pants;
	}
	public void setPants(int pants) {
		this.pants = pants;
	}
	private String checkCode;
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("insert.into.Userinfo{");
		sb.append("serial=" + serial + ", name='" + name + "', belong="+ belong + ", hp=" + hp + ", mp=" + mp + ", exp=" + exp
				+ ", body=" + body + ", hair=" + hair + ", face=" + face +", job=" + job
						+ ", map=" + map + ", rmap=" + rmap + ", mtime=" + mtime
						+ ", ctime=" + ctime);
		if(eardrop != 0){
			sb.append(", eardrop=" + eardrop);
		}
		if(cap != 0){
			sb.append(", cap=" + cap);
		}
		if(longcoat!=0){
			sb.append(", longcoat=" + longcoat);
		}
		if(shoes!=0){
			sb.append(", shoes=" + shoes);
		}
		if(glove!=0){
			sb.append(", glove=" + glove);
		}
		
			
		if(cape!=0){
			sb.append(", cape=" + cape);
		}
		if(weapon!=0){
			sb.append(", weapon=" + weapon);
		}
		if(coat!=0){
			sb.append(", coat=" + coat);
		}
		if(pants != 0){
			sb.append(", pants=" + pants);
		}
		//sb.append(", check_code = '" + checkCode+"',");
		sb.append("}");
		System.out.println(sb);
		return sb.toString();
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
	public int getBelong() {
		return belong;
	}
	public void setBelong(int belong) {
		this.belong = belong;
	}
	public int getHp() {
		return hp;
	}
	public void setHp(int hp) {
		this.hp = hp;
	}
	public int getMp() {
		return mp;
	}
	public void setMp(int mp) {
		this.mp = mp;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public int getBody() {
		return body;
	}
	public void setBody(int body) {
		this.body = body;
	}
	public int getHair() {
		return hair;
	}
	public void setHair(int hair) {
		this.hair = hair;
	}
	public int getFace() {
		return face;
	}
	public void setFace(int face) {
		this.face = face;
	}
	public int getEardrop() {
		return eardrop;
	}
	public void setEardrop(int eardrop) {
		this.eardrop = eardrop;
	}
	public int getCap() {
		return cap;
	}
	public void setCap(int cap) {
		this.cap = cap;
	}
	
	
	
	public int getCoat() {
		return coat;
	}
	public void setCoat(int coat) {
		this.coat = coat;
	}
	public int getLongcoat() {
		return longcoat;
	}
	public void setLongcoat(int longcoat) {
		this.longcoat = longcoat;
	}
	public int getShoes() {
		return shoes;
	}
	public void setShoes(int shoes) {
		this.shoes = shoes;
	}
	public int getGlove() {
		return glove;
	}
	public void setGlove(int glove) {
		this.glove = glove;
	}
	public int getCape() {
		return cape;
	}
	public void setCape(int cape) {
		this.cape = cape;
	}
	public int getWeapon() {
		return weapon;
	}
	public void setWeapon(int weapon) {
		this.weapon = weapon;
	}
	public int getJob() {
		return job;
	}
	public void setJob(int job) {
		this.job = job;
	}
	public int getMap() {
		return map;
	}
	public void setMap(int map) {
		this.map = map;
	}
	public int getRmap() {
		return rmap;
	}
	public void setRmap(int rmap) {
		this.rmap = rmap;
	}
	public long getMtime() {
		return mtime;
	}
	public void setMtime(long mtime) {
		this.mtime = mtime;
	}
	public long getCtime() {
		return ctime;
	}
	public void setCtime(long ctime) {
		this.ctime = ctime;
	}
	public String getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}


}

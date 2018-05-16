package com.story.domain;

public class Authorize {
	private int code;
	private int mask;
	private Data data;
	
	public int getCode() {
		return code;
	}


	public void setCode(int code) {
		this.code = code;
	}


	public int getMask() {
		return mask;
	}


	public void setMask(int mask) {
		this.mask = mask;
	}


	public Data getData() {
		return data;
	}


	public void setData(Data data) {
		this.data = data;
	}


	public static class Data{
		private String token;
		private long expire;
		
		public Data() {
			super();
		}
		public Data(String token, long expire) {
			super();
			this.token = token;
			this.expire = expire;
		}
		public String getToken() {
			return token;
		}
		public void setToken(String token) {
			this.token = token;
		}
		public long getExpire() {
			return expire;
		}
		public void setExpire(long expire) {
			this.expire = expire;
		}
		
	}
	
	
}

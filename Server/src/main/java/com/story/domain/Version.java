package com.story.domain;

import java.util.List;

public class Version {
	private int code;
	private int mask;

	private Data data;
	
	public Version() {
	}


	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}



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

	static class Data{
		private String config;
		private List<String> database;//���ﷵ���˾�����̳����  Ȼ����뵽���ֻ��;
		
		public String getConfig() {
			return config;
		}
		public void setConfig(String config) {
			this.config = config;
		}
		public List<String> getDatabase() {
			return database;
		}
		public void setDatabase(List<String> database) {
			this.database = database;
		}
		
	}
	
}



package com.story.domain;

import java.util.List;

public class CharacterInfo {
	private int code;
	private int mask;
	private List<String> data;
	
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
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
	
}

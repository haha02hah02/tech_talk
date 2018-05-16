package com.story.domain;


public class DataObject {
	private int rand1;
	private int rand2;
	private String decodeStr;
	private String origin;
	
	
	static short funneyBox[] = { 0xA1, 0xA4,  0xA7,
		 0xAA,  0xAD, 0xB1,  0xB4, 0xB7,
		 0xBA,  0xBD,  0xC1,  0xC4,  0xC7,
		 0xCA,  0xCD, 0xD1, 0xD4 };

	
	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public DataObject(String input) throws Exception{
		origin = input;
		byte[] base64 = org.apache.commons.codec.binary.Base64.decodeBase64(input.getBytes());
		rand1 =  (base64[0] ^ 0xA1) & 0x0FF;
		rand2 =  (base64[1] ^ funneyBox[rand1 % 0x11]) & 0x0FF;
		decodeStr = decode(base64,rand2);
	}
	
	public DataObject(String input,String tag) throws Exception{
		this(input);
		System.out.println("TAG ->>>>: " + tag + "  decode ----->>>>"+decodeStr);
	}
	
	
	
	public int getRand1() {
		return rand1;
	}

	public void setRand1(int rand1) {
		this.rand1 = rand1;
	}

	public int getRand2() {
		return rand2;
	}

	public void setRand2(int rand2) {
		this.rand2 = rand2;
	}

	public String getDecodeStr() {
		return decodeStr;
	}

	public void setDecodeStr(String decodeStr) {
		this.decodeStr = decodeStr;
	}

	public String decode(byte [] base64,int rand2) throws Exception{
		byte decodeDatas[] = new byte[base64.length - 2];
		for (int i = 0; i < base64.length - 2; i++, rand2++) {
			int index = rand2 % 0x11;
			decodeDatas[i] = (byte) (base64[i + 2] ^ funneyBox[index]);
		}
		String string = "";
		return  new String(decodeDatas);
	}

}

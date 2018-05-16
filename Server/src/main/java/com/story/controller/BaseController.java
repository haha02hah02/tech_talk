package com.story.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.story.dao.DatabaseConnection;
import com.story.domain.Characters;
import com.story.domain.DataObject;
import com.story.domain.HttpClientUtil;
import com.story.domain.Integral;
import com.story.domain.Levels;
import com.story.domain.Possession;
import com.story.domain.User;

public class BaseController {
	static final Logger logger = Logger.getLogger(BaseController.class);
	static short funneyBox[] = { 0xA1, 0xA4,  0xA7,
			 0xAA,  0xAD, 0xB1,  0xB4, 0xB7,
			 0xBA,  0xBD,  0xC1,  0xC4,  0xC7,
			 0xCA,  0xCD, 0xD1, 0xD4 };

	protected static Map<String, HttpSession> sessions = new HashMap<String, HttpSession>(); 
	static boolean debug = false;
	
	public DataObject getDataObject(HttpServletRequest request) throws Exception{
		Enumeration<String> names = request.getParameterNames();
		String elem = names.nextElement().replaceAll(" ", "+");
		return new DataObject(elem,"receive from user phone");
	}
	
	public String test(String url,String name) throws Exception{
		Map<String, String> map = new HashMap<String, String>();	
		HttpClientUtil util = new HttpClientUtil();
		String data = util.doPost("https://design.itavern.org/"+url, name, "utf-8");
		DataObject obj = new DataObject(data,"receive from remote server -> url:"+url);
		return data;
	}
	
	public static String decode(byte [] base64,int rand2) {
		byte decodeDatas[] = new byte[base64.length - 2];
		for (int i = 0; i < base64.length - 2; i++, rand2++) {
			int index = rand2 % 0x11;
			decodeDatas[i] = (byte) (base64[i + 2] ^ funneyBox[index]);
		}
		String string = new String(decodeDatas);
		return string;
	}

	public static String encode(String str,int rand1,int rand2) throws Exception{
		byte[] bs = str.getBytes();
		byte[] encodeByte = new byte[bs.length + 2];

		encodeByte[0] = (byte) (rand1 ^ 0xA1);
		encodeByte[1] = (byte) (funneyBox[(rand1 % 0x11) & 0x0FF] ^ rand2);

		for (int i = 2; i < bs.length + 2; i++, rand2++) {
			int index = (rand2 % 0x11);
			encodeByte[i] = (byte) (bs[i - 2] ^ funneyBox[index]);
		}
		
		return new String(org.apache.commons.codec.binary.Base64.encodeBase64(encodeByte));
	}
	
	
	public Characters getCharacterById(int userId){
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement("select * from characters where id = ?");
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			if(rs.next()){
				return getChar(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	public List<Characters> getCharacters(int userId){
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Characters> list = new ArrayList<Characters>();
		try {
			ps = connection.prepareStatement("select * from characters where belong = ?");
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()){
				list.add(getChar(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public List<Integral> getIntegrals(int id){
		List<Integral> list = new ArrayList<Integral>();
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement("select * from coin where belong = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				Integral integral = new Integral();
				integral.setSerial(rs.getInt("id"));
				integral.setBelong(rs.getInt("belong"));
				integral.setQuantity(rs.getInt("quantity"));
				integral.setLimit(rs.getInt("limit"));
				integral.setProvenance(rs.getString("provenance"));
				integral.setCheckCode(rs.getString("check_code"));
				list.add(integral);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	public boolean checkAccount(String name){
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement("select count(*) from user where name = ?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getInt("count(*)") > 0){
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	
	public boolean checkName(String name){
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement("select count(*) from characters where name = ?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getInt("count(*)") > 0){
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	private Characters getChar(ResultSet rs) throws SQLException{
		Characters ch = new Characters();
		ch.setSerial(rs.getInt("id"));
		ch.setName(rs.getString("name"));
		ch.setBelong(rs.getInt("belong"));
		ch.setHp(rs.getInt("hp"));
		ch.setMp(rs.getInt("mp"));
		ch.setExp(rs.getInt("exp"));
		ch.setBody(rs.getInt("body"));
		ch.setHair(rs.getInt("hair"));
		ch.setFace(rs.getInt("face"));
		ch.setEardrop(rs.getInt("eardrop"));
		ch.setCap(rs.getInt("cap"));
		ch.setLongcoat(rs.getInt("longcoat"));
		ch.setShoes(rs.getInt("shoes"));
		ch.setGlove(rs.getInt("glove"));
		ch.setCape(rs.getInt("cape"));
		ch.setPants(rs.getInt("pants"));
		ch.setCoat(rs.getInt("coat"));
		ch.setWeapon(rs.getInt("weapon"));
		ch.setJob(rs.getInt("job"));
		ch.setMap(rs.getInt("map"));
		ch.setRmap(rs.getInt("rmap"));
		ch.setMtime(rs.getInt("mtime"));
		ch.setCtime(rs.getInt("ctime"));
		ch.setCheckCode(rs.getString("checkcode"));
		return ch;
	}
	
	
	public Characters insertChar(Characters ch,int userId){
		
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement("insert into characters(name,belong,job,body,hair,face,coat,pants,shoes,weapon,mtime,ctime,,map,rmap,hp,mp,exp) values(?,?,?,?,?,?,?,?,?,1302000,CURRENT_TIMESTAMP () ,CURRENT_TIMESTAMP() ,100000000,100000000,50,50,0)");
			ps.setString(1, ch.getName());
			ps.setInt(2, userId);
			ps.setInt(3, ch.getJob());
			ps.setInt(4, ch.getBody());
			ps.setInt(5, ch.getHair());
			ps.setInt(6, ch.getFace());
			ps.setInt(7, ch.getCoat());
			ps.setInt(8, ch.getPants());
			ps.setInt(9, ch.getShoes());
			ps.executeUpdate();
			PreparedStatement statement = connection.prepareStatement("select * from characters where name = ?");
			statement.setString(1,  ch.getName());
			rs = statement.executeQuery();
			if(rs.next()){
				return getChar(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;		
	}
	
	
	public List<Possession> getPossessions(int charId){
		
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Possession> list = new ArrayList<Possession>();
		try {
			ps = connection.prepareStatement("select * from possession where belong = ?");
			ps.setInt(1, charId);
			rs = ps.executeQuery();
			while(rs.next()){
				Possession possession = new Possession();
				possession.setBelong(charId);
				possession.setId(rs.getInt("id"));
				possession.setCheckCode(rs.getString("check_code"));
				possession.setProvenance(rs.getString("provenance"));
				possession.setLimit(rs.getInt("limit"));
				possession.setQuantity(rs.getInt("quantity"));
				possession.setCheckCode(rs.getString("check_code"));
				list.add(possession);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	public Levels getLevel(int charId){
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
	
		try {
			ps = connection.prepareStatement("select * from levels where belong = ?");
			ps.setInt(1, charId);
			rs = ps.executeQuery();
			if(rs.next()){
				Levels level = new Levels();
				level.setId(rs.getInt("id"));
				level.setBelong(charId);
				level.setLevel(rs.getInt("level"));
				level.setCheckCode(rs.getString("check_code"));
				return level;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public User getUserByName(String name){
		User user =new User();
		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement("select * from user where name = ?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			if(rs.next()){
				user.setSerial(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setInvitation(rs.getString("invitation"));
				user.setSex(rs.getInt("sex"));
				user.setGm(rs.getInt("gm") == 1);
				user.setBan(rs.getInt("ban") == 1);
				user.setVersion(rs.getInt("version"));
				user.setCheckCode(rs.getString("checkCode"));
				user.setIp(rs.getString("ip"));
				user.setCtime(rs.getTimestamp("ctime").getTime()/ 1000);
				user.setSignTime(rs.getTimestamp("signTime").getTime()/ 1000);
				user.setLastTime(rs.getTimestamp("lastTime").getTime()/ 1000);
				user.setBanTime(rs.getTimestamp("banTime").getTime()/ 1000);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	

}

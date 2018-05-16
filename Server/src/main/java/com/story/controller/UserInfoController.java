package com.story.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.story.domain.Characters;
import com.story.domain.DataObject;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController extends BaseController {
	
	@RequestMapping(value = "/name")
	@ResponseBody
	//{"name":"66666"}
	public String checkName(HttpServletRequest request) throws Exception {
		DataObject object = getDataObject(request);
		if(debug){			
			return test("userinfo/name", object.getOrigin());
		}
		JSONObject jobj = new JSONObject(object.getDecodeStr());
		String name = jobj.getString("name");
		boolean canCareate = checkName(name);
		if(canCareate){
			return encode("{\"code\":0,\"mask\":1009119684}", 0, 0);
		}
		//{"code":0,"mask":1009119684}
		return encode("{\"code\":1,\"mask\":1009119684}", 0, 0);
	}
	
	
	@RequestMapping(value = "/new")
	@ResponseBody
//{"name":"66666","job":100,"body":2000,"hair":35800,"face":20000,"coat":1040002,"pants":1060002,"shoes":1072005,"map":104000000,"token":"5d81761a5828029d8ee01fc1823ab84a66dd21cf"}
	
	public String newChar(HttpServletRequest request) throws Exception {
		DataObject object = getDataObject(request);
		
		if(debug){			
			return test("userinfo/new", object.getOrigin());
		}
		
		Characters character = new Gson().fromJson(object.getDecodeStr(), Characters.class);
		JSONObject jsonObject = new JSONObject(object.getDecodeStr());
		HttpSession session = sessions.get(jsonObject.getString("token"));
		if(session!=null){
			JSONObject ret = new JSONObject();
			Characters insertChar = insertChar(character, (Integer)session.getAttribute("accId"));
			ret.accumulate("code", 0);
			ret.accumulate("mask", 0);
			List<String> data =new ArrayList<String>();
			data.add(insertChar.toString());
			ret.accumulate("data", data);
			return encode(ret.toString(),0,0);
		}

		
		//String str = test("userinfo/new",object.getOrigin());
//{"code":0,"data":["insert.into.Userinfo{serial = 10501,name = '66666',belong = 10058,body = 2000,hair = 35800,face = 20000,coat = 1040002,pants = 1060002,shoes = 1072005,job = 100,map = 104000000,ctime = 0,mtime = 0,}"],"mask":1892163958}
		return encode("{\"code\":1,\"mask\":1009119684}", 0, 0);
	}
	
	
	@RequestMapping(value = "/magicbox")
	@ResponseBody
	public String magicBox(HttpServletRequest request) throws Exception{
		
		return encode("{\"code\":0,\"mask\":1009119684}", 0, 0);
	}
	
	
}

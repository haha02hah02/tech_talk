package com.story.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.story.domain.DataObject;
import com.story.domain.HttpClientUtil;
import com.story.domain.Version;

@Controller
@RequestMapping("/system")
public class SystemController extends BaseController {

	@RequestMapping(value = "/version")
	@ResponseBody
	//{"version":105003}
	public String getVersion(HttpServletRequest request) throws Exception {
		DataObject dataObject = getDataObject(request);
		//test("system/version", dataObject.getOrigin());
		
		//String json = encode(new Gson().toJson(version),dataObject.getRand1(),dataObject.getRand2());
		return test("system/version", dataObject.getOrigin());
	}
	
	@RequestMapping(value = "/snapshoot")
	@ResponseBody
	/**
	 * 存档
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public String snapshoot(HttpServletRequest request) throws Exception {
		DataObject dataObject = getDataObject(request);
		logger.info(dataObject.getDecodeStr());
		return "";
	}
	

	@RequestMapping(value = "/lranking/{start}/{end}/{type}")
	@ResponseBody
	//{"token":"90fd52b55da03844c813792dac32e6be6dea3b62"}
	//type 0 is ranking all 
	//type 1 is ranking job
	public String lranking(@PathVariable int start,@PathVariable int end,@PathVariable int type, HttpServletRequest request) throws Exception{
			DataObject object = getDataObject(request);
		
			//{"code":0,"data":[{"name":"\u6709\u6587\u5316\u7684\u4eba","job":100,"level":150},{"name":"Faith_Africa","job":510,"level":149},{"name":"\u7c73\u8fe6\u52d2","job":100,"level":135},{"name":"\u8ba9\u9171\u6cb9\u98de\u8d77","job":100,"level":120},{"name":"\u901b\u8857\u5403\u74dc","job":100,"level":120},{"name":"\u5201\u6c11","job":100,"level":120},{"name":"Polaris","job":100,"level":120},{"name":"\u68a6\u9b47\u7efd\u837c\u863c","job":400,"level":119},{"name":"\u98de\u7fd4","job":400,"level":118},{"name":"super","job":510,"level":117},{"name":"\u9e64\u4e00\u3002","job":400,"level":98},{"name":"\u82b1\u513f\u76d7\u604b\u8349","job":530,"level":90},{"name":"Seven","job":100,"level":89},{"name":"\u706f\u706b\u9611\u73ca\u33d2","job":100,"level":86},{"name":"\u9ed1\u9f99\u4e8c\u4ee3","job":210,"level":86},{"name":"Sherry\u4e36\u99a8","job":300,"level":84},{"name":"\u5e06\u5e03\u978b\u7684\u9a84\u50b2","job":510,"level":83},{"name":"\u866b\u866b","job":100,"level":82},{"name":"Norzt.","job":530,"level":82},{"name":"\u7bad\u7075\u4e36","job":100,"level":82}],"mask":513883490}
		return test("system/lranking",object.getOrigin());
	} 
	
	
	@RequestMapping(value = "/report")
	@ResponseBody
	public String report(HttpServletRequest request) {
		Enumeration<String> names = request.getParameterNames();
		String elem = names.nextElement();
		return "";
	}
	

}

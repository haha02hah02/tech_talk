package com.story.controller;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.deser.ValueInstantiators.Base;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.story.domain.DataObject;

@Controller
@RequestMapping("/invitation")
public class Invitation extends BaseController{
	@RequestMapping(value = "/verify/{code}")
	@ResponseBody
	public String verify(@PathVariable String code,HttpServletRequest request) throws Exception{
		//DataObject object = getDataObject(request);
		//{"code":200000,"mask":307044094}
		
		return encode("{\"code\":0,\"mask\":307044094}", 0, 0);
	}
}

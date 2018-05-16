package com.story.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.story.domain.DataObject;

@Controller
@RequestMapping("/exchange")
public class ExchangeController extends BaseController{
	@RequestMapping(value = "/get/{start}/{end}")
	@ResponseBody
	//{"job":530,"major_job":500,"coin":true,"integral":true,"sort":true,"token":"091a4ada3d999d32b38cae4de091542633124782"}
	public String get(@PathVariable int start,@PathVariable int end, HttpServletRequest request) throws Exception{
			DataObject object = getDataObject(request);
		
		return test("exchange/get",object.getOrigin());
	} 
}

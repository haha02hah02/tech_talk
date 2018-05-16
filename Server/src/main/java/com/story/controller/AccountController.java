package com.story.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.story.domain.Account;
import com.story.domain.Authorize;
import com.story.domain.CharacterInfo;
import com.story.domain.Characters;
import com.story.domain.DataObject;
import com.story.domain.Integral;
import com.story.domain.Possession;
import com.story.domain.User;

@Controller
@RequestMapping("/account")
public class AccountController extends BaseController {

	@RequestMapping(value = "/authorize")
	@ResponseBody
	/**
	 * 登陆
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public String authorize(HttpServletRequest request, HttpSession session)
			throws Exception {
		DataObject object = getDataObject(request);
		if (debug) {
			return test("account/authorize", object.getOrigin());
		}
		Account account = new Gson().fromJson(object.getDecodeStr(),
				Account.class);
		User user = getUserByName(account.getName());
		if (user.getPassword().equalsIgnoreCase(account.getPassword())) {
			logger.info("登陆成功");
			long expire = System.currentTimeMillis() + 20 * 60 * 1000;
			String token = session.getId();
			sessions.put(token, session);
			Authorize authorize = new Authorize();
			authorize.setCode(0);
			authorize.setData(new Authorize.Data(token, expire));
			authorize.setMask(new Random().nextInt());
			session.setAttribute("user", user);
			session.setAttribute("accId", user.getSerial());
			return encode(new Gson().toJson(authorize), 0, 0);

		}

		return encode("{\"code\" : 300300,\"mask\" : 1466996768}", 0, 0);
	}

	@RequestMapping(value = "/data")
	@ResponseBody
	/**
	 * 请求所有角色信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public String data(HttpServletRequest request) throws Exception {
		DataObject object = getDataObject(request);//
		logger.info("call -> account/data");
		if (debug) {
			return test("account/data", object.getOrigin());
		}
		JSONObject jsonObject = new JSONObject(object.getDecodeStr());
		HttpSession session = sessions.get(jsonObject.getString("token"));
		if (session != null) {
			User user = (User) session.getAttribute("user");
			List<Characters> characters = getCharacters(user.getSerial());
			List<Integral> list = getIntegrals(user.getSerial());
			List<String> data = new ArrayList<String>();
			CharacterInfo info = new CharacterInfo();
			data.add(user.toString());

			for (Characters ch : characters) {
				data.add(ch.toString());
			}
			for (Integral ch : list) {
				data.add(ch.toString());
			}
			data.add("update.config.value{SystemExpMultiple = 0, SystemDropMultiple = 0}");
			info.setCode(0);
			info.setMask(0);
			info.setData(data);
			Gson gs = new GsonBuilder().setPrettyPrinting()
					.disableHtmlEscaping().create();
			String str = gs.toJson(info);
			logger.info(str);
			return encode(str, 0, 0);
		}
		return "";
	}

	@RequestMapping(value = "/token")
	@ResponseBody
	// {"token":"091a4ada3d999d32b38cae4de091542633124782"}
	public String token(HttpServletRequest request) throws Exception {
		DataObject object = getDataObject(request);
		logger.info("call -> token");
		return "";
	}

	@RequestMapping(value = "/switch")
	@ResponseBody
	// {"token":"091a4ada3d999d32b38cae4de091542633124782","user":userId}
	/**
	 * 切换角色登陆游戏
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public String switchUser(HttpServletRequest request) throws Exception {
		DataObject object = getDataObject(request);
		if (debug) {
			return test("account/switch", object.getOrigin());
		}

		/*
		 * if(true){ String str = "{\"code\":0,\"data\":[" +
		 * "\"insert.into.Possession{serial = 9999, belong = 10000, quantity = 0, limit = 0, provenance = 'system', check_code = '75ba10c36175e8b6c7f7ba9dc46efd4f7d6556c6'}\","
		 * +
		 * "\"insert.into.Possession{serial = 10000, belong = 10000, quantity = 5000000, limit = 1, provenance = 'system'}\","
		 * +
		 * "\"insert.into.Levels{serial = 10000, belong = 10000, level = 200}\","
		 * + "\"update.increment.Items \"10003\"\"," +
		 * "\"insert.into.Items{identify = 198312,serial = 10000,belong = 10000,item_id = 1040002,amount = 1,site = 'equips',level = 0,slevel = 0,tradable = true,provenance = 'system',ctime = 0,mtime = 0,}\","
		 * +
		 * "\"insert.into.Items{identify = 198313,serial = 10001,belong = 10000,item_id = 1060002,amount = 1,site = 'equips',level = 0,slevel = 0,tradable = true,provenance = 'system',ctime = 0,mtime = 0,}\","
		 * +
		 * "\"insert.into.Items{identify = 198314,serial = 10002,belong = 10000,item_id = 1072005,amount = 1,site = 'equips',level = 0,slevel = 0,tradable = true,provenance = 'system',ctime = 0,mtime = 0,}\"],\"mask\":1849476206}"
		 * ; return encode(str, new Random().nextInt(128), new
		 * Random().nextInt(128)); }
		 */

		JSONObject jsonObject = new JSONObject(object.getDecodeStr());
		HttpSession session = sessions.get(jsonObject.getString("token"));
		if (session != null) {
			JSONObject ret = new JSONObject();
			int charId = jsonObject.getInt("user");
			ret.accumulate("code", 0);
			ret.accumulate("mask", 12312312);
			List<String> data = new ArrayList<String>();
			Characters ch = getCharacterById(charId);
			data.add(ch.toString());
			List<Possession> possessions = getPossessions(charId);
			for (Possession p : possessions) {
				data.add(p.toString());
			}
			data.add(getLevel(charId).toString());
			ret.accumulate("data", data);
			logger.info(ret.toString());
			return encode(ret.toString(), new Random().nextInt(128),
					new Random().nextInt(128));
		}
		return "";
	}

	
	
	@RequestMapping(value = "/name")
	@ResponseBody
	/**
	 * 检查账号是否存在
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public String name(HttpServletRequest request) throws Exception {
		DataObject object = getDataObject(request);//
		logger.info(object.getDecodeStr());
		String name = new JSONObject(object.getDecodeStr()).getString("name");
		if (checkAccount(name)) {
			return encode("{\"code\":0,\"mask\":1009119684}", 0, 0);
		}
		return encode("{\"code\":1,\"mask\":1009119684}", 0, 0);
	}

}

/**
 * @Title : WebsocketController1
 * @Description ： 
 * @Author : pc
 * @date 2016年12月4日 下午1:45:58
 */
package com.peace.ostp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * websocket控制器
 * @author GGR
 *
 */
@Controller
@RequestMapping("admin")
public class WebsocketController {
	
	@RequestMapping(value = "/toWebsocket", method = {RequestMethod.GET,RequestMethod.POST})
	private String WebSocketimpl() {
		return "admin/websocket/websocket";
	}
}
package com.abilists.client.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.abilists.bean.AbilistsModel;
import com.abilists.core.controller.AbstractBaseController;

@Controller
@RequestMapping("/client")
public class ClientController extends AbstractBaseController {

	final Logger logger = LoggerFactory.getLogger(ClientController.class);

    @RequestMapping(value = {"/", "", "index"}, method=RequestMethod.GET)
	public String index(HttpSession session, ModelMap model) throws Exception {
		AbilistsModel abilistsModel = new AbilistsModel();
		abilistsModel.setNavi("index");

	   	model.addAttribute("model", abilistsModel);
		return "client/index";
	}

}
package com.abilists.client.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.abilists.bean.AbilistsModel;
import com.abilists.controller.host.HostController;

@Controller
@RequestMapping("/client")
public class ClientController extends HostController {

	final Logger logger = LoggerFactory.getLogger(ClientController.class);

	public ClientController() {
		super();
	}

    @Autowired
    ServletContext servletContext;

    @Autowired
    private ApplicationContext appContext;

	@Autowired
	private ConfigurableApplicationContext configurableContext;

	@Override
    @RequestMapping(value = {"/", "", "index"}, method=RequestMethod.GET)
	public String index(HttpSession session, ModelMap model) throws Exception {
		AbilistsModel abilistsModel = new AbilistsModel();
		abilistsModel.setNavi("index");

		logger.info(System.getProperty("java.class.path"));

	   	model.addAttribute("model", abilistsModel);
		return "client/index";
	}

    @RequestMapping(value = {"restart", "reloadContext"})
	public void restart(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

////        Tomcat tomcat = getTomcatInstance();
////        tomcat.enableNaming();
////
////        // No file system docBase required
////        StandardContext ctx = (StandardContext) tomcat.addContext("", null);
//
//    	String webappDirLocation = "src/main/webapp/";
//    	
//    	Tomcat tomcat = new Tomcat();
//    	
//    	String webPort = System.getenv("PORT");
//        if(webPort == null || webPort.isEmpty()) {
//            webPort = "8081";
//        }
//        tomcat.setPort(Integer.valueOf(webPort));
//        StandardContext ctx = (StandardContext) tomcat.addContext("", null);
//    	//StandardContext ctx = (StandardContext) tomcat.addWebapp("/", new File(webappDirLocation).getAbsolutePath());
//        logger.info("configuring app with basedir: " + new File("./" + webappDirLocation).getAbsolutePath());
//
//        ctx.reload();

//    	StandardContext ctx = (StandardContext) tomcat.addContext("", null);
//    	ctx.reload();
    	
//    	if (servletContext instanceof StandardContext) {
//            logger.info("=========== StandardContext ==========");
//            ((StandardContext) servletContext).reload();
//        } else {
//        	logger.info("=========== No StandardContext ==========");
//        }

	}

}
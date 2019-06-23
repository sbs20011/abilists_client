package com.abilists.client;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.ContextStartedEvent;
import org.springframework.context.event.ContextStoppedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class RestarterSpring {

	final Logger logger = LoggerFactory.getLogger(RestarterSpring.class);

	@EventListener
    public void handleContextRefresh(ContextRefreshedEvent event) {
		logger.warn("Context Refresh Event received.");
    }

	@EventListener
	public void handleStoppedEvents(ContextStoppedEvent event) {
		logger.warn("Context Stop Event received.");

	}

	@EventListener
	public void handleStartedEvents(ContextStartedEvent event) {
		logger.warn("Context Start Event received.");
	}
	
	public void test () {
		// TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory();
	}

//	@EventListener(classes = { ContextStartedEvent.class, ContextStoppedEvent.class })
//	public void handleMultipleEvents() {
//	    System.out.println("Multi-event listener invoked");
//	}

}

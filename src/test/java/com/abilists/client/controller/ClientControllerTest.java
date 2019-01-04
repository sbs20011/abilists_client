package com.abilists.client.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Test;

public class ClientControllerTest extends AbstractControllerTest {

	@Test
	public void testsltSample() throws Exception {
		
		System.out.println("test");
		this.mockMvc.perform(get("/home"))
			.andExpect(status().isOk())
			;//.andExpect(model().attributeExists("model"));
	}

}
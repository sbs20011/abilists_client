package com.abilists.client.service.impl;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.abilists.client.service.AbstractServiceTest;

public class ClientServiceImplTest extends AbstractServiceTest {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Test
	public void utdSeedKeyTest() throws Exception {
		assertEquals(true, passwordEncoder.encode("rawPassword"));
	}

}

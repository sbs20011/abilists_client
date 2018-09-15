package com.abilists.client.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.abilists.bean.model.user.UsersModel;
import com.abilists.client.service.ClientService;
import com.abilists.core.service.AbilistsAbstractService;

import base.bean.para.CommonPara;

@Service
public class ClientServiceImpl extends AbilistsAbstractService implements ClientService {

	final Logger logger = LoggerFactory.getLogger(ClientServiceImpl.class);
	public static final String REQ_PARA = "update";

	@Autowired
	private SqlSession mAbilistsDao;
	@Autowired
	private SqlSession sAbilistsDao;

	@Override
	public List<UsersModel> sltCleintList(CommonPara commonPara) throws Exception {
		return null;
	}

	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean istCleint(CommonPara commonPara) throws Exception {
		return true;
	}

	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean udtUCleint(CommonPara commonPara) throws Exception {
		return true;
	}

	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	public boolean dltCleint(CommonPara commonPara) throws Exception {
		return true;
	}

}
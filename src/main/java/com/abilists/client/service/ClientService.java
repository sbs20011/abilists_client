package com.abilists.client.service;

import java.util.List;

import com.abilists.bean.model.account.UsersModel;

import base.bean.para.CommonPara;

public interface ClientService {

	public List<UsersModel> sltCleintList(CommonPara commonPara) throws Exception;
	public boolean istCleint(CommonPara commonPara) throws Exception;
	public boolean udtUCleint(CommonPara commonPara) throws Exception;
	public boolean dltCleint(CommonPara commonPara) throws Exception;

}

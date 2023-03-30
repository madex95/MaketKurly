package com.marketkurly.www.admin.grant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.grant.domain.ExGrantAbled;
import com.marketkurly.www.admin.grant.domain.Grant;
import com.marketkurly.www.admin.grant.domain.GrantAbled;
import com.marketkurly.www.admin.grant.mapper.GrantMapper;
import com.marketkurly.www.admin.menu.domain.Menu;
import com.marketkurly.www.admin.menu.domain.SubMenu;

@Service
public class test {
	@Autowired
	GrantMapper grantMapper;

	public void addGrant(Grant grant) {
		if (grant.getAbled() == null)
			grant.setAbled("N");
		grantMapper.addGrant(grant);
	}

	public List<Grant> getGrantList() {
		return grantMapper.getGrantList();
	}

	public List<SubMenu> getSubMenuList(String menu_code) {
		return grantMapper.getSubMenuList(menu_code);
	}

	public List<Menu> getMenuList() {
		return grantMapper.getMenuList();
	}

	public void insertGrant(String code, List<String> abled) {
		List<String> subMenu = grantMapper.getSubMenuCodeList();
		GrantAbled grantAbled = new GrantAbled();
		grantAbled.setGrant_code(code);

		if (abled != null) {
			for (String i : abled) {
				subMenu.remove(i);
				grantAbled.setMenu_code(i);
				if (grantMapper.getGrantAbled(grantAbled) == 0)
					grantMapper.insertGrant(grantAbled);
			}
		}
		for (String i : subMenu) {
			grantAbled.setMenu_code(i);
			grantMapper.deleteGrant(grantAbled);
		}
	}
	
	public List<String> getGrantAbledAll(String code) {
		return grantMapper.getGrantAbledAll(code);
	}

	public String getExGrantAbledCount(String code) {
		return grantMapper.getExGrantAbledCount(code);
	}

	public void addExGrantAbled(ExGrantAbled exGrantAbled) {
		grantMapper.addExGrantAbled(exGrantAbled);
	}

	public List<ExGrantAbled> getExGrantAbledList() {
		return grantMapper.getExGrantAbledList();
	}

	public List<String> getExGrantAbledAll(String code) {
		return grantMapper.getExGrantAbledAll(code);
	}

	public Grant getGrantInfo(String code) {
		return grantMapper.getGrantInfo(code);
	}

	public void updateGrant(Grant grant) {
		if (grant.getAbled() == null)
			grant.setAbled("N");
		grantMapper.updateGrant(grant);
	}

	public void updategrantAbled(String code) {
		grantMapper.updategrantAbled(code);
	}

	public ExGrantAbled getExGrantInfo(String code) {
		return grantMapper.getExGrantInfo(code);
	}

	public void updateGrantAbled(ExGrantAbled exGrantAbled) {
		grantMapper.updateGrantAbled(exGrantAbled);
	}

	public void deleteGrantAbled(String code) {
		grantMapper.deleteExgrantabledlist(code);
		grantMapper.deleteGrantAbled(code);
	}
}

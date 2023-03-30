package com.marketkurly.www.admin.menu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marketkurly.www.admin.grant.domain.GrantAbled;
import com.marketkurly.www.admin.menu.domain.Menu;
import com.marketkurly.www.admin.menu.domain.MenuName;
import com.marketkurly.www.admin.menu.domain.Nav;
import com.marketkurly.www.admin.menu.domain.SubMenu;
import com.marketkurly.www.admin.menu.mapper.MenuMapper;

@Service
public class MenuService {
	@Autowired
	private MenuMapper menuMapper;

	public String exitMenuCode(String menu_code) {
		return menuMapper.exitMenuCode(menu_code);
	}

	public void addMenu(Menu menu) {
		if (menu.getAbled() == null)
			menu.setAbled("N");
		if (menu.getUpdate_abled() == null)
			menu.setUpdate_abled("N");
		menuMapper.addMenu(menu);
	}

	public List<Menu> getMenuList() {
		return menuMapper.getMenuList();
	}

	public String exitSubMenuCode(String menu_code) {
		return menuMapper.exitSubMenuCode(menu_code);
	}

	public void addSubMenu(SubMenu subMenu) {
		if (subMenu.getAbled() == null)
			subMenu.setAbled("N");
		if (subMenu.getUpdate_abled() == null)
			subMenu.setUpdate_abled("N");
		menuMapper.addSubMenu(subMenu);
	}

	public List<SubMenu> getSubMenuList(String menu_code) {
		return menuMapper.getSubMenuList(menu_code);
	}

	public List<Menu> getMenuNameList() {
		return menuMapper.getMenuNameList();
	}

	// 내비바
	public List<List<Nav>> nav(String id) {
		List<Menu> menuNameList = menuMapper.getMenuNameList();
		List<List<Nav>> navList = new ArrayList<List<Nav>>();
		String getGrant = menuMapper.getGrant(id);

		GrantAbled grantAbled = new GrantAbled();
		grantAbled.setGrant_code(getGrant);
		for (int i = 0; i < menuNameList.size(); i++) {
			grantAbled.setMenu_code(menuNameList.get(i).getMenu_code());
			List<Nav> subMenu = menuMapper.getSubMenuNameList(grantAbled);
			if (subMenu.size() == 0) {
				menuNameList.remove(i);
				i--;
				continue;
			}
			Nav nav = new Nav();
			nav.setMenu_name(menuNameList.get(i).getMenu_name());
			subMenu.add(0, nav);
			navList.add(subMenu);
		}
		return navList;
	}

	public MenuName getSubMenuName(String menu_address) {
		return menuMapper.getSubMenuName(menu_address);
	}

	public String getUpdateAbled(String menu_code) {
		return menuMapper.getUpdateAbled(menu_code);
	}

	public void updateMenuAbled(String menu_code) {
		menuMapper.updateMenuAbled(menu_code);
	}

	public String getSubUpdateAbled(String menu_code) {
		return menuMapper.getSubUpdateAbled(menu_code);
	}

	public void updateSubMenuAbled(String menu_code) {
		menuMapper.updateSubMenuAbled(menu_code);
	}

	public void deleteMenu(String menu_code) {
		menuMapper.deleteMenu(menu_code);
		menuMapper.deleteAllSubMenu(menu_code);
	}

	public void deleteSubMenu(String menu_code) {
		menuMapper.deleteSubMenu(menu_code);
	}

	public Menu getMenuInfo(String menu_code) {
		return menuMapper.getMenuInfo(menu_code);
	}

	public void updateMenu(Menu menu) {
		if (menu.getAbled() == null)
			menu.setAbled("N");
		if (menu.getUpdate_abled() == null)
			menu.setUpdate_abled("N");
		menuMapper.updateMenu(menu);
	}

	public SubMenu getSubMenuInfo(String menu_code) {
		return menuMapper.getSubMenuInfo(menu_code);
	}

	public void updateSubMenu(SubMenu subMenu) {
		if (subMenu.getAbled() == null)
			subMenu.setAbled("N");
		if (subMenu.getUpdate_abled() == null)
			subMenu.setUpdate_abled("N");
		menuMapper.updateSubMenu(subMenu);
	}
}

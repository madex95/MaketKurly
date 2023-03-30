package com.marketkurly.www.admin.item.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marketkurly.www.admin.category.domain.Category;
import com.marketkurly.www.admin.grant.domain.ExGrantAbledList;
import com.marketkurly.www.admin.item.domain.Item;
import com.marketkurly.www.admin.item.domain.ItemHistory;
import com.marketkurly.www.admin.item.mapper.ItemMapper;

@Service
public class ItemService {
	@Autowired
	private ItemMapper itemMapper;

	// id
	public String getId() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String nowId = "";
		if (principal != null) {
			nowId = auth.getName();
		}
		return nowId;
	}

	// 상품 리스트
	public List<Item> getItemList() {
		ExGrantAbledList grantAbled = new ExGrantAbledList();
		grantAbled.setGrant_code(getId());
		grantAbled.setExGrant_code("getItem");
		if (itemMapper.isGrantGetItem(grantAbled) != null)
			return itemMapper.getItemList();
		else
			return itemMapper.getMyItemList(getId());
	}

	// 상품 코드 유무 검사
	public String exitItemCode(String item_code) {
		return itemMapper.exitItemCode(item_code);
	}

	// 카테고리 리스트
	public List<Category> getCategoryList() {
		return itemMapper.getCategoryList();
	}

	// 상품 추가
	public void addItem(String rootPath, List<MultipartFile> files, Item item, String date, String sDate) {
		item.setUser_id(getId());
		
		if(files!=null) {
			String basePath = rootPath + "/market/item/"+date;
			File test = new File(basePath);
			test = new File(basePath);
			if (!test.exists())
				test.mkdir();
	
			try {
				for (int i = 0; i < files.size(); i++) {
					String filePath = basePath + "/" + item.getItem_code() + sDate + i + files.get(i).getOriginalFilename();
					File dest = new File(filePath);
					files.get(i).transferTo(dest);
				}
				if (item.getAbled() == null)
					item.setAbled("N");
				itemMapper.addItem(item);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}else itemMapper.addItem(item);
	}

	// 상품 사용여부 변경
	public void updateItemAbled(String item_code) {
		itemMapper.updateItemAbled(item_code);
	}

	// 상품 정보 조회
	public Item getItemInfo(String item_code) {
		return itemMapper.getItemInfo(item_code);
	}

	public boolean updateItem(String rootPath,List<MultipartFile> files, Item item) {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
		String imgAll = itemMapper.getItemImg(item.getItem_code());

		if (!files.get(0).getOriginalFilename().equals("")) {
			// 이미지 검사
			String name = "";
			for (int i = 0; i < files.size(); i++)
				name += ":" + format1.format(date) + i + files.get(i).getOriginalFilename();
	
			if (name.getBytes().length > 2000)
				return false;
			
			if(!files.get(0).getOriginalFilename().equals("")) {
				item.setItem_image(name);
				String basePath = rootPath + "/market/item/" + itemMapper.getItemOriDate(item.getItem_code());
	
				try {
					for (int i = 0; i < files.size(); i++) {
						String filePath = basePath + "/" + item.getItem_code() + format1.format(date) + i + files.get(i).getOriginalFilename();
						File dest = new File(filePath);
						files.get(i).transferTo(dest);
					}
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			itemMapper.updateItemImage(item);
		}
		itemMapper.insertItemHistory(itemMapper.getItemInfoAll(item.getItem_code()));
		if (item.getAbled() == null)
			item.setAbled("N");
		itemMapper.updateItem(item);
		return true;
	}
	
	public Item getItemInfoCG(String item_code) {
		return itemMapper.getItemInfoCG(item_code);
	}

	public List<ItemHistory> getItemHistoryList(String item_code) {
		return itemMapper.getItemHistoryList(item_code);
	}

	public List<ItemHistory> searchItemHistory(ItemHistory itemHistory) {
		return itemMapper.searchItemHistory(itemHistory);
	}
}

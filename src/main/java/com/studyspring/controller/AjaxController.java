package com.studyspring.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.studyspring.service.UserInfoService;
import com.studyspring.vo.UserInfoDeleteRequestVO;

@Controller
public class AjaxController {
	@Autowired
	UserInfoService userInfoService;
	
	//Study 9//
	@RequestMapping(value = "/searchuser", method = RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> searchUser(@RequestBody Map<String, Object> params) { 
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("ajax call: " + params.get("name"));
		
		retVal.put("val", "1");
		retVal.put("info", userInfoService.searchNameService(params));
			
		return retVal;
	}
	
	@RequestMapping(value = "/deleteuser", method = RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> deleteUser(@RequestBody UserInfoDeleteRequestVO userInfoDeleteRequestVO) { 
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("ajax call: " + userInfoDeleteRequestVO.getUserName());
		
		retVal.put("val", "1");
		retVal.put("deleteval", userInfoService.deleteUserInfoService(userInfoDeleteRequestVO));
			
		return retVal;
	}
	
	//Study 10//
	@RequestMapping(value = "/enrollajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> enrollStudent(MultipartHttpServletRequest multi) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("------------------<<File Upload>>---------------------");

		// 저장 경로 설정
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/";

		File dir = new File(path);

		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		// 전송된 파일들(getFileNames)을 불러오기 위한 반복자(Formdata 탐색)//
		Iterator<String> files = multi.getFileNames();

		while (files.hasNext()) {
			String uploadFile = files.next();
           
		    MultipartFile mFile = multi.getFile(uploadFile);
		    
		    String fileName_original = mFile.getOriginalFilename();
		    //현재 프로젝트(서버)의 resources 경로//
		    String file_save_path = "/Users/macbook/git/StudySpring/src/main/webapp/resources/upload/";
		             
		    try {
		    	mFile.transferTo(new File(file_save_path+fileName_original));
		    	
		    	System.out.println("전송된 파일 이름 : " +fileName_original);
			    //System.out.println("파일 이름: " + newFileName);
			    System.out.println("파일 사이즈: " + mFile.getSize());
				
				System.out.println("------------------------------------------------------");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 파일 이외의 text데이터//
		System.out.println("subject: " + multi.getParameter("subject"));
		System.out.println("content: " + multi.getParameter("content"));
	
		retVal.put("retVal", "true");
		
		return retVal;
	}
}

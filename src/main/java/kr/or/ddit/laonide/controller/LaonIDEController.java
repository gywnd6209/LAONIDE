package kr.or.ddit.laonide.controller;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import kr.or.ddit.chatlog.service.IChatlogService;
import kr.or.ddit.idefile.service.IIdefileService;
import kr.or.ddit.ideworkspace.service.IIdeworkspaceService;
import kr.or.ddit.proInfo.service.IProInfoService;
import kr.or.ddit.utiles.GlobalConstant;
import kr.or.ddit.vo.ChatLogVO;
import kr.or.ddit.vo.IDEWorkspaceVO;
import kr.or.ddit.vo.IdeFileVO;
import kr.or.ddit.vo.ProInfoVO;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;
import org.zeroturnaround.zip.ZipUtil;
@Controller
@RequestMapping("/laonide/")
public class LaonIDEController {

	@Autowired
	private IIdefileService idefile_service;
	
	
	/**
	 * laon ide 진입 메서드 수정 2019.07.15 은혜 : 고유 번호 가지고 있을 수 있도록 변환
	 * 2019.07.22 은혜 : 채팅 로그 로딩하도록 수정
	 * @throws Exception
	 */
	@Autowired
	private IChatlogService chatlog_service;
	@Autowired
	private IProInfoService proinfo_service;
	
	@RequestMapping("laonide")
	public ModelAndView ideTemplate(@RequestParam String pro_link, String pro_code,
			@RequestParam String ide_no,
			ModelAndView andView, 
			Map<String, String> params) throws Exception {
		// 임시변수
		if (pro_link == null || pro_link.equals("")) {
			pro_link = "BWJASK54AR";
		}
			
		params.put("pro_link", pro_link);
		List<ChatLogVO> chatlist = chatlog_service.chatList(params);
		ProInfoVO proInfo = proinfo_service.byProlink(params);
		
		andView.addObject("chatlist", chatlist);
		andView.addObject("pro_link", pro_link);
		andView.addObject("proInfo", proInfo);
		andView.addObject("pro_code", pro_code);
		andView.addObject("ide_no", ide_no);
		return andView;
	}

	/**
	 * 팀 프로젝트에서 IDE진입 최초 클릭시 워크스페이스 만들어주고, ibatis 사용하기 위한 부분
	 */

	@Autowired
	private IIdeworkspaceService idews_service;
	@Autowired
	private IProInfoService proInfo_service;

	String all_ws_path = GlobalConstant.ALL_WORKSPACE;

	@RequestMapping("goToIDE")
	public String goToIDE(@RequestParam String pro_link, @RequestParam String pro_code,
			Map<String, String> params, ProInfoVO proInfo, String ide_no,
			IDEWorkspaceVO idewsInfo) throws Exception {
		// 프로코드의 프로난수로 만들어진 폴더네임이 있는지 알아봐야함.
		params.put("pro_code", pro_code);
		proInfo = proInfo_service.forProlink(params);
		pro_link = proInfo.getPro_link();
		
		boolean isExist = false;
		// 모든 워크스페이스 집합소에 해당 난수 폴더 있는지 알아보기
		File temp_ws_path = new File(all_ws_path);
		File[] temp_wsItemList = temp_ws_path.listFiles();
		if (0 < temp_wsItemList.length) {
			for (int i = 0; i < temp_wsItemList.length; i++) {
				if (temp_wsItemList[i].isDirectory()) {
					if (temp_wsItemList[i].getName().equals(proInfo.getPro_link())) {
						isExist = true;
					}
				}
			}
		}
		String new_wspath = all_ws_path.replace("\\", "/") + "/" + pro_link;;
		if (!isExist) {
			// 없을 경우 폴더를 생성하고 디비에 인서트함
			File new_ws = new File(new_wspath);

			if (!new_ws.exists()) {
				new_ws.mkdirs();
			}
		}
		// 만약의 경우로 db에 이미 들어가 있을 수 있으므로 확인을 거친다.
		params.put("folder_name", pro_link);
		List<IDEWorkspaceVO> wsExist_no = idews_service.isExistWS(params);
		if(wsExist_no.size() == 0){
			idewsInfo.setFolder_name(pro_link);
			idewsInfo.setFolder_path(new_wspath);
			idewsInfo.setPro_code(pro_code);
			idews_service.createWS(idewsInfo);
		}
		
		params.put("pro_code", pro_code);
		idewsInfo = idews_service.selectWSInfo(params);
		ide_no = idewsInfo.getIde_no();
		
		return "redirect:/laonide/laonide.do?pro_link=" + pro_link + "&ide_no=" + ide_no+"&pro_code=" + pro_code;
	}

	/**
	 * 은혜 부분
	 */
	JSONArray allArray;

	/**
	 * 팬시트리 로딩 메서드
	 * 
	 * @param pro_link 팀프로젝트당 부여되는 워크스페이스 이름(난수, 고유)
	 * @author 은혜, 종운
	 */
	@RequestMapping("loadingworkspace")
	public void loadingworkspace(@RequestParam String pro_link, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 난수이름으로 된 폴더명을 찾아 팬시트리에 띄워주는 아작스 수행 메소드
		// 임시 폴더명 : test1workspace
		if (pro_link == null || pro_link.equals("")) {
			pro_link = "test1workspace";
		}
		String str_workspace_path = all_ws_path + "\\" + pro_link;
		str_workspace_path = str_workspace_path.replace("\\", "/");

		/* 원상복귀시 여기부분부터 지우기 */
		allArray = new JSONArray();

		// 폴더 경로
		File ws_path = new File(str_workspace_path);
		// AbsolutePath
		File[] wsItemList = ws_path.listFiles();
		if (0 < wsItemList.length) {
			for (int i = 0; i < wsItemList.length; i++) {
				if (wsItemList[i].isDirectory()) {

					File file_path = new File(wsItemList[i].getAbsolutePath());
					File[] parentItemList = file_path.listFiles();

					JSONObject json_folderItemList = srcFolderToJson(parentItemList, file_path);
					allArray.add(json_folderItemList);
				} else {
//					JSONObject json_fileList = fileToJson(wsItemList[i]);
//					allArray.add(json_fileList);
				}
			}
		} else {
//			JSONObject emptyWs = new JSONObject();
//			emptyWs.put("title", "새로운 프로젝트 생성");
			// emptyWs.put("expanded", true);
			// emptyWs.put("folder", true);
//			allArray.add(emptyWs);
		}

		String json_workspace = allArray.toJSONString();

		json_workspace = json_workspace.replace("\\\\", "/");

		System.out.println(json_workspace);

		PrintWriter out = response.getWriter();
		out.println(json_workspace);
	}

	@RequestMapping("reloadworkspacs")
	public ModelAndView reloadworkspacs(@RequestParam String pro_link, ModelAndView andView)
			throws Exception {
		// 난수이름으로 된 폴더명을 찾아 팬시트리에 띄워주는 아작스 수행 메소드
		// 임시 폴더명 : test1workspace
		if (pro_link == null || pro_link.equals("")) {
			pro_link = "test1workspace";
		}
		String str_workspace_path = all_ws_path + "\\" + pro_link;
		str_workspace_path = str_workspace_path.replace("\\", "/");

		/* 원상복귀시 여기부분부터 지우기 */
		allArray = new JSONArray();

		// 폴더 경로
		File ws_path = new File(str_workspace_path);
		// AbsolutePath
		File[] wsItemList = ws_path.listFiles();
		if (0 < wsItemList.length) {
			for (int i = 0; i < wsItemList.length; i++) {
				if (wsItemList[i].isDirectory()) {

					File file_path = new File(wsItemList[i].getAbsolutePath());
					File[] parentItemList = file_path.listFiles();

					JSONObject json_folderItemList = srcFolderToJson(parentItemList, file_path);
					allArray.add(json_folderItemList);
				} else {
//					JSONObject json_fileList = fileToJson(wsItemList[i]);
//					allArray.add(json_fileList);
				}
			}
		} else {
//			JSONObject emptyWs = new JSONObject();
//			emptyWs.put("title", "새로운 프로젝트 생성");
			// emptyWs.put("expanded", true);
			// emptyWs.put("folder", true);
//			allArray.add(emptyWs);
		}

		andView.addObject("jsonSrc", allArray);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	/**
	 * 폴더를 제이슨 형태로 만듦(src, webcontent만 노출)
	 * 
	 * @param folderItemList
	 * @param param_path
	 * @return
	 * @author 은혜
	 */
	public JSONObject srcFolderToJson(File[] folderItemList, File param_path) {

		// info 하나가 {} 안에 들어갈 것들
		JSONObject json_FancyParent = new JSONObject();
		// 폴더 내 파일 돌면서 파일 제이슨 매핑하는거 만들기
		JSONArray json_FancyChild = new JSONArray();
		// 폴더인 경우
		json_FancyParent.put("title", param_path.getName());
		json_FancyParent.put("expanded", true);
		json_FancyParent.put("folder", true);
		String temp_path = param_path.getAbsolutePath().replace("\\\\", "/");
		// String temp_path = param_path.getAbsolutePath();
		json_FancyParent.put("author", temp_path);

		if (0 < folderItemList.length) {
			for (int i = 0; i < folderItemList.length; i++) {
				if (folderItemList[i].isDirectory()) {
					if (folderItemList[i].getName().equals("src")
							|| folderItemList[i].getName().equals("WebContent")) {

						// 재귀함수 호출을 위한 file[] 추출
						File file_path = new File(folderItemList[i].getAbsolutePath());
						File[] parentItemList = file_path.listFiles();

						JSONObject rtn_folderToJson2 = new JSONObject();
						rtn_folderToJson2 = folderToJson(parentItemList, file_path);
						if (rtn_folderToJson2.size() != 0) {
							json_FancyChild.add(rtn_folderToJson2);
						}
					}

				}
			}
		}
		json_FancyParent.put("children", json_FancyChild);

		return json_FancyParent;

	}

	/**
	 * 폴더를 제이슨 형태로 만듦
	 * 
	 * @param folderItemList
	 * @param param_path
	 * @return
	 * @author 은혜, 종운
	 */
	public JSONObject folderToJson(File[] folderItemList, File param_path) {

		// info 하나가 {} 안에 들어갈 것들
		JSONObject json_FancyParent = new JSONObject();
		// 폴더 내 파일 돌면서 파일 제이슨 매핑하는거 만들기
		JSONArray json_FancyChild = new JSONArray();
		// 폴더인 경우
		json_FancyParent.put("title", param_path.getName());
		json_FancyParent.put("expanded", true);
		json_FancyParent.put("folder", true);
		String temp_path = param_path.getAbsolutePath().replace("\\\\", "/");
		// String temp_path = param_path.getAbsolutePath();
		json_FancyParent.put("author", temp_path);

		if (0 < folderItemList.length) {
			for (int i = 0; i < folderItemList.length; i++) {
				if (folderItemList[i].isDirectory()) {

					// 재귀함수 호출을 위한 file[] 추출
					File file_path = new File(
							folderItemList[i].getAbsolutePath());
					File[] parentItemList = file_path.listFiles();

					JSONObject rtn_folderToJson2 = new JSONObject();
					rtn_folderToJson2 = folderToJson(parentItemList, file_path);
					if (rtn_folderToJson2.size() != 0) {
						json_FancyChild.add(rtn_folderToJson2);
					}

				} else {
					JSONObject json_FancyFile = fileToJson(folderItemList[i]);
					json_FancyChild.add(json_FancyFile);
				}
			}
		}
		json_FancyParent.put("children", json_FancyChild);

		return json_FancyParent;

	}

	/**
	 * 파일을 제이슨 형태로 만듦
	 * 
	 * @param fileItem
	 * @return
	 * @author 은혜, 종운
	 */
	public JSONObject fileToJson(File fileItem) {
		JSONObject json_FileToJson = new JSONObject();

		json_FileToJson.put("title", fileItem.getName());
		String temp_path = fileItem.getAbsolutePath().replace("\\\\", "/");
		// String temp_path = fileItem.getAbsolutePath();
		json_FileToJson.put("author", temp_path);

		return json_FileToJson;
	}

	/**
	 * 경로를 받아 폴더 생성
	 * 
	 * @param parent
	 * @param title
	 * @throws Exception
	 * @author 종운, 은혜
	 */
	@RequestMapping("fancyFolder")
	public ModelAndView fancyFolder(String parent, String title,
			ModelAndView andView) throws Exception {
		title = "/" + title;
		File fn = new File(parent + title);

		if (!fn.exists()) {
			fn.mkdirs();
		}

		andView.addObject("result", "생성성공!");
		andView.setViewName("jsonConvertView");
		return andView;

	}

	@RequestMapping("fancyRemove")
	public ModelAndView fancyRemove(String path, String title,
			ModelAndView andView) throws Exception {

		title = "/" + title;
		File fn = new File(path);
		if (fn.isDirectory()) {
			FileUtils.deleteDirectory(new File(path));
		} else {
			fn.delete();
		}
		andView.addObject("result", "삭제성공!");
		andView.setViewName("jsonConvertView");
		return andView;

	}

	// 워크스페이스 프로젝트 생성
	@RequestMapping("addProject")
	public ModelAndView addProject(String pro_link,
			@RequestParam String pro_name, @RequestParam String pro_type,
			ModelAndView andView) throws Exception {

		if (pro_link == null || pro_link.equals("")) {
			pro_link = "test1workspace";
		}
		String str_workspace_path = all_ws_path + "\\" + pro_link;
		str_workspace_path = str_workspace_path.replace("\\", "/");

		str_workspace_path = str_workspace_path + "/" + pro_name;
		File workspace_path = new File(str_workspace_path);
		File destDir;

		if (!workspace_path.exists()) {
			andView.addObject("result", true);
			workspace_path.mkdirs();
			if (pro_type.equals("java")) {
				destDir = new File("D:/allworkspace/ori_java_project");
				FileUtils.copyDirectory(destDir,workspace_path);
			} else if (pro_type.equals("web")) {
				destDir = new File("D:/allworkspace/ori_web_project");
				FileUtils.copyDirectory(destDir, workspace_path);
			}

		} else {
			andView.addObject("result", false);
		}

		andView.setViewName("jsonConvertView");
		return andView;
	}

	// 워크스페이스 프로젝트 생성 이름 중복 검사
	@RequestMapping("checkNameProject")
	public ModelAndView checkNameProject(@RequestParam String pro_link,
			@RequestParam String pro_name, ModelAndView andView)
			throws Exception {

//		if (pro_link == null || pro_link.equals("")) {
//			pro_link = "test1workspace";
//		}
		String str_workspace_path = all_ws_path + "\\" + pro_link;
		str_workspace_path = str_workspace_path.replace("\\", "/");

		str_workspace_path = str_workspace_path + "/" + pro_name;
		File fn = new File(str_workspace_path);

		if (!fn.exists()) {
			// 같은 것이 없을 때
			andView.addObject("result", true);
		} else if(fn.exists()) {
			andView.addObject("result", false);
		}
		andView.setViewName("jsonConvertView");
		return andView;

	}
	
   /**
    * 파일 임포트 메서드
    */
	@RequestMapping("importfile")
	public ModelAndView importfile(
			@RequestParam("file") MultipartFile[] file,
			String path, String pro_link,				
			ModelAndView andView) throws Exception{
		if (pro_link == null || pro_link.equals("")) {
			pro_link = "test1workspace";
		}
		String str_workspace_path = all_ws_path + "\\" + pro_link;
	
		str_workspace_path = str_workspace_path.replace("\\", "/") + "/" + path;

		if(file != null){
			for(MultipartFile item : file){
				if (item.getSize() > 0) {
					String fileName = FilenameUtils.getName(item.getOriginalFilename()); 
					File saveFile = new File(str_workspace_path, fileName);
					try {
						item.transferTo(saveFile);
						andView.addObject("result", str_workspace_path + "/" + fileName);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	/**
	 * 폴더 임포트 메서드
	 */
	@RequestMapping("importfolder")
	public ModelAndView importfolder(
			@RequestParam("file") MultipartFile[] file,
			String path, String pro_link, String folderName,
			String[] folderPath,
			ModelAndView andView) throws Exception{
		
		System.out.println(folderPath);
		
		if (pro_link == null || pro_link.equals("")) {
			pro_link = "test1workspace";
		}
		
		// ["test/aa.java", "test/test.txt", "test/test2.txt", 
		//"test/ttest.jsp", "test/test._1/Browser.jsp", "test/test._1/Cjava.jsp", "test/test._1/CjavaB.jsp"]
		// "test"만떼어내기
		for (int i = 0; i < folderPath.length; i++) {
			String[] temp_split_path = folderPath[i].split("/");
			String temp_path = "";
			for (int j = 0; j < temp_split_path.length-1; j++) {
				if( j == temp_split_path.length - 2){
					temp_path += temp_split_path[j];
				}else{
					temp_path += temp_split_path[j] + "/";
				}
			}
			folderPath[i] = temp_path;
		}
		
		
		
		String str_workspace_path = all_ws_path + "\\" + pro_link;
	
		String str_for_path = str_workspace_path.replace("\\", "/") + "/" + path;
		str_workspace_path = str_workspace_path.replace("\\", "/") + "/" + path + "/" + folderName;
		File importFolder = new File(str_workspace_path);
		
		
		
		
		if (!importFolder.exists()) {
			
			importFolder.mkdirs();
			
			for (int i = 0; i < folderPath.length; i++) {
				String folder_path = str_for_path + "/" + folderPath[i];
				File tempFolder = new File(folder_path);
				if(!tempFolder.exists()){
					// 만들어줌
					tempFolder.mkdirs();
				}
				String fileName = FilenameUtils.getName(file[i].getOriginalFilename()); 
				File saveFile = new File(folder_path, fileName);
				file[i].transferTo(saveFile);
			}
			andView.addObject("result", str_workspace_path + "/" + folderName);
		}else{
			// 이미 동일한 이름의 폴더가 있습니다.
			andView.addObject("result", "fail");
		}
			
		andView.setViewName("jsonConvertView");
		return andView;
	}
	

   //=================은혜==============================
	
	/**
	 * @author 은지
	 */
	@RequestMapping("createFile")
	public ModelAndView createFile(@RequestParam String ide_no,
									@RequestParam String folder_name,
									@RequestParam String author,
									@RequestParam String split,
									ModelAndView andView) throws Exception{
							
		andView.addObject("ide_no", ide_no);
		andView.addObject("folder_name", folder_name);
		andView.addObject("author", author);
		andView.addObject("split", split);
		
		return andView;
	}

	@RequestMapping("insertFile")
	   public ModelAndView insertFile(IdeFileVO idefileInfo,
									   @RequestParam String ide_no,
									   @RequestParam String folder_name,
									   @RequestParam String file_name,
									   @RequestParam String file_type,
									   @RequestParam String author,
									   @RequestParam String split,
									   ModelAndView andView) throws Exception {
		   			
		File file = new File(author + "\\" + file_name);
		File file1= new File(author + "\\" + file_name + "." + file_type);
		String result = "";

		if(file_type.equals("java")){
			File copyfile = new File("D:\\allworkspace\\sample\\javaSample.java"); //샘플파일 
			result = createfilecopy(file, copyfile, file1, idefileInfo, folder_name, file_name, file_type, ide_no);
			innerChange_package(split, file1); // 패키지 명 변경
			innerChange_class(file_name, file1); // 클래스 명 변경
			
		}else if(file_type.equals("xml")){
			File copyfile = new File("D:\\allworkspace\\sample\\xmlSample.xml"); 
			result = createfilecopy(file, copyfile, file1, idefileInfo, folder_name, file_name, file_type, ide_no);
			
		}else if(file_type.equals("html")){
			File copyfile = new File("D:\\allworkspace\\sample\\htmlSample.html"); 
			result = createfilecopy(file, copyfile, file1, idefileInfo, folder_name, file_name, file_type, ide_no);
			
		}else if(file_type.equals("css")){
			File copyfile = new File("D:\\allworkspace\\sample\\cssSample.css"); 
			result = createfilecopy(file, copyfile, file1, idefileInfo, folder_name, file_name, file_type, ide_no);
			
		}else if(file_type.equals("jsp")){
			File copyfile = new File("D:\\allworkspace\\sample\\jspSample.jsp"); 
			result = createfilecopy(file, copyfile, file1, idefileInfo, folder_name, file_name, file_type, ide_no);
			
		}else{
			result = createNewfile(file, file1, idefileInfo, folder_name, file_name, file_type, ide_no);
		}
		
		    andView.addObject("result", result);
		    andView.setViewName("jsonConvertView");
		   
		   
		   return andView;
	   }
	
	
	public String createfilecopy(File file, File copyfile, File file1, IdeFileVO idefileInfo, 
							String folder_name, String file_name, String file_type,	String ide_no) throws Exception{
		
		if (!file1.exists()){
			
			FileInputStream inputStream = new FileInputStream(copyfile);        
			FileOutputStream outputStream = new FileOutputStream(file1);
			
			FileChannel fcin =  inputStream.getChannel();
			FileChannel fcout = outputStream.getChannel();
			
			long size = fcin.size();
			fcin.transferTo(0, size, fcout);
			
			fcout.close();
			fcin.close();
			
			outputStream.close();
			inputStream.close();
			
			   
		        // 생성한 파일 저장경로, 크기 조회
	       String file_path = file1.toString();
	       String file_size = Long.toString(FileUtils.sizeOf(file1));
	       
	       // 최종으로 DB에 저장
	       idefileInfo.setFolder_name(folder_name);
	       idefileInfo.setFile_path(file_path);
	       idefileInfo.setFile_name(file_name);
	       idefileInfo.setFile_save_name(file_name);
	       idefileInfo.setFile_type(file_type);
	       idefileInfo.setFile_size(file_size);
	       idefileInfo.setIde_no(ide_no);
	       
	       idefile_service.insertIdefileInfo(idefileInfo);
	       
	       String result = "파일 생성 성공!!";
		   return result;  
	    }else{
	       String result = "중복된 파일명입니다.";
	       return result;  
	    }
		
	}
	
	public String createNewfile(File file, File file1, IdeFileVO idefileInfo, 
			String folder_name, String file_name, String file_type,	String ide_no) throws Exception{
		
		if (!file1.exists()){
			
			file1.createNewFile();
			
			// 생성한 파일 저장경로, 크기 조회
			String file_path = file1.toString();
			String file_size = Long.toString(FileUtils.sizeOf(file1));
			
			// 최종으로 DB에 저장
			idefileInfo.setFolder_name(folder_name);
			idefileInfo.setFile_path(file_path);
			idefileInfo.setFile_name(file_name);
			idefileInfo.setFile_save_name(file_name);
			idefileInfo.setFile_type(file_type);
			idefileInfo.setFile_size(file_size);
			idefileInfo.setIde_no(ide_no);
			
			idefile_service.insertIdefileInfo(idefileInfo);
			
			String result = "파일 생성 성공!!";
			return result;  
		}else{
			String result = "중복된 파일명입니다.";
			return result;  
		}
		
	}
	
	public void innerChange_package(String split, File file1) throws Exception{ // 파일 내 패키지명 변경
		  String target = "sample";
		  
		BufferedReader outBuf = new BufferedReader(new InputStreamReader(new FileInputStream(file1)));
		  String temp = null;
		  ArrayList al = new ArrayList();
		  
		  while((temp=outBuf.readLine()) != null ) {
		   al.add(temp.replaceAll(target, split));
		  }
		  
		  BufferedWriter bw = new BufferedWriter(new FileWriter(file1, false));  
		  for(int i=0; i < al.size(); i++) {
		   bw.write((String)al.get(i));
		   bw.newLine();
		  }
		  
		  bw.flush();
		  bw.close();
		  outBuf.close();
	}
	
	public void innerChange_class(String file_name, File file1) throws Exception{ // 파일 내 클래스명 변경
		String target = "javaSample";
		String change = file_name;
		
		BufferedReader outBuf = new BufferedReader(new InputStreamReader(new FileInputStream(file1)));
		String temp = null;
		ArrayList al = new ArrayList();
		
		while((temp=outBuf.readLine()) != null ) {
			al.add(temp.replaceAll(target, change));
		}
		
		BufferedWriter bw = new BufferedWriter(new FileWriter(file1, false));  
		for(int i=0; i < al.size(); i++) {
			bw.write((String)al.get(i));
			bw.newLine();
		}
		
		bw.flush();
		bw.close();
		outBuf.close();
	}
	//============================================은지===================================================


	//============================================종운===================================================

	 @RequestMapping("Fileread")
	   public void Fileread(String authoruri, ModelAndView andView, HttpServletRequest request,
		         HttpServletResponse response) throws Exception{
		 
		 PrintWriter out = response.getWriter();
		 
		 File fn = new File(authoruri);
			
			FileReader fileread = new FileReader(fn);

			BufferedReader br = new BufferedReader(fileread);
			String res="";
			while(true){
				String str = br.readLine();
				if(str!=null){
					res+=str;
					res+="\n";
//					System.out.println("com :" + res);
				}
				else{
					break;
				}
			}
			
//			res = URLEncoder.encode(res, "UTF-8");
			
			if(res.equals("")){
				res="Compiled Successfully";
			}
			
			out.println(res);
			
			br.close();
			fileread.close();
//			andView.addObject("res", res);
//			andView.addObject("result", "생성성공!");
//			andView.setViewName("jsonConvertView");
//			return andView;
			
	   }
	

	 
	 @RequestMapping("Compile")
	   public void Compile(String code, String className, String cpath, ModelAndView andView, HttpServletRequest request,
		         HttpServletResponse response) throws Exception{
		 //D:\A_TeachingMaterial\6.JspSpring\eGovFrameDev-3.2.0-64bit\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\LAONIDE\
//		 	String rpath = request.getServletContext().getRealPath("/");
		 	String rpath = GlobalConstant.ALL_WORKSPACE + "/test1workspace/";
			System.out.println("rpath : " + rpath);
			PrintWriter out = response.getWriter();
			
//			String filename = request.getParameter("className")+".java";
			//aa.java
//			String filename = request.getParameter("className");
			
			// books/aa.java
//			String  filepath = request.getParameter("path");
			
			// Books/
//			String aaa[] = cpath.split(className);
			System.out.println("cpath : " + cpath);
			String aaa[] = cpath.split("\\\\");
			
			
			System.out.println("filename : " + className);
			System.out.println("aaa[0] : " + aaa[0]);
			System.out.println("aaa[aaa.length-2] : " + aaa[aaa.length-2]);
			
//			File fn = new File(path+"//Files//"+filename);
//			File fn = new File(path+"//Files//"+aaa[0]);
//			File fn = new File(rpath+"//"+"allworkspace" +"//" + aaa[0] + "//Classes" );
//			File fn = new File(rpath+"//"+"Files" +"//" + aaa[0] + "//bin" );
			// D:\\allworkspace /test1workspace/ 			aaa  
			File fn = new File(rpath+"//" + aaa[0] + "//bin//" +aaa[aaa.length-2] );
			
			// 190701 
			if (!fn.exists()) {
				try{
					fn.mkdirs(); //폴더 생성합니다.
				    System.out.println("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
				}        
		         }else {
				System.out.println("이미 폴더가 생성되어 있습니다.");
			}
//			File fn2 = new File(rpath+"//"+"Files" +"//" + aaa[0]);
			// D:\\allworkspace /test1workspace/ 			aaa  
//			File fn2 = new File(rpath+"//"+aaa[0] +"//bin//" + aaa[0]);
			File fn2 = new File(rpath+"//"+aaa[0] +"//bin//" + aaa[aaa.length-2]);
			
			// aa.java 생성
			FileOutputStream fos = new FileOutputStream(fn2 + "//" + className);
			
			System.out.println(request.getParameter("code"));
			byte[] sourcecode = request.getParameter("code").getBytes();
			fos.write(sourcecode);
			
//			System.out.println("aaa : "+aaa[0]);
			
//			String compilecmd ="javac -encoding UTF-8 -d " + path + "\\Files\\Classes\\ " + path + "\\Files\\" +  filename;
//			String compilecmd ="javac -encoding UTF-8 -d " + rpath + "Files\\" + aaa[0] + "Classes\\ " + rpath + "Files\\" + aaa[0] +""+ className;
			// 								D:\\allworkspace /test1workspace/ 			aaa  

			
			String compilecmd ="javac -encoding UTF-8 -d " + rpath + "" + aaa[0] + "\\bin\\"+aaa[aaa.length-2]+"\\ " + rpath + "" + aaa[0] +"\\bin\\" +aaa[aaa.length-2]+"\\"+ className;
			
//			String compilecmd ="javac -encoding UTF-8 -d . " + rpath +  cpath; // 됨
			System.out.println("aaa[0] " + aaa[0]);
			System.out.println("aaa[aaa.length-2] " + aaa[aaa.length-2]);
			
//			String compilecmd ="javac -encoding UTF-8 -d " + rpath + aaa[0] + "\\bin\\"+ aaa[aaa.length-2] +"\\. "+ rpath +  cpath;
			
			
			System.out.println("compilecmd : " + compilecmd);
			
			Process error = Runtime.getRuntime().exec(compilecmd);
			
//			compilecmd ="javac -encoding UTF-8 -cp . " + className;
//			error = Runtime.getRuntime().exec(compilecmd);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(error.getErrorStream()));
			String res="";
			
			while(true){
				String str = br.readLine();
				if(str!=null){
					res+=str;
					res+="\n";
				}
				else{
					break;
				}
			}
			
			System.out.println("resres : " + res);
			if(res.equals("")){
				res="Compiled Successfully";
			}
			
			out.println(res);
			br.close();
			fos.close();
		
			
	   }
	 
	 
	 
	 
	 @RequestMapping("Run")
	   public void Run(String classname, String cpath, ModelAndView andView, HttpServletRequest request,
		         HttpServletResponse response) throws Exception{
		 System.out.println("런런런");
		 PrintWriter out = response.getWriter();
			String filename = classname.trim();

			// aa
			String filename1[] = filename.split("\\."); 
			
			// Books/aa.java
			String  filepath = cpath;
			System.out.println("filepath : " + filepath);
			
			
			// Books/
//			String aaa[] = filepath.split(filename);
			String aaa[] = filepath.split("\\\\");
			
			// \\Books/
			String aa = "\\" + aaa[0];
			
//			String path = request.getServletContext().getRealPath("/");
			String path = GlobalConstant.ALL_WORKSPACE + "/test1workspace/";
			
//			String runcmd = "java -Dfile.encoding=UTF-8 -cp " + path + "\\Files\\Classes\\ " + filename;
			
//			String runcmd = "java -Dfile.encoding=UTF-8 -cp " + path + "Files\\" + aaa[0] + "Classes\\ " + filename1[0];
//												D:\\allworkspace /test1workspace/ 			aaa  
			
			
			String runcmd = "java -Dfile.encoding=UTF-8 -cp " + path + "" + aaa[0] + "\\bin\\" +aaa[aaa.length-2]+"\\ " + filename1[0];
//			String runcmd = "java -Dfile.encoding=UTF-8 -cp . " + filename1[0];

			System.out.println("runcmd : " + runcmd);
			Process exe = Runtime.getRuntime().exec(runcmd);
			try{
				exe.waitFor();
				BufferedReader bin = new BufferedReader(new InputStreamReader(exe.getInputStream()));
				BufferedReader berr = new BufferedReader(new InputStreamReader(exe.getErrorStream()));
				String res="";
				while(true){
					String temp=bin.readLine();
					if(temp==null){
						break;
					}
					else{
						res+=temp + "\n";
					}
//					System.out.println("res : " + res);
				}
				if(res.equals("")){
					while(true){
						String temp = berr.readLine();
						if(temp==null){
							break;
						}
						else{
							res+=temp;
						}
					}
				}
//				res = URLEncoder.encode(res, "UTF-8");
				
				out.println(res);
				bin.close();
				berr.close();
				out.close();
			}
			catch(Exception e){
				System.out.println(e);
			}
			
	   }
	 
	 
	 
	  
	 @RequestMapping("Server")
	   public void Server(String pro_link,String classname, String cpath, ModelAndView andView, HttpServletRequest request,
		         HttpServletResponse response) throws Exception{
		 
		 PrintWriter out = response.getWriter();
			
//			D:\A_TeachingMaterial\6.JspSpring\eGovFrameDev-3.2.0-64bit
//			String path = request.getParameter("path");
			
			// ttest.jsp
//			String classname = request.getParameter("classname");
			
			try {
			   
			   
			String filepath = "D:\\apache-tomcat-7.0.94\\conf\\server.xml";
//				D:\A_TeachingMaterial\6.JspSpring\eGovFrameDev-3.2.0-64bit\ttest.jsp
			
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			Document doc = docBuilder.parse(filepath);

			
			// Get the root element
			Node company = doc.getFirstChild();

			// Get the staff element , it may not working if tag has spaces, or
			// whatever weird characters in front...it's better to use
			// getElementsByTagName() to get it directly.
			// Node staff = company.getFirstChild();

			// Get the staff element by tag name directly
			Node Host = doc.getElementsByTagName("Host").item(0);

			// update staff attribute
//			NamedNodeMap attr = staff.getAttributes();
//			Node nodeAttr = attr.getNamedItem("id");
//			nodeAttr.setTextContent("2");

			// Context삭제
			Element element = (Element) doc.getElementsByTagName("Context").item(0);
			 Node parent = element.getParentNode();
			parent.removeChild(element);
		    parent.normalize();
//		    toString(doc);
			
		    // Context 추가
			// append a new node to staff
			Element Context = doc.createElement("Context");
			
//			Context.appendChild(doc.createTextNode("28"));
//			Context.setAttribute("docBase", "D:\\A_TeachingMaterial\\6.JspSpring\\eGovFrameDev-3.2.0-64bit");
			Context.setAttribute("docBase", GlobalConstant.ALL_WORKSPACE + "/"+pro_link+"/");
			Context.setAttribute("path", "/");
			Context.setAttribute("reloadable", "true");
			Host.appendChild(Context);
			

			// loop the staff child node
//			NodeList list = staff.getChildNodes();
	//
//			for (int i = 0; i < list.getLength(); i++) {
//				
//	                   Node node = list.item(i);
	//
//			   // get the salary element, and update the value
//			   if ("salary".equals(node.getNodeName())) {
//				node.setTextContent("2000000");
//			   }
	//
//	                   //remove firstname
//			   if ("firstname".equals(node.getNodeName())) {
//				staff.removeChild(node);
//			   }
	//
//			}

			// write the content into xml file
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(new File(filepath));
			transformer.transform(source, result);

			System.out.println("Done");

		   } catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		   } catch (TransformerException tfe) {
			tfe.printStackTrace();
		   } catch (IOException ioe) {
			ioe.printStackTrace();
		   } catch (SAXException sae) {
			sae.printStackTrace();
		   }
			
			
//			String runcmd = System.getProperty("catalina.home")+"\\bin\\startup.bat";
			String runcmd = "D:\\apache-tomcat-7.0.94\\bin\\startup.bat";
			System.out.println("runcmd : " + runcmd);
			Process exe = Runtime.getRuntime().exec(runcmd);
			
			try{
				exe.waitFor();
				BufferedReader bin = new BufferedReader(new InputStreamReader(exe.getInputStream()));
				BufferedReader berr = new BufferedReader(new InputStreamReader(exe.getErrorStream()));
				String res="";
				while(true){
					String temp=bin.readLine();
					if(temp==null){
						break;
					}
					else{
						res+=temp + "\n";
					}
					
				}
				if(res.equals("")){
					while(true){
						String temp = berr.readLine();
						if(temp==null){
							break;
						}
						else{
							res+=temp;
						}
					}
				}
//				res = URLEncoder.encode(res, "UTF-8");
//				System.out.println("res : " + res);
				out.println(res);
				bin.close();
				berr.close();
				out.close();
			}
			catch(Exception e){
				System.out.println(e);
			}
		
			
	   }
	 
	 
	 @RequestMapping("StopServer")
	   public void StopServer(ModelAndView andView, HttpServletRequest request,
		         HttpServletResponse response) throws Exception{
		 
		 PrintWriter out = response.getWriter();
			
			String runcmd = "D:\\apache-tomcat-7.0.94\\bin\\shutdown.bat";
			Process exe = Runtime.getRuntime().exec(runcmd);
			
			
			try{
				exe.waitFor();
				BufferedReader bin = new BufferedReader(new InputStreamReader(exe.getInputStream()));
				BufferedReader berr = new BufferedReader(new InputStreamReader(exe.getErrorStream()));
				
				String res = "";
				while(true){
					String temp = bin.readLine();
					if(temp == null){
						break;
					}else{
						res += temp + "\n";
					}
					System.out.println("res : " + res);
				}
					
				if(res.equals("")){
					while(true) {
						String temp = berr.readLine();
						if(temp == null) {
							break;
						}else {
							res += temp;
						}
					}
				}
//				res = URLEncoder.encode(res, "UTF-8");
				
				out.println(res);
				bin.close();
				berr.close();
				out.close();
				
			}catch(Exception e){
				System.out.println(e);
			}
	 }
	 
	@RequestMapping("zipdown")
	 public ModelAndView zipdown(String root, String filename, HttpServletRequest request,
		         HttpServletResponse response,ModelAndView andView) throws Exception{
		
		
		request.setCharacterEncoding("UTF-8");
		// 파일 업로드된 경로

		 String savePath1 = URLDecoder.decode(root,"UTF-8");
		
	    String savePath = savePath1;
	    System.out.println("savePath : " + savePath);
	    System.out.println("filename : " + filename);
	    
	    // 서버에 실제 저장된 파일명
//	     String filename = "20140819151221.zip" ;
	     
	  	String filenamezip = filename + ".zip";
	    String Filepath = "D:/Filepath/" + filenamezip;
	    
	   ZipUtil.pack(new File(root), new File(Filepath));
	   
	 
	   File downloadFile = new File("D:/Filepath/", filenamezip);
	   
	   if(downloadFile.exists()){
			filenamezip = URLEncoder.encode(filenamezip, "UTF-8");
//			PrintWriter out = response.getWriter();
			response.setHeader("Content-Disposition", "attachment;filename=" + filenamezip);
			response.setContentType("application/octet-stream");
			response.setContentLength((int)downloadFile.length());
			
//			out.clear();
//			out = pageContext.pushBody(); // out 초기화 시킴
			
			byte[] buffer = new byte[(int)downloadFile.length()];
			
			BufferedInputStream inputStreamBuffer = new BufferedInputStream(
															new FileInputStream(downloadFile));
			
			BufferedOutputStream outputStreamBuffer = new BufferedOutputStream(response.getOutputStream());
//			BufferedOutputStream outputStreamBuffer = new BufferedOutputStream(downloadFile);
			
			int readCnt = 0;
			
			while((readCnt =  inputStreamBuffer.read(buffer)) != -1){
				outputStreamBuffer.write(buffer);
			}

			inputStreamBuffer.close();
			outputStreamBuffer.close();
		}
	   
	   return andView;
		 
	 }

	@RequestMapping("wardown")
	 public ModelAndView wardown(String root, String filename, HttpServletRequest request,
		         HttpServletResponse response,ModelAndView andView) throws Exception{
		
		
		 request.setCharacterEncoding("UTF-8");
		 
		 String savePath1 = URLDecoder.decode(root,"UTF-8");
//		 String savePath2 = URLDecoder.decode(filename,"UTF-8");
		 
		    // 파일 업로드된 경로
//		     String root = request.getSession().getServletContext().getRealPath("/");
//		     String savePath = root + "upload";
//		    String root = request.getParameter("root");
//		     String savePath = URLDecoder.decode(root,"UTF-8");
		 
//		 String savePath = root;
		    String savePath = savePath1;
		    System.out.println("savePath : " + savePath);
		    
		    // 서버에 실제 저장된 파일명
//		     String filename = "20140819151221.zip" ;
//		    String filename = request.getParameter("filename");
		     
		  	String filenamewar = filename + ".war";
		    String Filepath = "D:/Filepath/" + filenamewar;
		    
		   ZipUtil.pack(new File(root), new File(Filepath));
		   
		 
		   File downloadFile = new File("D:/Filepath/", filenamewar);
		   
		   if(downloadFile.exists()){
			   filenamewar = URLEncoder.encode(filenamewar, "UTF-8");
				
				response.setHeader("Content-Disposition", "attachment;filename=" + filenamewar);
				response.setContentType("application/octet-stream");
				response.setContentLength((int)downloadFile.length());
				
//				out.clear();
//				out = pageContext.pushBody(); // out 초기화 시킴
				
				byte[] buffer = new byte[(int)downloadFile.length()];
				
				BufferedInputStream inputStreamBuffer = new BufferedInputStream(
																new FileInputStream(downloadFile));
				
				BufferedOutputStream outputStreamBuffer = new BufferedOutputStream(response.getOutputStream());
				
				int readCnt = 0;
				
				while((readCnt =  inputStreamBuffer.read(buffer)) != -1){
					outputStreamBuffer.write(buffer);
				}

				inputStreamBuffer.close();
				outputStreamBuffer.close();
			}
	   
	   return andView;
		 
	 }

	
	@RequestMapping("fancyRename")
	public ModelAndView fancyRename(String path, String Name, String orgTitle,
			HttpServletRequest request,
	         HttpServletResponse response,
	         ModelAndView andView) throws Exception {
		
		
		System.out.println("path : " + path);
		System.out.println("Name : " + Name);
		System.out.println("orgTitle : " + orgTitle);
		
		response.setCharacterEncoding("UTF-8");
//		PrintWriter out = response.getWriter();
		// Nodetitle
		String[] nname = Name.split("\\.") ;
		
		// orgTitle
		String[] norgTitle = orgTitle.split("\\.") ;
		
		String target = norgTitle[0];
		  String change = nname[0];
		  
		  File isfn = new File(path); 
		  
		  if(isfn.isFile()){
			  
			  BufferedReader outBuf = new BufferedReader(new InputStreamReader(new FileInputStream(path)));
//		  BufferedReader outBuf = new BufferedReader(new InputStreamReader(new FileInputStream(torename)));
			  String temp = null;
			  ArrayList al = new ArrayList();
			  
			  while((temp=outBuf.readLine()) != null ) {
				  al.add(temp.replaceAll(target, change));
			  }
			  
			  BufferedWriter bw = new BufferedWriter(new FileWriter(path, false));  
			  for(int i=0; i < al.size(); i++) {
				  bw.write((String)al.get(i));
				  bw.newLine();
			  }
			  
			  
			  
			  bw.flush();
			  bw.close();
			  outBuf.close();
			  
			  String torename = path.replace(orgTitle, Name) ;
			  
			  File fn = new File(path);
			  
			  File fnre = new File(torename);
			  
			  fn.renameTo(fnre);
			  
		  }else {
			  System.out.println("폴더이다.");
			  String torename = path.replace(orgTitle, Name) ;
			  
			  File fn = new File(path);
			  
			  File fnre = new File(torename);
			  
			  fn.renameTo(fnre);
		  }

//		out.println("성공");
		andView.addObject("result", "성공");
		andView.setViewName("jsonConvertView"); 
		return andView;
		
	}
	
	
	@RequestMapping("fancyMove")
	public ModelAndView fancyMove(String path, String moveto, ModelAndView andView, HttpServletRequest request,
	         HttpServletResponse response) throws Exception{
		// path 옮겨진놈
		// moveto 옮겨진 곳
		
		
		File file = new File(path);
		
		File fileToMove = new File(moveto);
		
		if(file.isDirectory()){
			
			FileUtils.moveDirectoryToDirectory(file, fileToMove,  true);
			
		}else{
			
			FileUtils.moveFileToDirectory(file, fileToMove, true);
			
		}
		andView.addObject("result", "성공");
		andView.setViewName("jsonConvertView"); 
		return andView;
	}
	
	
	
	@RequestMapping("codeSave")
	public ModelAndView codeSave(String codesave, String path,ModelAndView andView, HttpServletRequest request,
	         HttpServletResponse response) throws Exception{
		
		
		
			BufferedReader outBuf = new BufferedReader(new InputStreamReader(new FileInputStream(path)));
//		  	BufferedReader outBuf = new BufferedReader(new InputStreamReader(new FileInputStream(torename)));
			  String temp = null;
			  ArrayList al = new ArrayList();
			  
//			  while((temp=outBuf.readLine()) != null ) {
//				  al.add(temp.replaceAll(target, change));
//			  }
			  
			  BufferedWriter bw = new BufferedWriter(new FileWriter(path, false));  
//			  for(int i=0; i < al.size(); i++) {
				  bw.write(codesave);
//				  bw.newLine();
//			  }
			  
			  bw.flush();
			  bw.close();
			  outBuf.close();
		
			  andView.addObject("result", "성공");
			  andView.setViewName("jsonConvertView"); 
			return andView;
	}
	
	
	@RequestMapping("fileSave")
	 public ModelAndView fileSave(String root, String filename, HttpServletRequest request,
		         HttpServletResponse response,ModelAndView andView) throws Exception{
		
		System.out.println("세이브");
		 request.setCharacterEncoding("UTF-8");
		
		 String savePath1 = URLDecoder.decode(root,"UTF-8");
		
		 File downloadFile = new File(savePath1); 
//		File downloadFile = new File(root, filename); 
		if(downloadFile.exists()){
			
			String fileName = URLEncoder.encode(filename, "UTF-8");
			
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			response.setContentType("application/octet-stream");
			response.setContentLength((int)downloadFile.length());
			
			byte[] buffer = new byte[(int)downloadFile.length()];
			
			BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(downloadFile));
			
			BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			
			int readCnt = 0;
			
			while((readCnt = inputStream.read(buffer)) != -1){
				outputStream.write(buffer);
			}
			
			inputStream.close();
			outputStream.close();
		}
		
		
	return andView;
		 
	 }
	
	
	//============================================종운===================================================

	//============================================파일 검색 은혜
	
	JSONArray arr_search;
	JSONArray arr_children_file = new JSONArray();
	String searchWord = "";
	
	@RequestMapping("saerchWSload")
	public ModelAndView saerchWSload(String pro_link, ModelAndView andView, String searchWord)
			throws Exception {
		// 추후 수정
		if (pro_link == null || pro_link.equals("")) {
			pro_link = "test1workspace";
		}
		
		this.searchWord = searchWord;
		
		String str_workspace_path = all_ws_path + "\\" + pro_link;
		str_workspace_path = str_workspace_path.replace("\\", "/");
	
		arr_search = new JSONArray();

		// 폴더 경로
		File ws_path = new File(str_workspace_path);
		// AbsolutePath
		File[] wsItemList = ws_path.listFiles();
		if (0 < wsItemList.length) {
			for (int i = 0; i < wsItemList.length; i++) {
				if (wsItemList[i].isDirectory()) {

					File file_path = new File(wsItemList[i].getAbsolutePath());
					File[] parentItemList = file_path.listFiles();

					JSONObject json_folderItemList = searchSrcFolderToJson(parentItemList, file_path);
					if(json_folderItemList != null){
						arr_search.add(json_folderItemList);
					}
				} 
			}
		} else {
			
		}

		System.out.println(arr_search);
		andView.addObject("jsonSrc", arr_search);
		andView.setViewName("jsonConvertView");
		return andView;
	}

	public JSONObject searchSrcFolderToJson(File[] folderItemList, File param_path) {

		JSONObject json_FancyParent = new JSONObject();
		JSONArray json_FancyChild = new JSONArray();
		json_FancyParent.put("title", param_path.getName());
		json_FancyParent.put("expanded", true);
		json_FancyParent.put("folder", true);
		String temp_path = param_path.getAbsolutePath().replace("\\\\", "/");
		// String temp_path = param_path.getAbsolutePath();
		json_FancyParent.put("author", temp_path);

		if (0 < folderItemList.length) {
			for (int i = 0; i < folderItemList.length; i++) {
				if (folderItemList[i].isDirectory()) {
					if (folderItemList[i].getName().equals("src")
							|| folderItemList[i].getName().equals("WebContent")) {

						File file_path = new File(folderItemList[i].getAbsolutePath());
						File[] parentItemList = file_path.listFiles();

						JSONObject rtn_folderToJson2 = new JSONObject();
						rtn_folderToJson2 = searchfolderToJson(parentItemList, file_path);
						if (rtn_folderToJson2 != null) {
							json_FancyChild.add(rtn_folderToJson2);
						}
					}
				}
			}
		}
		if(json_FancyChild.size() != 0){
			json_FancyParent.put("children", json_FancyChild);
			return json_FancyParent;
		}
		return null;
	}


	public JSONObject searchfolderToJson(File[] folderItemList, File param_path) {

		JSONObject json_FancyParent = new JSONObject();
		JSONArray json_FancyChild = new JSONArray();
		json_FancyParent.put("title", param_path.getName());
		json_FancyParent.put("expanded", true);
		json_FancyParent.put("folder", true);
		String temp_path = param_path.getAbsolutePath().replace("\\\\", "/");
		// String temp_path = param_path.getAbsolutePath();
		json_FancyParent.put("author", temp_path);

		if (0 < folderItemList.length) {
			for (int i = 0; i < folderItemList.length; i++) {
				if (folderItemList[i].isDirectory()) {

					File file_path = new File(
							folderItemList[i].getAbsolutePath());
					File[] parentItemList = file_path.listFiles();

					JSONObject rtn_folderToJson2 = new JSONObject();
					rtn_folderToJson2 = searchfolderToJson(parentItemList, file_path);
					if (rtn_folderToJson2 != null) {
						json_FancyChild.add(rtn_folderToJson2);
					}
				} else {
					JSONObject json_FancyFile = searchfileToJson(folderItemList[i]);
					if(json_FancyFile != null){
						json_FancyChild.add(json_FancyFile);
					}
				}
			}
		}
		if(json_FancyChild.size() != 0){
			json_FancyParent.put("children", json_FancyChild);
			return json_FancyParent;
		}
		return null;
	}
	
	public JSONObject searchfileToJson(File fileItem) {
		JSONObject json_FileToJson = new JSONObject();
		if(fileItem.getName().contains(searchWord)){
			json_FileToJson.put("title", fileItem.getName());
			String temp_path = fileItem.getAbsolutePath();
//			temp_path = temp_path.replace("\\\\", "/");
			// String temp_path = fileItem.getAbsolutePath();
			json_FileToJson.put("author", temp_path);
			arr_children_file.add(json_FileToJson);
			return json_FileToJson;
		}else{
			return null;
		}
	}
}
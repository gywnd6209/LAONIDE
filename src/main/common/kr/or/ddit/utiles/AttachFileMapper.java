package kr.or.ddit.utiles;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeboardFileVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.LibraryfileVO;
import kr.or.ddit.vo.ProBoardFileVO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

// 첨부파일 정보 FileItemVO에 맵핑 후
// 전체 첨부파일이 List로 반환
@Component
public class AttachFileMapper {
	
	public List<FileItemVO> mapping(MultipartFile[] items, String bo_no) {

		List<FileItemVO> fileItemList = new ArrayList<FileItemVO>();

		if (items != null) {
			FileItemVO fileItemInfo;
			for (MultipartFile item : items) {
				if (item.getSize() > 0) {
					fileItemInfo = new FileItemVO();
					fileItemInfo.setFile_bo_no(bo_no);

					String fileName = FilenameUtils.getName(item.getOriginalFilename()); // a.png 반환
					fileItemInfo.setFile_name(fileName); // 업로드한 실제 파일명

					String baseName = FilenameUtils.getBaseName(fileName); // 확장자를 포함한 파일명을 주면 파일명만 반환함
					// png만 추출
					String extension = FilenameUtils.getExtension(fileName);

					String genID = UUID.randomUUID().toString().replace("-", ""); 

					String saveFileName = baseName + genID + "." + extension;
					fileItemInfo.setFile_save_name(saveFileName);

					fileItemInfo.setFile_content_type(item.getContentType());
					fileItemInfo.setFile_size(String.valueOf(item.getSize()));

					fileItemList.add(fileItemInfo);

					savaFile(saveFileName, item);

				}// 안쪽 if문
			}
		}
		return fileItemList;
	}
	
	/**
	 *	자료실 파일 추가를 위한 맵핑메서드 추가	 
	 */
	public static List<LibraryfileVO> mappingLibrary(MultipartFile[] items, String bo_no) {
		
		List<LibraryfileVO> fileItemList = new ArrayList<LibraryfileVO>();
		
		if (items != null) {
			LibraryfileVO fileItemInfo;
			for (MultipartFile item : items) {
				if (item.getSize() > 0) {
					fileItemInfo = new LibraryfileVO();
					fileItemInfo.setFile_bo_no(bo_no);
					
					String fileName = FilenameUtils.getName(item.getOriginalFilename()); // a.png 반환
					fileItemInfo.setFile_name(fileName); // 업로드한 실제 파일명
					
					String baseName = FilenameUtils.getBaseName(fileName); // 확장자를
					String extension = FilenameUtils.getExtension(fileName);
					String genID = UUID.randomUUID().toString().replace("-", ""); // - 기호는 빠지도록 셋팅
					
					String saveFileName = baseName + genID + "." + extension;
					fileItemInfo.setFile_save_name(saveFileName);
					
					fileItemInfo.setFile_cont_type(item.getContentType());
					fileItemInfo.setFile_size(String.valueOf(item.getSize()));
					
					fileItemList.add(fileItemInfo);
					
					savaFile(saveFileName, item);
					
				}// 안쪽 if문
			}
		}
		return fileItemList;
	}
		
	/**
	 * 프로젝트 게시판 파일 첨부를 위한 메소드 추가
	 * @author 은혜
	 * @since 2019.07.03
	 */
	public static List<ProBoardFileVO> mappingProBoardFile(MultipartFile[] items, String bo_no) {
		
		List<ProBoardFileVO> fileItemList = new ArrayList<ProBoardFileVO>();
		
		if (items != null) {
			ProBoardFileVO fileItemInfo;
			for (MultipartFile item : items) {
				if (item.getSize() > 0) {
					fileItemInfo = new ProBoardFileVO();
					fileItemInfo.setFile_bo_no(bo_no);
					
					String fileName = FilenameUtils.getName(item.getOriginalFilename()); 
					fileItemInfo.setFile_name(fileName); 
					
					String baseName = FilenameUtils.getBaseName(fileName); 
					String extension = FilenameUtils.getExtension(fileName);
					String genID = UUID.randomUUID().toString().replace("-", ""); 
					
					String saveFileName = baseName + genID + "." + extension;
					fileItemInfo.setFile_save_name(saveFileName);
					
					fileItemInfo.setFile_cont_type(item.getContentType());
					fileItemInfo.setFile_size(String.valueOf(item.getSize()));
					
					fileItemList.add(fileItemInfo);
					
					savaFile(saveFileName, item);
					
				}
			}
		}
		return fileItemList;
	}
	
	/**
	 * 자유게시판용 파일 맵퍼 추가
	 * @author @author 효중
	 */
public static List<FreeboardFileVO> mappingFreeboard(MultipartFile[] items, String bo_no) {
		
		List<FreeboardFileVO> fileItemList = new ArrayList<FreeboardFileVO>();
		
		if (items != null) {
			FreeboardFileVO fileItemInfo;
			for (MultipartFile item : items) {
				if (item.getSize() > 0) {
					fileItemInfo = new FreeboardFileVO();
					fileItemInfo.setFile_bo_no(bo_no);
					
					String fileName = FilenameUtils.getName(item.getOriginalFilename()); 
					fileItemInfo.setFile_name(fileName); 
					
					String baseName = FilenameUtils.getBaseName(fileName); 
					String extension = FilenameUtils.getExtension(fileName);
					String genID = UUID.randomUUID().toString().replace("-", ""); 
					
					String saveFileName = baseName + genID + "." + extension;
					fileItemInfo.setFile_save_name(saveFileName);
					
					fileItemInfo.setFile_cont_type(item.getContentType());
					fileItemInfo.setFile_size(String.valueOf(item.getSize()));
					
					fileItemList.add(fileItemInfo);
					
					savaFile(saveFileName, item);
					
				}
			}
		}
		return fileItemList;
	}
	
	
	private static void savaFile(String saveFileName, MultipartFile item) {

		File saveFile = new File(GlobalConstant.FILE_PATH, saveFileName);
		// 제로 스트링짜리 파일이 생성됨

		// 파일내용넣기
		try {
			// write() ==> transㄹerTo()로 변경
			item.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

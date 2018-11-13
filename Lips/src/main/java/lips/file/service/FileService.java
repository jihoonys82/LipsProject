package lips.file.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lips.file.dao.FileDao;
import lips.file.dto.AttachFileDto;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

@Service
public class FileService {
	@Autowired FileDao fileDao;
	@Autowired ServletContext servletContext;
	
	public Map<String,String> uploadFile(MultipartFile uploadFile) {
		User user = new UserByToken().getInstance(); 
		
		String result = "";
		
		String realPath = servletContext.getRealPath("upload");
		String uid = UUID.randomUUID().toString().split("-")[4];
		String stored = uploadFile.getOriginalFilename() + "_" + uid;
		
		File dest = new File(realPath, stored);
		AttachFileDto attachFileDto = new AttachFileDto();
		try {
			uploadFile.transferTo(dest);

			attachFileDto = new AttachFileDto();
			attachFileDto.setOriginName(uploadFile.getOriginalFilename());
			attachFileDto.setStoredName(stored);
			attachFileDto.setFileSize(uploadFile.getSize());
			attachFileDto.setUserId(user.getUserId());
			
			attachFileDto = fileDao.inUploadFile(attachFileDto);
			attachFileDto = fileDao.selFileByFileId(attachFileDto);
			result = "업로드성공";
		} catch (IllegalStateException e) {
			e.printStackTrace();
			result = " 잘못된 상태 에러";
		} catch (IOException e) {
			e.printStackTrace();
			result = " 입출력 에러";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("result", result);
		map.put("fileId", attachFileDto.getFileId()+"");
		map.put("fileName", attachFileDto.getOriginName());
		map.put("fileSize", attachFileDto.getFileSize()+"");
		map.put("uploadDate", attachFileDto.getUploadDate().toString());
		
		return map; 
	}

	public List<AttachFileDto> getMyFiles() {
		User user = new UserByToken().getInstance(); 
		return fileDao.selFilesByUser(user);
	}

	public void deleteFile(AttachFileDto attachFileDto) {
		fileDao.delFile(attachFileDto);
	} 

	public ModelAndView downloadFile(AttachFileDto attachFileDto) {
		AttachFileDto file = fileDao.selFileByFileId(attachFileDto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("download");
		mav.addObject("downFile", file);
		
		return mav;
	}
}

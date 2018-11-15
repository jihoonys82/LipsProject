package lips.file.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lips.file.dto.AttachFileDto;
import lips.file.service.FileService;

@Controller
@RequestMapping(value="/file")
public class FileController {
	@Autowired FileService fileService;
	
	/**
	 * User's uploaded file List via Ajax
	 */
	@RequestMapping(value="/myFile", method=RequestMethod.POST)
	public @ResponseBody Map<String, List<AttachFileDto>> myFile() {
		List<AttachFileDto> attachFiles = fileService.getMyFiles();
		Map<String, List<AttachFileDto>> map = new HashMap<>();
		map.put("files", attachFiles);
		
		return map;
	}
	
	/**
	 * File Upload via Ajax
	 */
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST)
	public @ResponseBody Map<String, String> uploadFile(MultipartFile uploadFile) {
		
		Map<String, String> map = fileService.uploadFile(uploadFile);
		
		return map; 
	}
	
	/**
	 * Delete a file via Ajax
	 * @param attachFileDto
	 * @param writer
	 */
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public void deleteFile(AttachFileDto attachFileDto, Writer writer) {
		
		fileService.deleteFile(attachFileDto);
		
		try {
			writer.write("{ \"result\" : \"deleted\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Download a file
	 * @param attachFileDto
	 * @return
	 */
	@RequestMapping(value="/downloadFile")
	public ModelAndView downloadFile(AttachFileDto attachFileDto) {
		
		ModelAndView mav = fileService.downloadFile(attachFileDto);
		
		return mav;
	}
}

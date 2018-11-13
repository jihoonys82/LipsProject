package lips.file.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import lips.file.dto.AttachFileDto;

public class DownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		AttachFileDto file = (AttachFileDto) model.get("downFile");
		
		// 이진데이터를 표현하는 MIME-type
		response.setContentType("application/octet-stream");
		
		// 파일크기 지정 
		response.setContentLength((int)file.getFileSize());
		
		// 인코딩 설정 
		response.setCharacterEncoding("UTF-8");
		
		// 파일이름 인코딩 설정
		String fileName = URLEncoder.encode(file.getOriginName(), "utf-8");
		// UTF-8 의 오류 수정
		fileName = fileName.replace("+", "%20");
		fileName = fileName.replace("%5B", "[");
		fileName = fileName.replace("%5D", "]");
		fileName = fileName.replace("%21", "!");
		fileName = fileName.replace("%23", "#");
		fileName = fileName.replace("%24", "$");
		fileName = fileName.replace("%25", "%");
		fileName = fileName.replace("%26", "&");
		fileName = fileName.replace("%27", "'");
		fileName = fileName.replace("%28", "(");
		fileName = fileName.replace("%29", ")");
		fileName = fileName.replace("%2B", "+");
		fileName = fileName.replace("%2C", ",");
		fileName = fileName.replace("%40", "@");
		fileName = fileName.replace("%5E", "^");
		
		// 헤더 설정 
		// 저장 위치 설정
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName +"\";" );
		
		// 서버의 File -> FileInputStream
		//  FileInputStream -> response OutputStream
		FileInputStream fis = null;
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("upload");
		File origin = new File(path, file.getStoredName());
		
		// 서버의 파일 스트림
		fis = new FileInputStream(origin);
		// 서버의 출력 스트림(클라이언트로..)
		OutputStream out = response.getOutputStream();
		// 파일 복사
		FileCopyUtils.copy(fis, out);
		// 버퍼 비우기
		out.flush();
		
		out.close();
		fis.close();
	}

}

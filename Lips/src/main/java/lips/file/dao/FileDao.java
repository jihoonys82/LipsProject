package lips.file.dao;

import java.util.List;

import lips.file.dto.AttachFileDto;
import lips.userinfo.dto.User;

public interface FileDao {

	/**
	 * Insert uploaded file data
	 * @param attachFileDto
	 */
	void inUploadFile(AttachFileDto attachFileDto);

	/**
	 * Select attach file list by User
	 * @param user
	 * @return
	 */
	List<AttachFileDto> selFilesByUser(User user);

	/**
	 * select a file by fileId
	 */
	AttachFileDto selFileByFileId(AttachFileDto attachFileDto);

	/**
	 * Delete a file 
	 * @param attachFileDto
	 */
	void delFile(AttachFileDto attachFileDto);
}

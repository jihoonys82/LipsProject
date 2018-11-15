package lips.freeboard.dao;

import java.util.List;

import lips.freeboard.dto.FComentDto;
import lips.freeboard.dto.FreeboardDto;

public interface FreeboardDao {
	
	/**
	 * 게시물 정보 받아오기
	 * @return
	 */
	public List<FreeboardDto> selectFreeboardlist(FreeboardDto dto); 
	
	/**
	 * 게시물 작성
	 * @param freeboardDto
	 */
	public void insWrite(FreeboardDto freeboardDto);

	/**
	 * 게시물 클릭하면 상세보기
	 * @param freeboardDto
	 * @return
	 */
	public FreeboardDto seldetailview(FreeboardDto freeboardDto);

	/**
	 * 게시물 수정하기
	 * @param freeboardDto
	 * @return
	 */
	public void boardUpdate(FreeboardDto freeboardDto);

	/**
	 * 게시물 삭제
	 * @param freeboardDto
	 */
	public void boardDelete(FreeboardDto freeboardDto);
	
	/**
	 * 게시글 클릭시 조회수 증가
	 * @param freeboardDto
	 */
	public void cntAdd(FreeboardDto freeboardDto);
	
	public List<FComentDto> selComentListByFbdId(FComentDto dto);
	
	public void insertComnet(FComentDto dto);
	
	public int seltotalCount();
	
	public List<FreeboardDto> selListtop5();
	

	
					
}

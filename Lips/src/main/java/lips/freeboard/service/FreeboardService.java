package lips.freeboard.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.freeboard.dao.FreeboardDao;
import lips.freeboard.dto.FComentDto;
import lips.freeboard.dto.FreeboardDto;
import lips.utils.Paging;

@Service
public class FreeboardService {
	@Autowired FreeboardDao fbdao;
	
	/**
	 * 게시물 모든 정보 받아오기
	 * @return
	 */
	public ModelAndView getList(int curpage) {
		ModelAndView mav = new ModelAndView();
		List<FreeboardDto> list = new ArrayList<>();
		FreeboardDto dto = new FreeboardDto();
		int totalCount = fbdao.seltotalCount();
		
		System.out.println("totalCount" + totalCount);
		System.out.println("curpage"+ curpage);
		
		Paging paging = new Paging(totalCount, curpage);
		
		dto.setStartNo(paging.getStartNo());
		dto.setEndNo(paging.getEndNo());
		
		list = fbdao.selectFreeboardlist(dto);
		
		mav.addObject("paging", paging);
		mav.addObject("list", list);
		mav.setViewName("freeboard/list");
		
		return mav; 
	}
	/**
	 * 글 쓰기
	 * @param freeboardDto
	 */
	public void setWrite(FreeboardDto freeboardDto) {
//		Date writedate = freeboardDto.getFboardWriteday();
//		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		fbdao.insWrite(freeboardDto);
	}

	/**
	 * 게시물 클릭하면 상세보기
	 * @param freeboardDto
	 * @return
	 */
	public ModelAndView detail(FreeboardDto freeboardDto) {
		ModelAndView mav = new ModelAndView();
		
		FreeboardDto dto = fbdao.seldetailview(freeboardDto);
		
		mav.addObject("boardRetrieve", dto);
		
		return mav;
	}
	
	public List<FComentDto> comentviewList(FreeboardDto freeboardDto){
		List<FComentDto> list = new ArrayList<>();
		FComentDto dto = new FComentDto();
		int fBoardId = freeboardDto.getFboardId();
		dto.setFboardId(fBoardId);
		
		list = fbdao.selComentListByFbdId(dto);
		
		return list ;
	}
	public void insertComent(FComentDto dto) {
		fbdao.insertComnet(dto);
	}
	/**
	 * 게시물 수정
	 * @param freeboardDto
	 * @return
	 */
	
	public void detailCounter(FreeboardDto freeboardDto) {
		freeboardDto = fbdao.seldetailview(freeboardDto);
		fbdao.cntAdd(freeboardDto);
	}

	public void boardUpdate(FreeboardDto freeboardDto) {
		
		fbdao.boardUpdate(freeboardDto);
		
	}
	
	/**
	 * 게시글 삭제
	 * @param freeboardDto
	 */
	public void boardDelete(FreeboardDto freeboardDto) {
		fbdao.boardDelete(freeboardDto);
		
	}
	
	public ModelAndView mainView() {
		ModelAndView mav = new ModelAndView();
		
		List<FreeboardDto> list = new ArrayList<>();
		
		list = fbdao.selListtop5();
		mav.addObject("list", list);
		
		return mav;
	}

	
}

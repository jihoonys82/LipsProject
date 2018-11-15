package lips.freeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lips.freeboard.dto.FComentDto;
import lips.freeboard.dto.FreeboardDto;
import lips.freeboard.service.FreeboardService;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

@Controller
@RequestMapping(value="/freeboard")
public class FreeboardController {
	@Autowired FreeboardService fbsvc;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam(required=false,defaultValue="0")int curPage) {
		ModelAndView mav = new ModelAndView();
			mav = fbsvc.getList(curPage);
		return mav;
	}
	
	/**
	 * 글 쓰기
	 * @return
	 */
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public ModelAndView write() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("freeboard/write");
		
		return mav;
	}
	
	/**
	 * 글 쓴 정보 받아오기
	 * @param freeboardDto
	 * @return
	 */
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView writeProc(FreeboardDto freeboardDto) {
		ModelAndView mav = new ModelAndView();
		
		fbsvc.setWrite(freeboardDto);
		mav.setViewName("redirect:/freeboard/list");
		
		return mav;
	}

	/**
	 * 글 클릭시 상세보기 및 조회수 증가
	 * @param freeboardDto
	 * @return
	 */
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView boardRetrieve(FreeboardDto freeboardDto) {
		ModelAndView mav = new ModelAndView();
		
		fbsvc.detailCounter(freeboardDto);
		mav = fbsvc.detail(freeboardDto);
		mav.addObject("comentList", fbsvc.comentviewList(freeboardDto));
		mav.setViewName("freeboard/detail");
		
		return mav;
	}
	@RequestMapping(value="/coment", method=RequestMethod.POST)
	public ModelAndView boardRetrieve(FComentDto dto) {
		ModelAndView mav = new ModelAndView();
		User user = new UserByToken().getInstance();
		dto.setFcomentWriter(user.getUserId());
		
		fbsvc.insertComent(dto);
		
		mav.setViewName("redirect:/freeboard/detail?fboardId="+dto.getFboardId());
		
		return mav;
	}
	
	/**
	 * 게시물 수정하기
	 * @param freeboardDto
	 * @return
	 */
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.GET)
	public ModelAndView boardUpdateView(int fboardId , FreeboardDto freeboardDto) {
		ModelAndView mav = new ModelAndView();
		
		mav = fbsvc.detail(freeboardDto);
		
		mav.setViewName("freeboard/boardUpdate");
		
		return mav;
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public ModelAndView boardUpdateProc(FreeboardDto freeboardDto) {
		ModelAndView mav = new ModelAndView();
	
		fbsvc.boardUpdate(freeboardDto);
		int fboardId = freeboardDto.getFboardId();
		
		mav.setViewName("redirect:/freeboard/detail?fboardId="+fboardId);
		
		return mav;
	}

	/**
	 * 게시글 삭제
	 * @param freeboardDto
	 * @return
	 */
	@RequestMapping(value="/boardDelete", method=RequestMethod.POST)
	public ModelAndView boardDelete(int fboardId ,FreeboardDto freeboardDto) {
		ModelAndView mav = new ModelAndView();
		
		fbsvc.boardDelete(freeboardDto);

		mav.setViewName("redirect:/freeboard/list");
		
		return mav;
	}
	
	@RequestMapping(value="/mainView", method=RequestMethod.GET)
	public ModelAndView mainView() {
		ModelAndView mav = new ModelAndView();
		
		mav = fbsvc.mainView();

		mav.setViewName("freeboard/mainView");
		
		return mav;
	}
	
	
}

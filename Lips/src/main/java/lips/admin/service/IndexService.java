package lips.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.admin.dao.AdminDao;
import lips.admin.dto.IndexDto;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;
import lips.utils.Paging;

@Service
public class IndexService {
	@Autowired AdminDao adao;
	
	public Map<String, String> splitData(String data) {
		
		int length = data.split(",").length;
		
		List<String> splitList = new ArrayList<>();
		Map<String, String> splitMap = new HashMap<>();
	
		for(int i = 0 ; i<length; i++) {
			splitList.add(data.split(",")[i]);
		}
		for(int j = 0 ; j<length; j++) {
			String startreplace = splitList.get(j).split(":")[0].replace("[{", "");
			String startre = startreplace.replace("\"", "");
//			System.out.println(startre);
			String endreplace = splitList.get(j).split(":")[1].replace("}]", "");
			String endre = endreplace.replace("\"", "");
			splitMap.put(startre, endre) ;
		}

		return splitMap;
	}
	
	
	public ModelAndView getProListIndex(int curPage, Map<String, String> indexData) {
		ModelAndView mav = new ModelAndView();
		IndexDto dto = new IndexDto();
		List<ProjectDto> pList = new ArrayList<>();
		dto.setStartdate(indexData.get("startdate"));
		dto.setEnddate(indexData.get("enddate"));
		dto.setInputValue(indexData.get("inputValue"));
		dto.setCombodata(indexData.get("combodata"));

		//data null checker 
		if(!(indexData.get("startdate").equals("")&&indexData.get("enddate").equals("")&&indexData.get("inputValue").equals(""))) {
			
			//date 가 없을때
		if((indexData.get("startdate").equals("")||indexData.get("enddate").equals(""))&&(indexData.get("inputValue")!="")) {
			if(dto.getCombodata().equals("projectkey")) {
				//선택 콤보박스가 프로젝트 key 일때
				
				int totalCount = adao.totalPageIndexPJkeyNodate(dto);
				Paging paging = new Paging(totalCount, curPage);
				
				dto.setStartNo(paging.getStartNo());
				dto.setEndNo(paging.getEndNo());
				
				pList = adao.selProInfoIndexPJkeyNodate(dto);
				
				mav.addObject("paging",paging);
				mav.addObject("pList",pList);
				
			}else if(dto.getCombodata().equals("projectname")) {
				//선택 콤보박스가 프로젝트 명일때
				
				int totalCount = adao.totalPageIndexPJnameNodate(dto);
				Paging paging = new Paging(totalCount, curPage);
				
				dto.setStartNo(paging.getStartNo());
				dto.setEndNo(paging.getEndNo());
				
				pList = adao.selProInfoIndexPJnameNodate(dto);
				
				mav.addObject("paging",paging);
				mav.addObject("pList",pList);
				
			}else if(dto.getCombodata().equals("status")) {
				//선택 콤보박스가 프로젝트 상태일때
				
				int totalCount = adao.totalPageIndexPJstatusNodate(dto);
				Paging paging = new Paging(totalCount, curPage);
				
				dto.setStartNo(paging.getStartNo());
				dto.setEndNo(paging.getEndNo());
				
				pList = adao.selProInfoIndexPJstatusNodate(dto);
				
				mav.addObject("paging",paging);
				mav.addObject("pList",pList);
			}
			
		//inputvalue 가 null 일때
		  }else if(indexData.get("inputValue").equals("")) {
				int totalCount = adao.totalPageIndexNoInput(dto);
				Paging paging = new Paging(totalCount, curPage);
				
				dto.setStartNo(paging.getStartNo());
				dto.setEndNo(paging.getEndNo());
				
				pList = adao.selProInfoIndexNoInput(dto);
				
				mav.addObject("paging",paging);
				mav.addObject("pList",pList);
		// 모든 입력정보가 입력되었을때		
		  }else{
			  if(dto.getCombodata().equals("projectkey")) {
					//선택 콤보박스가 프로젝트 key 일때
					
					int totalCount = adao.totalPageIndexPJkey(dto);
					Paging paging = new Paging(totalCount, curPage);
					
					dto.setStartNo(paging.getStartNo());
					dto.setEndNo(paging.getEndNo());
					
					pList = adao.selProInfoIndexPJkey(dto);
					
					mav.addObject("paging",paging);
					mav.addObject("pList",pList);
					
				}else if(dto.getCombodata().equals("projectname")) {
					//선택 콤보박스가 프로젝트 명일때
					
					int totalCount = adao.totalPageIndexPJname(dto);
					Paging paging = new Paging(totalCount, curPage);
					
					dto.setStartNo(paging.getStartNo());
					dto.setEndNo(paging.getEndNo());
					
					pList = adao.selProInfoIndexPJname(dto);
					
					mav.addObject("paging",paging);
					mav.addObject("pList",pList);
					
				}else if(dto.getCombodata().equals("status")) {
					//선택 콤보박스가 프로젝트 상태일때
					
					int totalCount = adao.totalPageIndexPJstatus(dto);
					Paging paging = new Paging(totalCount, curPage);
					
					dto.setStartNo(paging.getStartNo());
					dto.setEndNo(paging.getEndNo());
					
					pList = adao.selProInfoIndexPJstatus(dto);
					
					mav.addObject("paging",paging);
					mav.addObject("pList",pList);
				}
		  }
		//입력을 안받았을때
		}else {
			
			int totalCount = adao.totalPagePJindexAll(dto);
			Paging paging = new Paging(totalCount, curPage);
			
			dto.setStartNo(paging.getStartNo());
			dto.setEndNo(paging.getEndNo());
			
			pList = adao.selProInfoIndexAll(dto);
			
			mav.addObject("paging",paging);
			mav.addObject("pList",pList);
		}
		return mav;
	}
	
	
	public ModelAndView getUserList(Map<String, String> indexData, int curPage) {
		ModelAndView mav = new ModelAndView();
		IndexDto dto = new IndexDto();
		List<User> userList = new ArrayList<>();
		int totalCount = 0 ;
		
		dto.setStartdate(indexData.get("startdate"));
		dto.setEnddate(indexData.get("enddate"));
		dto.setInputValue(indexData.get("inputValue"));
		dto.setCombodata(indexData.get("combodata"));
		
		//date 입력 안했을때
		  if(indexData.get("startdate").equals("")||indexData.get("enddate").equals("")) {
			  if(dto.getCombodata().equals("userid")) {
					totalCount = adao.totalPageIndexUserByUseridNodate(dto);
					Paging paging  = new Paging(totalCount, curPage);
					dto.setStartNo(paging.getStartNo());
					dto.setEndNo(paging.getEndNo());
					
					userList = adao.seluserinfoIndexUseridNodate(dto);
					mav.addObject("paging",paging);
					
				}else if(dto.getCombodata().equals("usernick")) {
					totalCount = adao.totalPageIndexUserByUsernickNodate(dto);
					Paging paging  = new Paging(totalCount, curPage);
					dto.setStartNo(paging.getStartNo());
					dto.setEndNo(paging.getEndNo());
					
					userList = adao.seluserinfoIndexUsernickNodate(dto);
					mav.addObject("paging",paging);
				}
		//inputvalue 입력 안했을때
		  }else if(indexData.get("inputValue").equals("")) {
			  totalCount = adao.totalPageIndexUserByDate(dto);
			  Paging paging = new Paging(totalCount, curPage);
			  dto.setStartNo(paging.getStartNo());
			  dto.setEndNo(paging.getEndNo());
			  
			  userList = adao.seluserinfoINdexDate(dto);
			  mav.addObject("paging",paging);
		 //데이터 입력을 안했을때
		  }else if(indexData.get("inputValue").equals("")&&indexData.get("combodata").equals("")&&
				  indexData.get("startdate").equals("")&&indexData.get("enddate").equals("")){
			  totalCount = adao.totalPageIndexUserAll(dto);
				Paging paging  = new Paging(totalCount, curPage);
				dto.setStartNo(paging.getStartNo());
				dto.setEndNo(paging.getEndNo());
				
				userList = adao.seluserinfoIndexAll(dto);
				mav.addObject("paging",paging);
		//모든 데이터를 입력했을때
		  }else {
			  if(dto.getCombodata().equals("userid")) {
					totalCount = adao.totalPageIndexUserByUserid(dto);
					Paging paging  = new Paging(totalCount, curPage);
					dto.setStartNo(paging.getStartNo());
					dto.setEndNo(paging.getEndNo());
					
					userList = adao.seluserinfoIndexUserid(dto);
					mav.addObject("paging",paging);
					
				}else if(dto.getCombodata().equals("usernick")) {
					totalCount = adao.totalPageIndexUserByUsernick(dto);
					Paging paging  = new Paging(totalCount, curPage);
					dto.setStartNo(paging.getStartNo());
					dto.setEndNo(paging.getEndNo());
					
					userList = adao.seluserinfoIndexUsernick(dto);
					mav.addObject("paging",paging);
				}
		  }
		
		List<Boolean> userIsLeaderList = new ArrayList<Boolean>();
		java.util.Iterator<User> itr = userList.iterator();
		while(itr.hasNext()) {
			if(adao.selIsLeader(itr.next())!=0) {
				//리더임
				userIsLeaderList.add(true);
			}else {
				//리더아님
				userIsLeaderList.add(false);
			}
		}
		
		mav.addObject("uLeaderList", userIsLeaderList);
		mav.addObject("uList", userList);

		return mav;
	}
}

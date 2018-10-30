package lips.issue.dao;

import java.util.List;
import java.util.Map;

import lips.issue.dto.CategoryAssetDto;
import lips.issue.dto.IssueDto;
import lips.issue.dto.IssueStagePresetDto;
import lips.issue.dto.StageAssetDto;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;
import lips.utils.Paging;

public interface IssueDao {
	
	/**
	 * Issue the closest deadline
	 * @param user
	 * @return IssueDto
	 */
	public IssueDto selIssueByDealine(User user);
	
	/**
	 * Issue the most followed
	 * @param user
	 * @return IssueDto
	 */
	public IssueDto selIssueByFollower(User user);
	
	/**
	 * Issue assigned to me
	 * @param user
	 * @return
	 */
	public List<IssueDto> selIssueByAssignee(User user);
	
	/**
	 * Issue the user is following
	 * @param user
	 * @return
	 */
	public List<IssueDto> selIssueByFollowing(User user);
	
	/**
	 * Get the number of watcher 
	 * @param issueDto
	 * @return
	 */
	public int selIssueWatcherCount(IssueDto issueDto);
	
	/**
	 * get the number of comment
	 * @param issueDto
	 * @return
	 */
	public int selIssueCommentCount(IssueDto issueDto);

	/**
	 * get Category List by projectInfo;
	 * @param projectDto
	 * @return
	 */
	public List<CategoryAssetDto> selCatByProjId(ProjectDto projectDto);
	
	/**
	 * Search Users by Name(partial)
	 * @param map (name, projectId)
	 * @return
	 */
	public List<User> selUserByName(Map<String, String> map);
	
	/**
	 * get All Issue stage presets.
	 * @return
	 */
	public List<IssueStagePresetDto> selIssueStagePreset();

	/**
	 * get Stage asset from issuePresetId 
	 * @param ispDto
	 * @return
	 */
	public List<StageAssetDto> selStageAssetByPresetId(IssueStagePresetDto ispDto);
	
	
	/**
	 * Insert new Issue
	 * @param issueDto
	 */
	public void inIssue(IssueDto issueDto);
	
	/**
	 * get Issue list in the project
	 * @param projectDto
	 * @return
	 */
	public List<IssueDto> selIssueByProject(ProjectDto projectDto);
	
	/**
	 * get All stage asset 
	 * @return
	 */
	public List<StageAssetDto> selStageAsset();

	/**
	 * get Total count of Following issue
	 * @param issueOwner
	 * @return
	 */
	public int selTotalCountByIssueFollowing(User issueOwner);
	
	/**
	 * get Following issue for paging
	 * @param map
	 * @return
	 */
	public List<IssueDto> selIssueByFollowingPaging(Map<String, String> map);

	/**
	 * get Total count of issue by Assignee
	 * @param issueOwner
	 * @return
	 */
	public int selTotalCountByAssignee(User issueOwner);

	/**
	 * get assigned Issue for paging 
	 * @param aMap
	 * @return
	 */
	public List<IssueDto> selIssueByAssgineePaging(Map<String, String> map);

	/**
	 * get Total count of issue by Project
	 * @param projectDto
	 * @return
	 */
	public int selTotalCountByProject(ProjectDto projectDto);
	
	/**
	 * get Project Issue for paging
	 * @param pMap
	 * @return
	 */
	public List<IssueDto> selIssueByProjectPaging(Map<String, String> pMap);
	
}

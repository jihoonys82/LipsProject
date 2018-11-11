package lips.issue.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lips.issue.dto.CategoryAssetDto;
import lips.issue.dto.IssueCommentDto;
import lips.issue.dto.IssueDto;
import lips.issue.dto.IssueStagePresetDto;
import lips.issue.dto.StageAssetDto;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

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
	public List<IssueStagePresetDto> selIssueStagePreset(ProjectDto projectDto);

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

	/**
	 * Check the user in project
	 * @param map
	 * @return
	 */
	public int selCountProjectMember(Map<String, String> map);

	/**
	 * get Issue by IssueId in the issueDto
	 * @param issueDto
	 * @return
	 */
	public IssueDto selIssueByIssueId(IssueDto issueDto);

	/**
	 * get Count the issue follower by issueId
	 * @param issue
	 * @return
	 */
	public int selCountIssueFollowingByIssue(IssueDto issue);

	/**
	 * get Users for following the issue
	 * @param issue
	 * @return
	 */
	public List<User> selFollowerByIssue(IssueDto issue);

	/**
	 * get issue comments by the Issue
	 * @param issue
	 * @return
	 */
	public List<IssueCommentDto> selCommentByIssue(IssueDto issueDto);
	
	/**
	 * check the user is participating in project. 
	 * @param user
	 * @return
	 */
	public int selCountParticipatedByUser(User user);

	/**
	 * update Assginee
	 * @param map : issueId, userId(new assignee)
	 */
	public void upIssueAssignee(Map<String, String> map);

	/**
	 * Delete issue Comment 
	 * @param issueCommentDto
	 */
	public void delComment(IssueCommentDto issueCommentDto);

	/**
	 * Add issue Comment
	 * @param issueCommentDto
	 * @return commentId 
	 */
	public int inComment(IssueCommentDto issueCommentDto);

	/**
	 * Get single issueComment by commentId
	 * @param icId : IssueCommentDto
	 * @return
	 */
	public IssueCommentDto selCommentById(IssueCommentDto icId);
	/**
	 * Add Stage Asset
	 * @param stageAssetDto
	 */
	public void inStageAsset(StageAssetDto stageAssetDto);
	/**
	 * save Preset
	 * @param issueStagePresetDto
	 */
	public void inStagePreset(IssueStagePresetDto issueStagePresetDto);
	/**
	 * save PresetMapper
	 * @param assetIdList
	 */
	public void inStagePresetAsset(Map<String,List<Integer>> assetList);
	/**
	 * delete preset
	 * @param issuePresetId
	 */
	public void delPreset(int issuePresetId);
	/**
	 * delete asset
	 * @param stageAssetId
	 */
	public void delStageAsset(StageAssetDto stageAssetDto);
	
	/**
	 * modify presetAssetList
	 * @param assetList
	 */
	public void inModifyPreset(Map<String,Object> assetList);
	
	public void upStagePreset(IssueStagePresetDto issueStagePresetDto);
	/**
	 * delete maaper table
	 * @param issuePresetId
	 */
	public void delStagePresetAsset(int issuePresetId);
	
	/**
	 * Get private/Default StageAsset for Project
	 * @param user
	 * @return
	 */
	public List<StageAssetDto> selStageAsset(int projectId);
	/**
	 * Get private/Default StagePreset for Project
	 * @param projectId
	 * @return
	 */
	public List<IssueStagePresetDto> selStagePreset(int projectId);
}

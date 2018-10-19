package lips.issue.dao;

import java.util.List;
import java.util.Map;

import lips.issue.dto.CategoryAssetDto;
import lips.issue.dto.IssueDto;
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
	
	
}

package lips.project.dao;

import java.util.List;

import lips.project.dto.ProjectDto;

public interface ProjectDao {
	public List selPro(ProjectDto dto);
	public boolean inPro(ProjectDto dto); 
	public boolean upPro(ProjectDto dto);
	public boolean delPro(ProjectDto dto);
}

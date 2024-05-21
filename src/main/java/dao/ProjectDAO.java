package dao;

import classes.Project;

import java.sql.SQLException;
import java.util.List;

public interface ProjectDAO {
    void addProject(Project project) throws SQLException;
    List<Project> getAllProjects() throws SQLException;
    void updateProject(Project project) throws SQLException;
    void deleteProject(int projectId) throws SQLException;
    Project getProjectById(int projectId) throws SQLException;
}

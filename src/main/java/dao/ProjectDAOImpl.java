package dao;

import classes.Project;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAOImpl implements ProjectDAO {
    private Connection connection;

    public ProjectDAOImpl() throws SQLException, ClassNotFoundException {
        connection = DBConnection.getConnection();
    }

    @Override
    public void addProject(Project project) throws SQLException {
        String query = "INSERT INTO projects (name, description, start_Date, end_Date, budget) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, project.getName());
            stmt.setString(2, project.getDescription());
            stmt.setDate(3, new java.sql.Date(project.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(project.getEndDate().getTime()));
            stmt.setDouble(5, project.getBudget());
            stmt.executeUpdate();
        }
    }

    @Override
    public List<Project> getAllProjects() throws SQLException {
        List<Project> projects = new ArrayList<>();
        String query = "SELECT * FROM projects";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Project project = new Project();
                project.setId(rs.getInt("id"));
                project.setName(rs.getString("name"));
                project.setDescription(rs.getString("description"));
                project.setStartDate(rs.getDate("start_Date"));
                project.setEndDate(rs.getDate("end_Date"));
                project.setBudget(rs.getDouble("budget"));
                projects.add(project);
            }
        }
        return projects;
    }

    @Override
    public void updateProject(Project project) throws SQLException {
        String query = "UPDATE projects SET name = ?, description = ?, start_Date = ?, end_Date = ?, budget = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, project.getName());
            stmt.setString(2, project.getDescription());
            stmt.setDate(3, new Date(project.getStartDate().getTime()));
            stmt.setDate(4, new Date(project.getEndDate().getTime()));
            stmt.setDouble(5, project.getBudget());
            stmt.setInt(6, project.getId());
            stmt.executeUpdate();
        }
    }

    @Override
    public void deleteProject(int projectId) throws SQLException {
        String query = "DELETE FROM projects WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, projectId);
            stmt.executeUpdate();
        }
    }
    @Override
    public Project getProjectById(int projectId) throws SQLException {
        String query = "SELECT * FROM projects WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, projectId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Project project = new Project();
                    project.setId(rs.getInt("id"));
                    project.setName(rs.getString("name"));
                    return project;
                }
            }
        }
        return null;
    }
}

package dao;

import classes.Project;
import classes.Task;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAOImpl implements TaskDAO {
    private Connection connection;
    private ProjectDAO projectDAO;

    public TaskDAOImpl() throws SQLException, ClassNotFoundException {
        connection = DBConnection.getConnection();
        projectDAO = new ProjectDAOImpl();
    }

    @Override
    public void addTask(Task task) throws SQLException {
        String query = "INSERT INTO tasks (project_id, description, start_date, end_date, status, picture) VALUES (?, ?, ?, ?, ?,?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, task.getProject().getId());
            stmt.setString(2, task.getDescription());
            stmt.setDate(3, new java.sql.Date(task.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(task.getEndDate().getTime()));
            stmt.setString(5, task.getStatus());
            stmt.setString(6,task.getPicture());
            stmt.executeUpdate();
        }
    }

    @Override
    public List<Task> getTasksForProject(int projectId) throws SQLException {
        List<Task> tasks = new ArrayList<>();
        String query = "SELECT * FROM tasks WHERE project_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, projectId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Task task = new Task();
                    task.setId(rs.getInt("id"));
                    Project project = projectDAO.getProjectById(rs.getInt("project_id"));
                    task.setProject(project);
                    task.setDescription(rs.getString("description"));
                    task.setStartDate(rs.getDate("start_date"));
                    task.setEndDate(rs.getDate("end_date"));
                    task.setStatus(rs.getString("status"));
                    task.setPicture(rs.getString("picture"));
                    tasks.add(task);
                }
            }
        }
        return tasks;
    }
    @Override
    public Task getTaskById(int taskId) throws SQLException {
        String query = "SELECT * FROM tasks WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, taskId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Task task = new Task();
                    task.setId(rs.getInt("id"));
                    Project project = projectDAO.getProjectById(rs.getInt("project_id"));
                    task.setProject(project);
                    task.setDescription(rs.getString("description"));
                    task.setStartDate(rs.getDate("start_date"));
                    task.setEndDate(rs.getDate("end_date"));
                    task.setStatus(rs.getString("status"));
                    task.setPicture(rs.getString("picture"));
                    return task;
                } else {
                    throw new SQLException("Task not found");
                }
            }
        }
    }

    @Override
    public void updateTask(Task task) throws SQLException {
        String query = "UPDATE tasks SET description = ?, start_date = ?, end_date = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, task.getDescription());
            stmt.setDate(2, new java.sql.Date(task.getStartDate().getTime()));
            stmt.setDate(3, new java.sql.Date(task.getEndDate().getTime()));
            stmt.setString(4, task.getStatus());
            stmt.setInt(5, task.getId());

            stmt.executeUpdate();
        }
    }

    @Override
    public void deleteTask(int taskId) throws SQLException {
        String query = "DELETE FROM tasks WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, taskId);
            stmt.executeUpdate();
        }
    }
}

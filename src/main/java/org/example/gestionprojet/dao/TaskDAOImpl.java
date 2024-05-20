package org.example.gestionprojet.dao;

import com.example.gestionprojets.util.DBConnection;
import org.example.gestionprojet.classes.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAOImpl implements TaskDAO {
    private Connection connection;

    public TaskDAOImpl() throws SQLException, ClassNotFoundException {
        connection = DBConnection.getConnection();
    }

    @Override
    public void addTask(Task task) throws SQLException {
        String query = "INSERT INTO tasks (project_id, description, start_date, end_date, status) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, task.getProjectId());
            stmt.setString(2, task.getDescription());
            stmt.setDate(3, new java.sql.Date(task.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(task.getEndDate().getTime()));
            stmt.setString(5, task.getStatus());
            stmt.executeUpdate();
        }
    }

    @Override
    public List<Task> getTasksForProject(int projectId) throws SQLException {
        List<Task> tasks = new ArrayList<>();
        String query = "SELECT * FROM tasks WHERE project_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, projectId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Task task = new Task();
                task.setId(rs.getInt("id"));
                task.setProjectId(rs.getInt("project_id"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(rs.getDate("start_date"));
                task.setEndDate(rs.getDate("end_date"));
                task.setStatus(rs.getString("status"));
                tasks.add(task);
            }
        }
        return tasks;
    }

    @Override
    public void updateTask(Task task) throws SQLException {
        String query = "UPDATE tasks SET description = ?, start_date = ?, end_date = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, task.getDescription());
            stmt.setDate(2, new Date(task.getStartDate().getTime()));
            stmt.setDate(3, new Date(task.getEndDate().getTime()));
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

package dao;

import classes.Task;  // Correct import for your Task class

import java.sql.SQLException;
import java.util.List;

public interface TaskDAO {
    void addTask(Task task) throws SQLException;
    List<Task> getTasksForProject(int projectId) throws SQLException;
    Task getTaskById(int taskId) throws SQLException;  // Added method
    void updateTask(Task task) throws SQLException;
    void deleteTask(int taskId) throws SQLException;
}

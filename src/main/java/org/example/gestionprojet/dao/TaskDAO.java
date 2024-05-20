package org.example.gestionprojet.dao;

import org.example.gestionprojet.classes.Task;

import java.sql.SQLException;
import java.util.List;

public interface TaskDAO {
    void addTask(Task task) throws SQLException;
    List<Task> getTasksForProject(int projectId) throws SQLException;
    void updateTask(Task task) throws SQLException;
    void deleteTask(int taskId) throws SQLException;
}


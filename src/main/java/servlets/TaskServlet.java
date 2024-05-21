package servlets;

import classes.Project;
import classes.Task;
import dao.ProjectDAO;
import dao.ProjectDAOImpl;
import dao.TaskDAO;
import dao.TaskDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    private TaskDAO taskDAO;
    private ProjectDAO projectDAO;  // Add this line

    @Override
    public void init() {
        try {
            taskDAO = new TaskDAOImpl();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        projectDAO = new ProjectDAOImpl();

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int projectId = Integer.parseInt(req.getParameter("projectId"));
        try {
            List<Task> tasks = taskDAO.getTasksForProject(projectId);
            req.setAttribute("tasks", tasks);
            req.setAttribute("projectId", projectId);
            req.getRequestDispatcher("WEB-INF/tasks.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve tasks", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Add new task
        int projectId = Integer.parseInt(req.getParameter("projectId"));
        String description = req.getParameter("description");
        Date startDate = Date.valueOf(req.getParameter("startDate"));
        Date endDate = Date.valueOf(req.getParameter("endDate"));
        String status = req.getParameter("status");

        Task task = new Task();
        task.setDescription(description);
        task.setStartDate(startDate);
        task.setEndDate(endDate);
        task.setStatus(status);

        try {
            Project project = projectDAO.getProjectById(projectId);  // Fetch the project
            task.setProject(project);

            taskDAO.addTask(task);
            resp.sendRedirect("tasks?projectId=" + projectId);
        } catch (SQLException e) {
            throw new ServletException("Cannot add task", e);
        }
    }
}

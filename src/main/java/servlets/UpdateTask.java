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

@WebServlet("/updateTask")
public class UpdateTask extends HttpServlet {
    private TaskDAO taskDAO;
    private ProjectDAO projectDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            taskDAO = new TaskDAOImpl();
            projectDAO = new ProjectDAOImpl();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error initializing DAOs", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        try {
            Task task = taskDAO.getTaskById(taskId); // Assuming you have this method in your TaskDAO
            req.setAttribute("task", task);
            req.getRequestDispatcher("/WEB-INF/UpdateTask.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Error fetching task", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));
        String description = req.getParameter("description");
        Date startDate = Date.valueOf(req.getParameter("startDate"));
        Date endDate = Date.valueOf(req.getParameter("endDate"));
        String status = req.getParameter("status");

        Task task = new Task();
        task.setId(taskId);
        task.setDescription(description);
        task.setStartDate(startDate);
        task.setEndDate(endDate);
        task.setStatus(status);

        Project project;
        try {
            project = projectDAO.getProjectById(projectId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        task.setProject(project);

        try {
            taskDAO.updateTask(task);
            resp.sendRedirect("tasks?projectId=" + projectId);
        } catch (SQLException e) {
            throw new ServletException("Error updating task", e);
        }
    }
}

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

@WebServlet("/addTask")
public class AddTask extends HttpServlet {
    private TaskDAO taskDAO;
    private ProjectDAO projectDAO;

    @Override
    public void init() throws ServletException {
        super.init();


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
        req.getRequestDispatcher("/WEB-INF/AddTask.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        String status = request.getParameter("status");

        Task task = new Task();
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

        if (project != null) {
            task.setProject(project);
            try {
                taskDAO.addTask(task);
                response.sendRedirect("tasks?projectId=" + projectId);
            } catch (SQLException e) {
                throw new ServletException("Error adding task", e);
            }
        } else {
            throw new ServletException("Project not found for ID: " + projectId);
        }
    }
}

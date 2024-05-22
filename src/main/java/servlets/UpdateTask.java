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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/updateTask")
public class UpdateTask extends HttpServlet {
    private TaskDAO taskDAO;
    private ProjectDAO projectDAO;
    private static final Logger LOGGER = Logger.getLogger(UpdateTask.class.getName());

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
        String taskIdStr = req.getParameter("id");
        LOGGER.log(Level.INFO, "Received taskId: {0}", taskIdStr);

        if (taskIdStr == null || taskIdStr.isEmpty()) {
            LOGGER.log(Level.SEVERE, "Missing or invalid taskId");
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid taskId");
            return;
        }

        int taskId;
        try {
            taskId = Integer.parseInt(taskIdStr);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid taskId format: {0}", taskIdStr);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid taskId format");
            return;
        }

        try {
            Task task = taskDAO.getTaskById(taskId);
            if (task == null) {
                LOGGER.log(Level.SEVERE, "Task not found for id: {0}", taskId);
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Task not found");
                return;
            }
            req.setAttribute("task", task);
            req.getRequestDispatcher("/WEB-INF/updateTask.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Error fetching task", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskIdStr = req.getParameter("id");
        String projectIdStr = req.getParameter("projectId");
        String description = req.getParameter("description");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        String status = req.getParameter("status");

        LOGGER.log(Level.INFO, "Received parameters: taskId={0}, projectId={1}, description={2}, startDate={3}, endDate={4}, status={5}",
                new Object[]{taskIdStr, projectIdStr, description, startDateStr, endDateStr, status});

        if (taskIdStr == null || taskIdStr.isEmpty() ||
                projectIdStr == null || projectIdStr.isEmpty() ||
                description == null || description.isEmpty() ||
                startDateStr == null || startDateStr.isEmpty() ||
                endDateStr == null || endDateStr.isEmpty() ||
                status == null || status.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid parameters");
            return;
        }

        int taskId;
        int projectId;
        Date startDate;
        Date endDate;

        try {
            taskId = Integer.parseInt(taskIdStr);
            projectId = Integer.parseInt(projectIdStr);
            startDate = Date.valueOf(startDateStr);
            endDate = Date.valueOf(endDateStr);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid format for taskId or projectId");
            return;
        } catch (IllegalArgumentException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format");
            return;
        }

        Task task = new Task();
        task.setId(taskId);
        task.setDescription(description);
        task.setStartDate(startDate);
        task.setEndDate(endDate);
        task.setStatus(status);

        try {
            Project project = projectDAO.getProjectById(projectId);
            if (project == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Project not found");
                return;
            }
            task.setProject(project);
            taskDAO.updateTask(task);
            resp.sendRedirect("tasks?projectId=" + projectId);
        } catch (SQLException e) {
            throw new ServletException("Error updating task", e);
        }
    }
}

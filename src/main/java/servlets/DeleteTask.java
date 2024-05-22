package servlets;

import dao.TaskDAO;
import dao.TaskDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/deleteTask")
public class DeleteTask extends HttpServlet {
    private TaskDAO taskDAO;
    private static final Logger LOGGER = Logger.getLogger(DeleteTask.class.getName());

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            taskDAO = new TaskDAOImpl();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error initializing TaskDAO", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskIdStr = req.getParameter("id");
        String projectIdStr = req.getParameter("projectId");

        if (taskIdStr == null || taskIdStr.isEmpty() || projectIdStr == null || projectIdStr.isEmpty()) {
            LOGGER.log(Level.WARNING, "Missing task ID or project ID");
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing task ID or project ID");
            return;
        }

        int taskId;
        int projectId;

            taskId = Integer.parseInt(taskIdStr);
            projectId = Integer.parseInt(projectIdStr);



        try {
            taskDAO.deleteTask(taskId);
            resp.sendRedirect(req.getContextPath() + "/tasks?projectId=" + projectId);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL error while deleting task", e);
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting task");
        }
    }
}

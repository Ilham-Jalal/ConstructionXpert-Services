package servlets;

import classes.Resource;
import dao.ResourceDAO;
import dao.ResourceDAOImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/listResources")
public class ResourceServlet extends HttpServlet {
    private ResourceDAO resourceDAO;
    private static final Logger LOGGER = Logger.getLogger(ResourceServlet.class.getName());

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            resourceDAO = new ResourceDAOImpl();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error initializing ResourceDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taskIdStr = req.getParameter("taskId");
        if (taskIdStr == null || taskIdStr.isEmpty()) {
            // Gérer le cas où taskId est vide
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Task ID is missing or empty");
            return;
        }

        int taskId;
        try {
            taskId = Integer.parseInt(taskIdStr);
        } catch (NumberFormatException e) {
            // Gérer le cas où taskId n'est pas un nombre valide
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Task ID format");
            return;
        }

        List<Resource> taskResources;
        try {
            taskResources = resourceDAO.getResourcesByTaskId(taskId);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching task resources", e);
            throw new ServletException("Error fetching task resources", e);
        }

        req.setAttribute("taskResources", taskResources);
        req.getRequestDispatcher("/WEB-INF/Resource.jsp").forward(req, resp);
    }
}

package servlets;

import dao.ResourceDAO;
import dao.ResourceDAOImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteResource")
public class DeleteResource extends HttpServlet {
    private ResourceDAO resourceDAO;

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String resourceIdParam = req.getParameter("resourceId");
        String taskIdParam = req.getParameter("taskId");

        if (resourceIdParam != null && !resourceIdParam.isEmpty() && taskIdParam != null && !taskIdParam.isEmpty()) {
            try {
                int resourceId = Integer.parseInt(resourceIdParam);
                int taskId = Integer.parseInt(taskIdParam);

                resourceDAO.deleteResource(resourceId);

                resp.sendRedirect(req.getContextPath() + "/listResources?taskId=" + taskId);
            } catch (NumberFormatException | SQLException e) {
                throw new ServletException("Error deleting resource", e);
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid parameters.");
        }
    }

}



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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/deleteResource")
public class DeleteResource extends HttpServlet {
    private ResourceDAO resourceDAO;
    private static final Logger LOGGER = Logger.getLogger(DeleteResource.class.getName());

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
        String resourceIdStr = req.getParameter("resourceId");
        try {
            int resourceId = Integer.parseInt(resourceIdStr);
            resourceDAO.deleteResource(resourceId);
            resp.sendRedirect("listResources");
        } catch (NumberFormatException | SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting resource", e);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid resourceId");
        }
    }
}

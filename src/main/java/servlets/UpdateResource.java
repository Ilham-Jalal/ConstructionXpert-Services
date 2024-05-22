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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/updateResource")
public class UpdateResource extends HttpServlet {
    private ResourceDAO resourceDAO;
    private static final Logger LOGGER = Logger.getLogger(UpdateResource.class.getName());

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
        String resourceIdStr = req.getParameter("resourceId");
        int resourceId;
        try {
            resourceId = Integer.parseInt(resourceIdStr);
            Resource resource = resourceDAO.getAllResources().stream().filter(r -> r.getId() == resourceId).findFirst().orElse(null);
            if (resource == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
                return;
            }
            req.setAttribute("resource", resource);
            req.getRequestDispatcher("/WEB-INF/UpdateResource.jsp").forward(req, resp);
        } catch (NumberFormatException | SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching resource", e);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid resourceId");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String type = req.getParameter("type");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String supplierInfo = req.getParameter("supplierInfo");

        Resource resource = new Resource();
        resource.setId(id);
        resource.setName(name);
        resource.setType(type);
        resource.setQuantity(quantity);
        resource.setSupplierInfo(supplierInfo);

        try {
            resourceDAO.updateResource(resource);
            resp.sendRedirect("listResources");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating resource", e);
            throw new ServletException("Error updating resource", e);
        }
    }
}

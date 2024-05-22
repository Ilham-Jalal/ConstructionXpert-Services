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
        String resourceIdParam = req.getParameter("resourceId");

        if (resourceIdParam != null && !resourceIdParam.isEmpty()) {
            try {
                int resourceId = Integer.parseInt(resourceIdParam);
                Resource resource = resourceDAO.getResourceById(resourceId);
                req.setAttribute("resource", resource);
                req.getRequestDispatcher("/WEB-INF/UpdateResource.jsp").forward(req, resp);
            } catch (NumberFormatException e) {
                LOGGER.log(Level.SEVERE, "Invalid resourceId format: {0}", resourceIdParam);
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid resourceId format.");
            } catch (SQLException e) {
                throw new RuntimeException("Error retrieving resource", e);
            }
        } else {
            LOGGER.log(Level.SEVERE, "Missing or empty resourceId parameter");
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or empty resourceId parameter.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            int idR = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String type = req.getParameter("type");
            String quantityParam = req.getParameter("quantity");
            String supplierInfo = req.getParameter("supplierInfo");
            String taskId = req.getParameter("taskId");

            if (quantityParam != null && !quantityParam.isEmpty()) {
                int quantity = Integer.parseInt(quantityParam);

                Resource resource = new Resource();
                resource.setId(idR);
                resource.setName(name);
                resource.setType(type);
                resource.setQuantity(quantity);
                resource.setSupplierInfo(supplierInfo);


                try {
                    resourceDAO.updateResource(resource);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                resp.sendRedirect(req.getContextPath() + "/listResources?taskId=" + taskId);

            }}
        }

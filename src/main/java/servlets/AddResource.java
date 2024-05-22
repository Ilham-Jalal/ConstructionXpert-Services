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

@WebServlet("/addResource")
public class AddResource extends HttpServlet {
    private ResourceDAO resourceDAO;
    private static final Logger LOGGER = Logger.getLogger(AddResource.class.getName());

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
        req.getRequestDispatcher("/WEB-INF/AddResource.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String type = req.getParameter("type");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String supplierInfo = req.getParameter("supplierInfo");

        Resource resource = new Resource();
        resource.setName(name);
        resource.setType(type);
        resource.setQuantity(quantity);
        resource.setSupplierInfo(supplierInfo);

        try {
            resourceDAO.addResource(resource);
            resp.sendRedirect("listResources");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding resource", e);
            throw new ServletException("Error adding resource", e);
        }
    }
}

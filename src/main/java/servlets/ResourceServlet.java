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

@WebServlet("/resources")
public class ResourceServlet extends HttpServlet {
    private ResourceDAO resourceDAO;

    @Override
    public void init() throws ServletException {
        try {
            resourceDAO = new ResourceDAOImpl();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Resource> resources = resourceDAO.getAllResources();
            req.setAttribute("resources", resources);
            req.getRequestDispatcher("/resources.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    // Implement doPost, doPut, doDelete for add, update, delete operations
}

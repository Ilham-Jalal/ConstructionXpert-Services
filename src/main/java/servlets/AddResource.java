package servlets;

import classes.Resource;
import classes.Task;
import dao.ResourceDAO;
import dao.ResourceDAOImpl;
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

@WebServlet("/addResource")
public class AddResource extends HttpServlet {
    private ResourceDAO resourceDAO;
    private TaskDAO taskDAO;
    private static final Logger LOGGER = Logger.getLogger(AddResource.class.getName());

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            resourceDAO = new ResourceDAOImpl();
            taskDAO = new TaskDAOImpl();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Error initializing DAOs", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Here you can forward the request to a JSP for adding a resource if needed
        req.getRequestDispatcher("/WEB-INF/AddResource.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String type = req.getParameter("type");
            String quantityParam = req.getParameter("quantity");
            String supplierInfo = req.getParameter("supplierInfo");
            String taskIdParam = req.getParameter("taskId");

            if (name != null && !name.isEmpty() &&
                    type != null && !type.isEmpty() &&
                    quantityParam != null && !quantityParam.isEmpty() &&
                    taskIdParam != null && !taskIdParam.isEmpty()) {

                int quantity = Integer.parseInt(quantityParam);
                int taskId = Integer.parseInt(taskIdParam);

                Resource resource = new Resource();
                resource.setName(name);
                resource.setType(type);
                resource.setQuantity(quantity);
                resource.setSupplierInfo(supplierInfo);


                    Task task = taskDAO.getTaskById(taskId);
                    if (task == null) {
                        resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Task not found");
                        return;
                    }
                    resource.setTask(task);
                    resourceDAO.addResource(resource);
                    resp.sendRedirect(req.getContextPath() + "/listResources?taskId=" + taskId);

            } else {
                LOGGER.log(Level.SEVERE, "Missing or empty required parameters");
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or empty required parameters.");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid input format", e);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format.");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

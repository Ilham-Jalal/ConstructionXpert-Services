
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

@WebServlet("/updateResource")
public class UpdateResource extends HttpServlet {
    private ResourceDAO resourceDAO;
    private TaskDAO taskDAO;
    private static final Logger LOGGER = Logger.getLogger(UpdateResource.class.getName());

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
        try {
            String idParam = req.getParameter("id");
            String name = req.getParameter("name");
            String type = req.getParameter("type");
            String quantityParam = req.getParameter("quantity");
            String supplierInfo = req.getParameter("supplierInfo");
            String taskIdParam = req.getParameter("taskId");

            // Log the parameters to help with debugging
            LOGGER.log(Level.INFO, "Received parameters: id={0}, name={1}, type={2}, quantity={3}, supplierInfo={4}, taskId={5}",
                    new Object[]{idParam, name, type, quantityParam, supplierInfo, taskIdParam});

            if (idParam != null && !idParam.isEmpty() &&
                    name != null && !name.isEmpty() &&
                    type != null && !type.isEmpty() &&
                    quantityParam != null && !quantityParam.isEmpty() &&
                    taskIdParam != null && !taskIdParam.isEmpty()) {

                int idR = Integer.parseInt(idParam);
                int quantity = Integer.parseInt(quantityParam);
                int taskId = Integer.parseInt(taskIdParam);

                Resource resource = new Resource();
                resource.setId(idR);
                resource.setName(name);
                resource.setType(type);
                resource.setQuantity(quantity);
                resource.setSupplierInfo(supplierInfo);

                try {
                    Task task = taskDAO.getTaskById(taskId);
                    if (task == null) {
                        resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Task not found");
                        return;
                    }
                    resource.setTask(task);
                    resourceDAO.updateResource(resource);
                    resp.sendRedirect(req.getContextPath() + "/listResources?taskId=" + taskId);
                } catch (SQLException e) {
                    throw new RuntimeException("Error updating resource", e);
                }
            } else {
                LOGGER.log(Level.SEVERE, "Missing or empty required parameters");
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or empty required parameters.");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid input format", e);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format.");
        }
    }
}

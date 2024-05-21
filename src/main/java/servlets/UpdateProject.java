package servlets;

import classes.Project;
import dao.ProjectDAO;
import dao.ProjectDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/updateProject")
public class UpdateProject extends HttpServlet {
    private ProjectDAO projectDAO;

    @Override
    public void init() throws ServletException {
        try {
            projectDAO = new ProjectDAOImpl();
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                Project project = projectDAO.getProjectById(id);
                if (project != null) {
                    req.setAttribute("project", project);
                    req.getRequestDispatcher("/WEB-INF/updateProject.jsp").forward(req, resp);
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Project not found");
                }
            } catch (NumberFormatException | SQLException e) {
                throw new ServletException(e);
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing project ID");
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String startDateStr = req.getParameter("start_Date");
        String endDateStr = req.getParameter("end_Date");
        String budgetStr = req.getParameter("budget");

        try {
            int id = Integer.parseInt(idStr);
            Project project = projectDAO.getProjectById(id);
            if (project != null) {
                // Mettre à jour les attributs du projet
                project.setName(name);
                project.setDescription(description);
                project.setStartDate(Date.valueOf(startDateStr));
                project.setEndDate(Date.valueOf(endDateStr));
                project.setBudget(Double.parseDouble(budgetStr));

                projectDAO.updateProject(project);
                resp.sendRedirect(req.getContextPath() + "/projects");
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Project not found");
            }
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException(e);
        }
    }
}

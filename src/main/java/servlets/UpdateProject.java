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


            projectDAO = new ProjectDAOImpl();


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Project project = null;
            try {
                project = projectDAO.getProjectById(id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            if (project != null) {
                req.setAttribute("project", project);
                req.getRequestDispatcher("/WEB-INF/updateProject.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        double budget = Double.parseDouble(request.getParameter("budget"));

        Project project = new Project(id, name, description, startDate, endDate, budget);

        try {
            projectDAO.updateProject(project);
            response.sendRedirect(request.getContextPath() + "/Projects/listProjects");
        } catch (SQLException e) {
            throw new ServletException("Error updating project", e);
        }
    }
}
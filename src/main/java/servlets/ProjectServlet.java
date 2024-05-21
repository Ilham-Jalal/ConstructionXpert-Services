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
import java.sql.SQLException;
import java.util.List;

@WebServlet("/projects")
public class ProjectServlet extends HttpServlet {
    private ProjectDAO projectDAO;

    @Override
    public void init() throws ServletException {
            projectDAO = new ProjectDAOImpl();


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Project> projects = projectDAO.getAllProjects();
            req.setAttribute("projects", projects);
            req.getRequestDispatcher("/WEB-INF/Projects.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    // Implement doPost, doPut, doDelete for add, update, delete operations
}

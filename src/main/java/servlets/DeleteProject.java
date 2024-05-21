package servlets;

import dao.ProjectDAO;
import dao.ProjectDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteProject")
public class DeleteProject extends HttpServlet {
    private ProjectDAO projectDAO;

    @Override
    public void init() throws ServletException {

            projectDAO = new ProjectDAOImpl();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");

        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                projectDAO.deleteProject(id);
                resp.sendRedirect(req.getContextPath() + "/projects");
            } catch (NumberFormatException | SQLException e) {
                throw new ServletException(e);
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing project ID");
        }
    }
}

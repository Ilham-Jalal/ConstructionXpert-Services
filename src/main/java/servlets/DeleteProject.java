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
import java.sql.SQLIntegrityConstraintViolationException;

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
            int id = Integer.parseInt(idStr);
            try {
                projectDAO.deleteProject(id);
                resp.sendRedirect(req.getContextPath() + "/project");
            } catch (SQLException e) {
                if (e instanceof SQLIntegrityConstraintViolationException) {
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cannot delete project due to related data.");
                } else {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}

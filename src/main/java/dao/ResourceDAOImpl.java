package dao;

import classes.Resource;
import classes.Task;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
public class ResourceDAOImpl implements ResourceDAO {
    private Connection connection;
    TaskDAO taskDAO = new TaskDAOImpl();
    private static final Logger LOGGER = Logger.getLogger(ResourceDAOImpl.class.getName());
    public ResourceDAOImpl() throws SQLException, ClassNotFoundException {
        connection = DBConnection.getConnection();
    }
    @Override
    public void addResource(Resource resource) throws SQLException {
        String query = "INSERT INTO resources (name, type, quantity, supplier_info, task_id) VALUES (?, ?, ?, ?,?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, resource.getName());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getSupplierInfo());
            stmt.setInt(5,resource.getTask().getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding resource", e);
            throw e;
        }
    }
    @Override
    public List<Resource> getAllResources() throws SQLException {
        List<Resource> resources = new ArrayList<>();
        String query = "SELECT * FROM resources";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Resource resource = new Resource();
                Task task = taskDAO.getTaskById(rs.getInt("task_id"));
                resource.setTask(task);
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInfo(rs.getString("supplier_info"));
                resources.add(resource);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving all resources", e);
            throw e;
        }
        return resources;
    }
    @Override
    public void updateResource(Resource resource) throws SQLException {
        String query = "UPDATE resources SET name = ?, type = ?, quantity = ?, supplier_info = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, resource.getName());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getSupplierInfo());
            stmt.setInt(5, resource.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating resource", e);
            throw e;
        }
    }
    @Override
    public void deleteResource(int resourceId) throws SQLException {
        String query = "DELETE FROM resources WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, resourceId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting resource", e);
            throw e;
        }}

        @Override
        public List<Resource> getResourcesByTaskId(int taskId) throws SQLException {
            List<Resource> taskResources = new ArrayList<>();
            String query = "SELECT * FROM resources WHERE task_id = ?";
            try (PreparedStatement stmt = connection.prepareStatement(query)) {
                stmt.setInt(1, taskId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Resource resource = new Resource();
                        resource.setId(rs.getInt("id"));
                        resource.setName(rs.getString("name"));
                        resource.setType(rs.getString("type"));
                        resource.setQuantity(rs.getInt("quantity"));
                        resource.setSupplierInfo(rs.getString("supplier_info"));
                        taskResources.add(resource);
                    }
                }
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error retrieving resources by task ID", e);
                throw e;
            }
            return taskResources;
        }
        @Override
        public Resource getResourceById(int resourceId) throws SQLException {
            String query = "SELECT * FROM resources WHERE id = ?";
            try (PreparedStatement stmt = connection.prepareStatement(query)) {
                stmt.setInt(1, resourceId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        Resource resource = new Resource();
                        resource.setId(rs.getInt("id"));
                        Task task = taskDAO.getTaskById(rs.getInt("task_id"));
                        resource.setTask(task);
                        resource.setName(rs.getString("name"));
                        resource.setType(rs.getString("type"));
                        resource.setQuantity(rs.getInt("quantity"));
                        resource.setSupplierInfo(rs.getString("supplier_info"));
                        return resource;
                    } else {
                        throw new SQLException("Resource not found for id: " + resourceId);
                    }
                }
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error retrieving resource by id", e);
                throw e;
            }
        }

    }
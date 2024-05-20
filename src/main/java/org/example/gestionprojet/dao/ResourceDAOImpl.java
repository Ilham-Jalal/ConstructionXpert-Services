package org.example.gestionprojet.dao;

import com.example.gestionprojets.util.DBConnection;
import org.example.gestionprojet.classes.Resource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAOImpl implements ResourceDAO {
    private Connection connection;

    public ResourceDAOImpl() throws SQLException, ClassNotFoundException {
        connection = DBConnection.getConnection();
    }

    @Override
    public void addResource(Resource resource) throws SQLException {
        String query = "INSERT INTO resources (name, type, quantity, supplier_info) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, resource.getName());
            stmt.setString(2, resource.getType());
            stmt.setInt(3, resource.getQuantity());
            stmt.setString(4, resource.getSupplierInfo());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();

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
                resource.setId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setQuantity(rs.getInt("quantity"));
                resource.setSupplierInfo(rs.getString("supplier_info"));
                resources.add(resource);
            }
        } catch (SQLException e) {
            e.printStackTrace();

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
            e.printStackTrace();
        }
    }

    @Override
    public void deleteResource(int resourceId) throws SQLException {
        String query = "DELETE FROM resources WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, resourceId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
}

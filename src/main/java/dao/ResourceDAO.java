package dao;

import classes.Resource;

import java.sql.SQLException;
import java.util.List;

public interface ResourceDAO {
    void addResource(Resource resource) throws SQLException;
    List<Resource> getAllResources() throws SQLException;
    Resource getResourceById(int id) throws SQLException;
    void updateResource(Resource resource) throws SQLException;
    void deleteResource(int resourceId) throws SQLException;
    List<Resource> getResourcesByTaskId(int taskId) throws SQLException;
}

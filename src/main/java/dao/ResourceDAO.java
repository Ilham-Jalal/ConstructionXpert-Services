package dao;

import classes.Resource;

import java.sql.SQLException;
import java.util.List;

public interface ResourceDAO {
    void addResource(Resource resource) throws SQLException;
    List<Resource> getAllResources() throws SQLException;
    void updateResource(Resource resource) throws SQLException;
    void deleteResource(int resourceId) throws SQLException;
}

package classes;

public class Resource {
    private int id;
    private Task task;
    private String name;
    private String type;
    private int quantity;
    private String supplierInfo;
    private String picture;

    public Resource() {
    }

    public Resource(int id, String name, String type, int quantity, String supplierInfo,String picture) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.quantity = quantity;
        this.supplierInfo = supplierInfo;
        this.picture=picture;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Task getTask() { // Ajout du getter pour task
        return task;
    }

    public void setTask(Task task) { // Ajout du setter pour task
        this.task = task;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSupplierInfo() {
        return supplierInfo;
    }

    public void setSupplierInfo(String supplierInfo) {
        this.supplierInfo = supplierInfo;
    }
}

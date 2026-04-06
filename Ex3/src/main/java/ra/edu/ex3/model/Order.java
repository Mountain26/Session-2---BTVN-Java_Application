package ra.edu.ex3.model;

import java.util.Date;

public class Order {
    private String id;
    private String productName;
    private double totalPrice;
    private Date orderDate;

    public Order() {
    }

    public Order(String id, String productName, double totalPrice, Date orderDate) {
        this.id = id;
        this.productName = productName;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }
}
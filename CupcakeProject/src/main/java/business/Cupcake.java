package business;

public class Cupcake {
    
    private String id;
    private Topping topping;
    private Bottom bottom;
    private double price;
    private int quantity;
    
    public Cupcake(Topping topping, Bottom bottom) {
        this.id = "" + topping.getId() + bottom.getId();
        this.topping = topping;
        this.bottom = bottom;
        this.price = topping.getPrice() + bottom.getPrice();
        this.quantity = 1;
    }

    public String getId() {
        return id;
    }
    
    public Topping getTopping() {
        return topping;
    }

    public void setTopping(Topping topping) {
        this.topping = topping;
    }

    public Bottom getBottom() {
        return bottom;
    }

    public void setBottom(Bottom bottom) {
        this.bottom = bottom;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    
}

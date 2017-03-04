package business;

import java.util.HashMap;

/**
 *
 * @author mathiasjepsen
 */
public class Cart {
    
    private HashMap<Integer, Cupcake> cart;
    private int row;

    public Cart() {
        this.row = 1;
        this.cart = new HashMap<>();
    }    
    
    public void addCupcake(Cupcake cupcake) {
        cart.put(row, cupcake);
        row++;
    }
    
    public HashMap<Integer, Cupcake> getCart() {
        return cart;
    }

    public void setCart(HashMap<Integer, Cupcake> cart) {
        this.cart = cart;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }
    
    
}

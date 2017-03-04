package business;

import data.DataMapper;
import java.sql.SQLException;

public class CupcakeFacade {
    
    public static String[] getToppings() {
        String[] toppings = {"Chocolate", "Blueberry", "Rasberry", "Crispy", "Strawberry", "Rum/Raisin", "Orange", "Lemon", "Blue cheese"};
        return toppings;
    }
    
    public static String[] getBottoms() {
        String[] bottoms = {"Chocolate", "Vanilla", "Nutmeg", "Pistacio", "Almond"};
        return bottoms;
    }
    
    public static Cupcake getCupcake(String topping, String bottom) throws SQLException, NullPointerException {
        DataMapper dm = new DataMapper();
        return dm.getCupcake(topping, bottom);
    }
    
}

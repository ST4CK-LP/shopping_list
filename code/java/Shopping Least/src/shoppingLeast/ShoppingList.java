package shoppingLeast;

import java.util.ArrayList;

public class ShoppingList {
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public ListCategory getCategory() {
        return category;
    }

    public void setCategory(ListCategory category) {
        this.category = category;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void addProducts(Product product) {
        products.add(product);
    }

    private String name;
    private String description;
    private Photo photo;
    private ListCategory category;
    private ArrayList<Product> products = new ArrayList<Product>();

    ShoppingList(String name, String description, Photo photo, ListCategory category){
        this.name = name;
        this.description = description;
        this.photo = photo;
        this.category = category;
    }
}

package shoppingLeast;

public class Product {
    /*
        Prodotto composto da almeno:
        · Nome
        · Note
        · Logo ???
        · Fotografia (Le foto devono essere caricabili)
        · Categoria
     */

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Photo getLogo() {
        return logo;
    }

    public void setLogo(Photo logo) {
        this.logo = logo;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public ProductCategory getCategory() {
        return category;
    }

    public void setCategory(ProductCategory category) {
        this.category = category;
    }

    private String name;
    private String note;
    private Photo logo; // E' il logo della categoria??
    private Photo photo;
    private ProductCategory category;

    Product(String name, String note, Photo photo, ProductCategory category){
        this.name = name;
        this.note = note;
        this.photo = photo;
        this.category = category;
        this.logo = category.getLogo();
    }

}

package shoppingLeast;

public class ProductCategory {
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

    public Photo getLogo() {
        return logo;
    }

    public void setLogo(Photo logo) {
        this.logo = logo;
    }

    private String name;
    private String description;
    private Photo logo;

    ProductCategory(String name, String description, Photo logo){
        this.name = name;
        this.description = description;
        this.logo = logo;
    }


}

package shoppingLeast;

public class ListCategory {
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

    private String name;
    private String description;
    private Photo photo;

    ListCategory(String name, String description, Photo photo){
        this.name = name;
        this.description = description;
        this.photo = photo;
    }
}

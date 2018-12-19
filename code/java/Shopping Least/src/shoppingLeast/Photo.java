package shoppingLeast;

public class Photo {
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    private String url; //la Path dove è salvata l'immagine

    Photo(String url){
        this.url = url;
    }
}

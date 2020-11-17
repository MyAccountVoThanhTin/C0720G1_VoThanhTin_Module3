package models;

public class Books {
    private int id;
    private String title;
    private String content;
    private int idBookType;

    public Books() {
    }

    public Books(String title, String content, int idBookType) {
        this.title = title;
        this.content = content;
        this.idBookType = idBookType;
    }

    public Books(int id, String title, String content, int idBookType) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.idBookType = idBookType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getIdBookType() {
        return idBookType;
    }

    public void setIdBookType(int idBookType) {
        this.idBookType = idBookType;
    }
}

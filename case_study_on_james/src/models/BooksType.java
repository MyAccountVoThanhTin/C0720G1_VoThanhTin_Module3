package models;

public class BooksType {
    private int id;
    private String name;
    private String descripton;

    public BooksType() {
    }

    public BooksType(String name, String descripton) {
        this.name = name;
        this.descripton = descripton;
    }

    public BooksType(int id, String name, String descripton) {
        this.id = id;
        this.name = name;
        this.descripton = descripton;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescripton() {
        return descripton;
    }

    public void setDescripton(String descripton) {
        this.descripton = descripton;
    }
}

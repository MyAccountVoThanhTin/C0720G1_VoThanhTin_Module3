package models;

public class Customer {
    private String name, birthday,addeess,image;

    public Customer() {
    }

    public Customer(String name, String birthday, String addeess, String image) {
        this.name = name;
        this.birthday = birthday;
        this.addeess = addeess;
        this.image = image;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddeess() {
        return addeess;
    }

    public void setAddeess(String addeess) {
        this.addeess = addeess;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}

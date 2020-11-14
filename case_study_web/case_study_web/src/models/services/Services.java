package models.services;

public class Services {
    protected int id;
    protected String name;
    protected int area;
    protected double cost;
    protected int maxPeople;

    public Services() {
    }

    public Services(String name, int area, double cost, int maxPeople) {
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.maxPeople = maxPeople;
    }

    public Services(int id, String name, int area, double cost, int maxPeople) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.maxPeople = maxPeople;
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

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }
}

package models.services;

public class Villa extends VillaHouse {
    private int area;

    public Villa() {
    }

    public Villa(String standardRoom, String deriptionOrtherConvenience, int numbersFloor) {
        super(standardRoom, deriptionOrtherConvenience, numbersFloor);
    }

    public Villa(String standardRoom, String deriptionOrtherConvenience, int numbersFloor, int area) {
        super(standardRoom, deriptionOrtherConvenience, numbersFloor);
        this.area = area;
    }

    public Villa(String name, int area, double cost, int maxPeople, String standardRoom, String deriptionOrtherConvenience, int numbersFloor, int area1) {
        super(name, area, cost, maxPeople, standardRoom, deriptionOrtherConvenience, numbersFloor);
        this.area = area1;
    }

    public Villa(int id, String name, int area, double cost, int maxPeople, String standardRoom, String deriptionOrtherConvenience, int numbersFloor, int area1) {
        super(id, name, area, cost, maxPeople, standardRoom, deriptionOrtherConvenience, numbersFloor);
        this.area = area1;
    }

    @Override
    public int getArea() {
        return area;
    }

    @Override
    public void setArea(int area) {
        this.area = area;
    }
}

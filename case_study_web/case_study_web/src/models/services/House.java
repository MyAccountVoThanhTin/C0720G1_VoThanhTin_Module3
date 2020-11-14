package models.services;

public class House extends  VillaHouse{
    public House() {
    }

    public House(String standardRoom, String deriptionOrtherConvenience, int numbersFloor) {
        super(standardRoom, deriptionOrtherConvenience, numbersFloor);
    }

    public House(String name, int area, double cost, int maxPeople, String standardRoom, String deriptionOrtherConvenience, int numbersFloor) {
        super(name, area, cost, maxPeople, standardRoom, deriptionOrtherConvenience, numbersFloor);
    }

    public House(int id, String name, int area, double cost, int maxPeople, String standardRoom, String deriptionOrtherConvenience, int numbersFloor) {
        super(id, name, area, cost, maxPeople, standardRoom, deriptionOrtherConvenience, numbersFloor);
    }
}

package models.services;

public class VillaHouse extends Services {
    protected String standardRoom;
    protected String deriptionOrtherConvenience;
    protected int numbersFloor;

    public VillaHouse() {
    }

    public VillaHouse(String standardRoom, String deriptionOrtherConvenience, int numbersFloor) {
        this.standardRoom = standardRoom;
        this.deriptionOrtherConvenience = deriptionOrtherConvenience;
        this.numbersFloor = numbersFloor;
    }

    public VillaHouse(String name, int area, double cost, int maxPeople, String standardRoom, String deriptionOrtherConvenience, int numbersFloor) {
        super(name, area, cost, maxPeople);
        this.standardRoom = standardRoom;
        this.deriptionOrtherConvenience = deriptionOrtherConvenience;
        this.numbersFloor = numbersFloor;
    }

    public VillaHouse(int id, String name, int area, double cost, int maxPeople, String standardRoom, String deriptionOrtherConvenience, int numbersFloor) {
        super(id, name, area, cost, maxPeople);
        this.standardRoom = standardRoom;
        this.deriptionOrtherConvenience = deriptionOrtherConvenience;
        this.numbersFloor = numbersFloor;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDeriptionOrtherConvenience() {
        return deriptionOrtherConvenience;
    }

    public void setDeriptionOrtherConvenience(String deriptionOrtherConvenience) {
        this.deriptionOrtherConvenience = deriptionOrtherConvenience;
    }

    public int getNumbersFloor() {
        return numbersFloor;
    }

    public void setNumbersFloor(int numbersFloor) {
        this.numbersFloor = numbersFloor;
    }
}

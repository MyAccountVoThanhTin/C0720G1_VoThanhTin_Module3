package models.services;

public class Room  extends Services{
    AttachServices attachServices;

    public Room() {
    }

    public Room(AttachServices attachServices) {
        this.attachServices = attachServices;
    }

    public Room(String name, int area, double cost, int maxPeople, AttachServices attachServices) {
        super(name, area, cost, maxPeople);
        this.attachServices = attachServices;
    }

    public Room(int id, String name, int area, double cost, int maxPeople, AttachServices attachServices) {
        super(id, name, area, cost, maxPeople);
        this.attachServices = attachServices;
    }

    public AttachServices getAttachServices() {
        return attachServices;
    }

    public void setAttachServices(AttachServices attachServices) {
        this.attachServices = attachServices;
    }
}

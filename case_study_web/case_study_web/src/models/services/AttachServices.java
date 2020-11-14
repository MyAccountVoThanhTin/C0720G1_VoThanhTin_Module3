package models.services;

public class AttachServices {
    private int attachServicesId;
    private String attachServiceName;
    private int attachServiceUnit;
    private double attachServicCost;
    private String statusAttachServices;

    public AttachServices() {
    }

    public AttachServices(String attachServiceName, int attachServiceUnit, double attachServicCost, String statusAttachServices) {
        this.attachServiceName = attachServiceName;
        this.attachServiceUnit = attachServiceUnit;
        this.attachServicCost = attachServicCost;
        this.statusAttachServices = statusAttachServices;
    }

    public AttachServices(int attachServicesId, String attachServiceName, int attachServiceUnit, double attachServicCost, String statusAttachServices) {
        this.attachServicesId = attachServicesId;
        this.attachServiceName = attachServiceName;
        this.attachServiceUnit = attachServiceUnit;
        this.attachServicCost = attachServicCost;
        this.statusAttachServices = statusAttachServices;
    }

    public int getAttachServicesId() {
        return attachServicesId;
    }

    public void setAttachServicesId(int attachServicesId) {
        this.attachServicesId = attachServicesId;
    }

    public String getAttachServiceName() {
        return attachServiceName;
    }

    public void setAttachServiceName(String attachServiceName) {
        this.attachServiceName = attachServiceName;
    }

    public int getAttachServiceUnit() {
        return attachServiceUnit;
    }

    public void setAttachServiceUnit(int attachServiceUnit) {
        this.attachServiceUnit = attachServiceUnit;
    }

    public double getAttachServicCost() {
        return attachServicCost;
    }

    public void setAttachServicCost(double attachServicCost) {
        this.attachServicCost = attachServicCost;
    }

    public String getStatusAttachServices() {
        return statusAttachServices;
    }

    public void setStatusAttachServices(String statusAttachServices) {
        this.statusAttachServices = statusAttachServices;
    }
}

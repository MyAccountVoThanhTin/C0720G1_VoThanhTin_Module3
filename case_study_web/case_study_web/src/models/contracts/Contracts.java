package models.contracts;

public class Contracts {
    private int contractId;
    private String contractStartDate;
    private String contractEndDate;
    private double contractDeposit;
    private String employeeName;
    private String nameCustomer;
    private String nameService;

    public Contracts() {
    }

    public Contracts(String contractStartDate, String contractEndDate, double contractDeposit, String employeeName, String nameCustomer, String nameService) {
        this.contractStartDate = contractStartDate;
        this.contractEndDate = contractEndDate;
        this.contractDeposit = contractDeposit;
        this.employeeName = employeeName;
        this.nameCustomer = nameCustomer;
        this.nameService = nameService;
    }

    public Contracts(int contractId, String contractStartDate, String contractEndDate, double contractDeposit, String employeeName, String nameCustomer, String nameService) {
        this.contractId = contractId;
        this.contractStartDate = contractStartDate;
        this.contractEndDate = contractEndDate;
        this.contractDeposit = contractDeposit;
        this.employeeName = employeeName;
        this.nameCustomer = nameCustomer;
        this.nameService = nameService;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public String getContractStartDate() {
        return contractStartDate;
    }

    public void setContractStartDate(String contractStartDate) {
        this.contractStartDate = contractStartDate;
    }

    public String getContractEndDate() {
        return contractEndDate;
    }

    public void setContractEndDate(String contractEndDate) {
        this.contractEndDate = contractEndDate;
    }

    public double getContractDeposit() {
        return contractDeposit;
    }

    public void setContractDeposit(double contractDeposit) {
        this.contractDeposit = contractDeposit;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public String getNameService() {
        return nameService;
    }

    public void setNameService(String nameService) {
        this.nameService = nameService;
    }
}

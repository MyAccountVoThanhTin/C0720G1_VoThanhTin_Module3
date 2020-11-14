package models.customer_employee;

public class EducationDegree {
    private int idEducatonDegree;
    private String nameEducationDegree;

    public EducationDegree() {
    }

    public EducationDegree(int idEducatonDegree, String nameEducationDegree) {
        this.idEducatonDegree = idEducatonDegree;
        this.nameEducationDegree = nameEducationDegree;
    }

    public int getIdEducatonDegree() {
        return idEducatonDegree;
    }

    public void setIdEducatonDegree(int idEducatonDegree) {
        this.idEducatonDegree = idEducatonDegree;
    }

    public String getNameEducationDegree() {
        return nameEducationDegree;
    }

    public void setNameEducationDegree(String nameEducationDegree) {
        this.nameEducationDegree = nameEducationDegree;
    }
}

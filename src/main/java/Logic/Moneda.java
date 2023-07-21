
package Logic;


public class Moneda {
    private int id;
    private String name;
    private double value;
    private int commission;

    public Moneda(int id, String name, double value, int commission) {
        this.id = id;
        this.name = name;
        this.value = value;
        this.commission = commission;
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

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public int getCommission() {
        return commission;
    }

    public void setCommission(int commission) {
        this.commission = commission;
    }
    
    
}

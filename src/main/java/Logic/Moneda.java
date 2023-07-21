
package Logic;


public class Moneda {
    private int id;
    private String name;
    private double valor_dolar_moneda;
    private double valor_moneda_dolar;
    private int commission;

    public Moneda(int id, String name, double valor_dolar_moneda, double valor_moneda_dolar, int commission) {
        this.id = id;
        this.name = name;
        this.valor_dolar_moneda = valor_dolar_moneda;
        this.valor_moneda_dolar = valor_moneda_dolar;
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

    public double getValor_dolar_moneda() {
        return valor_dolar_moneda;
    }

    public void setValor_dolar_moneda(double valor_dolar_moneda) {
        this.valor_dolar_moneda = valor_dolar_moneda;
    }

    public double getValor_moneda_dolar() {
        return valor_moneda_dolar;
    }

    public void setValor_moneda_dolar(double valor_moneda_dolar) {
        this.valor_moneda_dolar = valor_moneda_dolar;
    }

    public int getCommission() {
        return commission;
    }

    public void setCommission(int commission) {
        this.commission = commission;
    }

   
    
    
}

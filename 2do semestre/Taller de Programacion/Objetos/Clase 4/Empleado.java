package clase4;

public abstract class Empleado {
	private String nombre;
	private int sueldo;
	private int antiguedad;

	public Empleado(String nombre, int sueldo, int antiguedad) {
		this.nombre = nombre;
		this.sueldo = sueldo;
		this.antiguedad = antiguedad;
	}
	
	public abstract double calcularEfectividad();
	public double calcularSueldoACobrar() {
		double adicional = sueldo * 0.1 * antiguedad;
		return sueldo + adicional;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getSueldo() {
		return sueldo;
	}

	public void setSueldo(int sueldo) {
		this.sueldo = sueldo;
	}

	public int getAntiguedad() {
		return antiguedad;
	}

	public void setAntiguedad(int antiguedad) {
		this.antiguedad = antiguedad;
	}	
	
	public String toString() {
		return this.getNombre() + " " + this.getSueldo() + " " + this.calcularEfectividad();
	}
}

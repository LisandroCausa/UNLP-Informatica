package clase4;

public class Jugador extends Empleado{
	private int partidosJugados;
	private int golesAnotados;

	public Jugador(int partidosJugados, int golesAnotados, String nombre, int sueldo, int antiguedad) {
		super(nombre, sueldo, antiguedad);
		this.partidosJugados = partidosJugados;
		this.golesAnotados = golesAnotados;
	}
	
	public double calcularEfectividad() {
		if(partidosJugados <= 0)
			return -1;
		return (double)golesAnotados / partidosJugados;
	}

	public double calcularSueldoACobrar() {
		double sueldo = super.calcularSueldoACobrar();
		if(this.calcularEfectividad() > 0.5)
			sueldo += this.getSueldo();
		return sueldo;
	}
}

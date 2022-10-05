package clase4;

public class Entrenador extends Empleado {
	private int campeonatosGanados;

	public Entrenador(int campeonatosGanados, String nombre, int sueldo, int antiguedad) {
		super(nombre, sueldo, antiguedad);
		this.campeonatosGanados = campeonatosGanados;
	}
	
	public double calcularEfectividad() {
		if(this.getAntiguedad() <= 0)
			return -1;
		return (double)campeonatosGanados / this.getAntiguedad();
	}
	
	public double calcularSueldoACobrar() {
		double sueldo = super.calcularSueldoACobrar();
		if(1 <= campeonatosGanados && campeonatosGanados <= 4)
		{
			sueldo += 5000;
		}
		else if(5 <= campeonatosGanados && campeonatosGanados <= 10)
		{
			sueldo += 30000;
		}
		else if(campeonatosGanados > 10)
		{
			sueldo += 50000;
		}
		return sueldo;
	}
}

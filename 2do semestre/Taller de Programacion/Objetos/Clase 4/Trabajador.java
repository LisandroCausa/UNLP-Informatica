package clase4;

public class Trabajador extends Persona {
	private String trabajo;

	public Trabajador(String trabajo) {
		this.trabajo = trabajo;
	}

	public String getTrabajo() {
		return trabajo;
	}

	public void setTrabajo(String trabajo) {
		this.trabajo = trabajo;
	}
	
	public String toString() {
		return super.toString() + ". Soy " + this.getTrabajo() + ".";
	}
}

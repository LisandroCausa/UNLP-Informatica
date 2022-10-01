package clase3;

public class Autor {
	private String nombre;
	private String biografia;
	private String origen;
	
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getBiografia() {
		return biografia;
	}

	public void setBiografia(String biografia) {
		this.biografia = biografia;
	}

	public String getOrigen() {
		return origen;
	}

	public void setOrigen(String origen) {
		this.origen = origen;
	}
	
	public String toString() {
		return this.nombre + " " + this.biografia + " " + this.origen;
	}
}

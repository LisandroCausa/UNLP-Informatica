package ar.edu.unlp.info.oo1.ejercicio15;

public class Propiedad {
	private String nombre;
	private String descripcion;
	private int precioNoche;
	private String direccion;
	private Usuario propietario;
	
	public Propiedad(String nombre, String descripcion, int precioNoche, String direccion, Usuario propietario) {
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precioNoche = precioNoche;
		this.direccion = direccion;
		this.propietario = propietario;
	}
	
	//public estaDisponibleEn(fechaInicio, fechaFin)
	
	//public void reservar(Propiedad propiedad, periodo, Usuario inquilino)
}

package ar.edu.unlp.info.oo1.ejercicio15;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

public class Usuario {
	private String nombre;
	private String direccion;
	private int dni;
	private List<Propiedad> propiedades;
	private List<Reserva> historialReservas;
	
	public Usuario(String nombre, String direccion, int dni) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.dni = dni;
		this.propiedades = new ArrayList<Propiedad>();
		this.historialReservas = new ArrayList<Reserva>();
	}
	
	public void agregarPropiedad(Propiedad propiedad) {
		this.propiedades.add(propiedad);
	}
	
	public void agregarReserva(Reserva reserva) {
		this.historialReservas.add(reserva);
	}
	
	public List<Propiedad> buscarPropiedadesDisponibles(LocalDate inicio, LocalDate fin) {
		return this.propiedades.stream()
				.filter(propiedad -> propiedad.estaDisponibleEn(inicio, fin))
				.collect(Collectors.toList());
	}

	public Propiedad buscarPropiedad(Reserva reserva) {
		return this.propiedades.stream()
				.filter(propiedad -> propiedad.contieneReserva(reserva))
				.findFirst().orElse(null);
	}
	
	public List<Reserva> obtenerReservas() {
		return this.historialReservas;
	}
	
	public List<Reserva> obtenerReservasPropiedades(LocalDate inicio, LocalDate fin) {
		List<Reserva> reservas = new ArrayList<Reserva>();
		for (Propiedad propiedad : this.propiedades) {
			reservas.addAll(propiedad.obtenerReservas(inicio, fin));
		}
		return reservas;
	}
}

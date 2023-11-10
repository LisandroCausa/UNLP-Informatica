package ar.edu.unlp.info.oo1.ejercicio15;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

public class Propiedad {
	private String nombre;
	private String descripcion;
	private int precioNoche;
	private String direccion;
	private List<Reserva> reservas;
	
	public Propiedad(String nombre, String descripcion, int precioNoche, String direccion) {
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precioNoche = precioNoche;
		this.direccion = direccion;
		this.reservas = new ArrayList<Reserva>();
	}
	
	public boolean estaDisponibleEn(LocalDate fechaInicio, LocalDate fechaFin) {
		DateLapse periodo = new DateLapse(fechaInicio, fechaFin);
		return this.reservas.stream()
				.noneMatch(reserva -> reserva.overlaps(periodo));
	}
	
	public void agregarReserva(Reserva reserva) {
		this.reservas.add(reserva);
	}
	
	public boolean contieneReserva(Reserva reserva) {
		Reserva encontro = this.reservas.stream()
							.filter(res -> res.equals(reserva))
							.findAny().orElse(null);
		return encontro != null;
	}
	
	public int getPrecioNoche() {
		return this.precioNoche;
	}
	
	public void eliminarReserva(Reserva reserva) {
		this.reservas.remove(reserva);
	}
	
	public List<Reserva> obtenerReservas(LocalDate inicio, LocalDate fin) {
		return this.reservas.stream()
				.filter(reserva -> reserva.estaEnPeriodo(inicio, fin))
				.collect(Collectors.toList());
	}
}

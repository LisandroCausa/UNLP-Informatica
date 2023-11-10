package ar.edu.unlp.info.oo1.ejercicio15;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.*;

public class Sistema {
	private List<Usuario> usuarios;
	
	public Usuario registrarUsuario(String nombre, String direccion, int dni) {
		Usuario usuario = new Usuario(nombre, direccion, dni);
		this.usuarios.add(usuario);
		return usuario;
	}
	
	public Propiedad registrarPropiedad(String nombre, String descripcion, int precioNoche, String direccion, Usuario propietario) {
		Propiedad propiedad = new Propiedad(nombre, descripcion, precioNoche, direccion);
		propietario.agregarPropiedad(propiedad);
		return propiedad;
	}
	
	public List<Propiedad> buscarPropiedadesDisponibles(LocalDate inicio, LocalDate fin) {
		List<Propiedad> propiedadesDisponibles = new ArrayList<Propiedad>();
		for (Usuario usuario: this.usuarios) {
			propiedadesDisponibles.addAll(usuario.buscarPropiedadesDisponibles(inicio, fin));
		}
		return propiedadesDisponibles;
	}
	
	public Reserva reservar(Propiedad propiedad, DateLapse periodo, Usuario inquilino) {
		if(propiedad.estaDisponibleEn(periodo.getFrom(), periodo.getTo())) {
			Reserva reserva = new Reserva(periodo, inquilino);
			propiedad.agregarReserva(reserva);
			return reserva;
		}
		return null;
	}

	public int precioReserva(Reserva reserva) {
		Propiedad propiedad = this.usuarios.stream()
								.map(usuario -> usuario.buscarPropiedad(reserva))
								.filter(prop -> prop != null)
								.findFirst().orElse(null);
		return reserva.getDias() * propiedad.getPrecioNoche();
	}
	
	public void eliminarReserva(Reserva reserva) {
		if(reserva.isFechaPosteriorActual()) {
			Propiedad propiedad = this.usuarios.stream()
					.map(usuario -> usuario.buscarPropiedad(reserva))
					.filter(prop -> prop != null)
					.findFirst().orElse(null);
			propiedad.eliminarReserva(reserva);
		}
	}
	
	public List<Reserva> obtenerReservasUsuario(Usuario usuario) {
		return usuario.obtenerReservas();
	}
	
	public int ingresosPropietario(Usuario propietario, LocalDate inicio, LocalDate fin) {
		List<Reserva> reservas = propietario.obtenerReservasPropiedades(inicio, fin);
		return reservas.stream()
				.mapToInt(reserva -> this.precioReserva(reserva))
				.sum();
	}
}
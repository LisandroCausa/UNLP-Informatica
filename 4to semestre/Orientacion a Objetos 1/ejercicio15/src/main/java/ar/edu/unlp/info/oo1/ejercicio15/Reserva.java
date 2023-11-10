package ar.edu.unlp.info.oo1.ejercicio15;

import java.time.LocalDate;

public class Reserva {
	private DateLapse periodo;
	private Usuario inquilino;
	
	public Reserva(DateLapse periodo, Usuario inquilino) {
		this.periodo = periodo;
		this.inquilino = inquilino;
	}
	
	public boolean overlaps(DateLapse periodo) {
		return this.periodo.overlaps(periodo);
	}
	
	public int getDias() {
		return this.periodo.sizeInDays();
	}

	public boolean isFechaPosteriorActual() {
		return this.periodo.laterFrom();
	}
	
	public boolean estaEnPeriodo(LocalDate inicio, LocalDate fin) {
		return this.periodo.includesDate(inicio) && this.periodo.includesDate(fin);
	}
}

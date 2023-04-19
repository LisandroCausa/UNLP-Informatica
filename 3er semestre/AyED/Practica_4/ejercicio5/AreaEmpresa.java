package ejercicio5;

public class AreaEmpresa {
	private String identificacion;
	private int tardanza;
	
	public AreaEmpresa(String identicacion, int tardanza) {
		this.setTardanza(tardanza);
		this.setIdentificacion(identicacion);
	}
	
	public void setIdentificacion(String identificacion) {
		this.identificacion = identificacion;
	}
	
	public String getIdentificacion() {
		return this.identificacion;
	}
	
	public void setTardanza(int tardanza) {
		this.tardanza = tardanza;
	}
	
	public int getTardanza() {
		return this.tardanza;
	}
}

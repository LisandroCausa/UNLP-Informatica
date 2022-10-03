package clase3;

public class Estante {
	private Libro[] libros;
	private int dimL;
	private boolean lleno;
	
	public Estante() {
		this.libros = new Libro[20];
		this.dimL = 0;
		this.lleno = false;
	}
	
	public int cantidadLibros() {
		return this.dimL;
	}
	
	public boolean estaLleno() {
		return this.lleno;
	}
	
	public void agregarLibro(Libro libro) {
		if(!this.lleno)
		{
			this.dimL++;
			this.libros[this.dimL-1] = libro;
			
			if(this.dimL >= 20)
				this.lleno = true;
		}
	}
	
	public Libro libroConTitulo(String titulo) {
		for(int i = 0; i < this.dimL; i++)
		{
			if(titulo.equals(this.libros[i].getTitulo()))
			{
				return this.libros[i];	
			}	
		}
		return null;
	}
}

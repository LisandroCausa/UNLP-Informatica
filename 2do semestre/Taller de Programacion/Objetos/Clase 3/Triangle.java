package clase3;


public class Triangle {
	private double lado1,lado2,lado3;
	private String colorRelleno;
	private String colorBorde;

	public Triangle(double lado1, double lado2, double lado3, String colorRelleno, String colorBorde) {
		this.setLado1(lado1);
		this.setLado2(lado2);
		this.setLado3(lado3);
		this.setColorRelleno(colorRelleno);
		this.setColorBorde(colorBorde);
	}

	public double getLado1() {
		return lado1;
	}

	public void setLado1(double lado1) {
		this.lado1 = lado1;
	}

	public double getLado2() {
		return lado2;
	}

	public void setLado2(double lado2) {
		this.lado2 = lado2;
	}

	public double getLado3() {
		return lado3;
	}

	public void setLado3(double lado3) {
		this.lado3 = lado3;
	}

	public String getColorRelleno() {
		return colorRelleno;
	}

	public void setColorRelleno(String colorRelleno) {
		this.colorRelleno = colorRelleno;
	}

	public String getColorBorde() {
		return colorBorde;
	}

	public void setColorBorde(String colorBorde) {
		this.colorBorde = colorBorde;
	}
	
	public double calcularPerimetro(){
		return this.lado1 + this.lado2 + this.lado3;
	}
	
	public double calcularArea(){
		double s = (this.lado1 + this.lado2 + this.lado3) / 2;
		double x = s*(s-lado1)*(s-lado2)*(s-lado3);
		if(x < 0)
			return -1;
		return Math.sqrt(x);
	}
}

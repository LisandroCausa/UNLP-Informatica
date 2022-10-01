package clase3;

public class practica3_1 {
	public static void main(String[] args)
	{
		System.out.print("lado1: ");
		double lado1 = PaqueteLectura.Lector.leerDouble();
		System.out.print("lado2: ");
		double lado2 = PaqueteLectura.Lector.leerDouble();
		System.out.print("lado3: ");
		double lado3 = PaqueteLectura.Lector.leerDouble();
		System.out.print("color relleno: ");
		String colorRelleno = PaqueteLectura.Lector.leerString();
		System.out.print("color borde: ");
		String colorBorde = PaqueteLectura.Lector.leerString();
		Triangle t = new Triangle(lado1, lado2, lado3, colorRelleno, colorBorde);
		System.out.println("Perimetro = " + t.calcularPerimetro());
		System.out.println("Area = " + t.calcularArea());
	}

}

package ar.edu.unlp.info.oo2.ejercicio_patrones1;

public class Tweet implements ITweet {

	private String text;
	
	public Tweet(String text) {
		if(text.length() < 1 || text.length() > 280) {
			return;
		}
		
		this.text = text;
	}
	
	@Override
	public String getText() {
		return this.text;
	}

	@Override
	public ITweet getParent() {
		return null;
	}

}

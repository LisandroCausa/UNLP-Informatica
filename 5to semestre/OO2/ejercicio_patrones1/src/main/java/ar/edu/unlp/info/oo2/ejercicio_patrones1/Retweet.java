package ar.edu.unlp.info.oo2.ejercicio_patrones1;

public class Retweet implements ITweet {

	private ITweet parent;
	
	public Retweet(ITweet parent) {
		this.parent = parent;
	}
	
	@Override
	public String getText() {
		return "";
	}

	@Override
	public ITweet getParent() {
		return this.parent;
	}

}

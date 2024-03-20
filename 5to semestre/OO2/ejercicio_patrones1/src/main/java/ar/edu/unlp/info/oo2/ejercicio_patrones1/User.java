package ar.edu.unlp.info.oo2.ejercicio_patrones1;

import java.util.List;
import java.util.ArrayList;

public class User {
	private String screenName;
	private List<ITweet> tweets;
	
	public User(String screenName) {
		this.screenName = screenName;
		this.tweets = new ArrayList<ITweet>();
	}
	
	public void tweet(String text) {
		if(text.length() < 1 || text.length() > 280) {
			return;
		}
		ITweet newTweet = new Tweet(text);
		addTweet(newTweet);
	}
	
	public void tweet(ITweet parent) {
		if(parent == null) {
			return;
		}
		ITweet newTweet = new Retweet(parent);
		addTweet(newTweet);
	}
	
	private void addTweet(ITweet tweet) {
		this.tweets.add(tweet);
	}
	
	public List<ITweet> getTweets() {
		return this.tweets;
	}
	
	public String getScreenName() {
		return this.screenName;
	}
}

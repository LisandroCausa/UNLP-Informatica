package ar.edu.unlp.info.oo2.ejercicio_patrones1;

import java.util.*;

public class Twitter {
	private List<User> users;
	
	public Twitter() {
		this.users = new ArrayList<User>();
	}
	
	public User createUser(String screenName) {
		boolean foundUserWithScreenName = getUsers()
											.stream()
											.anyMatch(user -> user.getScreenName().equals(screenName));
		if(foundUserWithScreenName) {
			return null;
		}
		User user = new User(screenName);
		this.users.add(user);
		return user;
	}
	
	public List<User> getUsers() {
		return this.users;
	}
	
	public User getUser(String screenName) {
		return getUsers()
				.stream()
				.filter(user -> user.getScreenName().equals(screenName))
				.findFirst().orElse(null);
	}
	
	public void deleteUser(String screenName) {
		getUsers().removeIf(user -> user.getScreenName().equals(screenName));
	}
}

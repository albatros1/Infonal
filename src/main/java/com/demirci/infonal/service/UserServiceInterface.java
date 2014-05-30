package com.demirci.infonal.service;

import java.util.List;

import com.demirci.infonal.model.User;

public interface UserServiceInterface {
	public User addUser(User user);
	public List<User> listUser() ;
	public void deleteUser(String id);
	public void updateUser(String id, String name, String surname, String telephone);
}

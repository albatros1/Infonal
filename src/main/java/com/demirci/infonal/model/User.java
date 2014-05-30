package com.demirci.infonal.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * A document(entity) class which contains 
 * the information of a single user.
 * @author Mustafa Oðuz Demirci
 */

@Document
public class User {
	@Id
	String id;
	String name;
	String surname;
	String telephone;
	
	public User(){
		
	}
	
	public User(String name, String surname, String telephone) {
		super();
		this.name = name;
		this.surname = surname;
		this.telephone = telephone;
	}

	public String getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getSurname() {
		return surname;
	}
	
	public String getTelephone() {
		return telephone;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}	
}

package com.java.beans;

import java.time.LocalDateTime;

	public class PersonneDisparue {
	private String CIN_pd;
	private int age;
	private String nom;
	private String prenom;
	private LocalDateTime datedisparition;
	private String lieudisparition;
	private String description;
	private String photos;

	public String getCIN_pd() {
		return CIN_pd;
	}
	public void setCIN_pd(String cIN_pd) {
		CIN_pd = cIN_pd;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public LocalDateTime getDatedisparition() {
		return datedisparition;
	}
	public void setDatedisparition(LocalDateTime timestamp) {
		this.datedisparition = timestamp;
	}
	public String getLieudisparition() {
		return lieudisparition;
	}
	public void setLieudisparition(String lieudisparition) {
		this.lieudisparition = lieudisparition;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}


}

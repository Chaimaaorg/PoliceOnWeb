package com.java.beans;

import java.time.LocalDateTime;

public class DeclarationDisparition
{
	private int id_plainte_pd;
	private String id_user;
	private String id_pd;
	private int age;
	private String nom;
	private String prenom;
	private LocalDateTime datedisparition;
	private String lieudisparition;
	private String description;
	private String photos;
	public int getId_plainte_pd() {
		return id_plainte_pd;
	}
	public void setId_plainte_pd(int id_plainte_pd) {
		this.id_plainte_pd = id_plainte_pd;
	}
	public String getId_user() {
		return id_user;
	}
	public void setId_user(String id_user) {
		this.id_user = id_user;
	}
	public String getId_pd() {
		return id_pd;
	}
	public void setId_pd(String id_pd) {
		this.id_pd = id_pd;
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
	public void setDatedisparition(LocalDateTime datedisparition) {
		this.datedisparition = datedisparition;
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

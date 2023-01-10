package com.java.beans;

import java.time.LocalDateTime;

public class PersonneNonIdentifiee
{
	private int id_pni;
	private LocalDateTime date;
	private String lieu;
	private String description;
	private String photos;	
	public int getId_pni() {
		return id_pni;
	}
	public void setId_pni(int id_pni) {
		this.id_pni = id_pni;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	public String getLieu() {
		return lieu;
	}
	public void setLieu(String lieu) {
		this.lieu = lieu;
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

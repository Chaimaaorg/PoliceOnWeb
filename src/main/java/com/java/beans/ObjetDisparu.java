package com.java.beans;

import java.time.LocalDateTime;

public class ObjetDisparu 
{
	private int id_obj;
	private LocalDateTime date;
	private String lieu;
	private String description;
	private String photos;
	public int getId_obj() {
		return id_obj;
	}
	public void setId_obj(int id_obj) {
		this.id_obj = id_obj;
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

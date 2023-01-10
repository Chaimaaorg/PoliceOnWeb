package com.java.beans;

public class PersonneRecherchee 
{
	private String CIN_pre;
	private String filiationconnue;
	private String nationalite;
	private String description;
	private String derniereplaceretr;
	private String photos;

	public String getCIN_pre() {
		return CIN_pre;
	}
	public void setCIN_pre(String cIN_pre) {
		CIN_pre = cIN_pre;
	}
	public String getFiliationconnue() {
		return filiationconnue;
	}
	public void setFiliationconnue(String filiationconnue) {
		this.filiationconnue = filiationconnue;
	}
	public String getNationalite() {
		return nationalite;
	}
	public void setNationalite(String nationalite) {
		this.nationalite = nationalite;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDerniereplaceretr() {
		return derniereplaceretr;
	}
	public void setDerniereplaceretr(String derniereplaceretr) {
		this.derniereplaceretr = derniereplaceretr;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	
	

}
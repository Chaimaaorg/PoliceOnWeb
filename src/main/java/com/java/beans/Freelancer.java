package com.java.beans;

public class Freelancer 
{
	private String CIN;
	private String nom;
	private String prenom;
	private String job;
	private String skills;
	public String getCIN() {
		return CIN;
	}
	public void setCIN(String cIN) {
		CIN = cIN;
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
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}

	

}

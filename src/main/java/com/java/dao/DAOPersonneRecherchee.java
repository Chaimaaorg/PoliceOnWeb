package com.java.dao;

import java.util.List;

import com.java.beans.PersonneRecherchee;

public interface DAOPersonneRecherchee {

	public List<PersonneRecherchee> getAll();
	public void addPersonneRecherchee(String id_pre,String filiationconnue,String nationalite,String description,String lieuDesFaits,String photos);
	public void deletePersonneRecherchee(String cIN_pre);
	public void editPersonneRecherchee(String cIN_pre, String filiationconnue, String nationalite, String description,
			String derniereplaceretr, String photos);
	public PersonneRecherchee getPersonById(String cIN_pre);
	public List<PersonneRecherchee> getAllIndex();
	public List<PersonneRecherchee> findPersonneRecherchee(String cIN_pre);


}

package com.java.dao;
import java.time.LocalDateTime;
import java.util.List;

import com.java.beans.*;
public interface DAOPersonneDisparue 
{
	public List<PersonneDisparue> getAll();
	public void addPersonneDisparue(String CIN_pd,int age,String nom,String prenom,LocalDateTime datefaits,String lieu,String description,String photos);
	public void editPersonneDisparue(String CIN_pd,int age,String nom,String prenom,LocalDateTime datefaits,String lieu,String description,String photos);
	public void deletePersonneDisparue(String CIN_pd);
	public PersonneDisparue getPersonById(String cIN_pd);
	public List<PersonneDisparue> getAllIndex();
	public List<PersonneDisparue> findPersonneDisparu(String cIN_pd);


}

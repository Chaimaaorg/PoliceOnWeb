package com.java.dao;

import java.time.LocalDateTime;
import java.util.List;

import com.java.beans.PersonneRecherchee;
import com.java.beans.PlaintePr;
public interface DAOPlaintePr 
{
	public List<PersonneRecherchee> getAllSearchPerson(String CINUser);
	public List<PlaintePr> getPlaintesPr(String CINUser,String id_pre);
	public void addPlaintePr(String userCIN,String CIN_pre,String lieuDesFaits, LocalDateTime dateDesFaits,  String description, String témoins);

}

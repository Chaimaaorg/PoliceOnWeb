package com.java.dao;

import java.time.LocalDateTime;
import java.util.List;

import com.java.beans.PersonneNonIdentifiee;

public interface DAOPersonneNonIdentifiee 
{
	public List<PersonneNonIdentifiee > getAll();
	public void addPersonneNonIdentifiee(LocalDateTime date,String lieu,String description,String photos);
	public void deletePersonneNonIdentifiee(int id_pni);
	public List<PersonneNonIdentifiee> findPersonneNonIdentifiee(String id_pni);

}

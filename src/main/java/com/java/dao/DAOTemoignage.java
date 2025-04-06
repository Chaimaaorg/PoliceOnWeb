package com.java.dao;

import java.util.List;

import com.java.beans.*;

public interface DAOTemoignage {
	public List<Temoignage> getAllTemoignages(String CINUser);

	public void addTemoignage(String cin, String description, String typet, String id_concerne);

	public List<Temoignage> getAll();
	
	public List<Temoignage> findTemoignage(String search);


}

package com.java.dao;

import java.util.List;

import com.java.beans.DeclarationRecherche;

public interface DAODeclarationRecherche 
{
	public List<DeclarationRecherche> getAll();
		 
	public List<DeclarationRecherche> findDeclarationPr(String searchDr);

	public List<DeclarationRecherche> getDeclarationUserById(String cin, String id_pre);

	public DeclarationRecherche getDeclarationById(int id);



}

package com.java.dao;

import java.util.List;

import com.java.beans.DeclarationDisparition;

public interface DAODeclarationDisparition 
{
	public List<DeclarationDisparition> getAll();

	public List<DeclarationDisparition> findDeclarationPd(String searchDD);

}

package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.Temoignage;

public class DAOTemoignageImpl implements DAOTemoignage{
	private DAOFactory daofactory;
	public DAOTemoignageImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	@Override
	public List<Temoignage> getAllTemoignages(String CINUser) {
		Connection connexion;
		ResultSet resultat;
		List<Temoignage> listpr = new ArrayList<Temoignage>();
		Temoignage tm;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM Temoignage where id_user=?");
	    	statement.setString(1, CINUser);

			resultat = statement.executeQuery();
			while(resultat.next())
			{
				tm = map(resultat);
				listpr.add(tm);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return listpr;
	}
	private Temoignage map(ResultSet resultat) throws SQLException {
		Temoignage plainte = new Temoignage();
        plainte.setId_temoignage(resultat.getInt("id_temoignage"));		
        plainte.setId_user(resultat.getString("id_user"));		
        plainte.setTypet(resultat.getString("typet"));
        plainte.setDescription(resultat.getString("description"));
        plainte.setId_concerne(resultat.getString("id_concerne"));
        return plainte;
	}	
	@Override
	public void addTemoignage(String cin, String description, String typet, String id_concerne) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO temoignage(id_user,description,typet,id_concerne) VALUES(?,?,?,?)");
			statement.setString(1,cin);
			statement.setString(2,description);
			statement.setString(3,typet);
			statement.setString(4,id_concerne);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<Temoignage> getAll() {
		Connection connexion;
		ResultSet resultat;
		List<Temoignage> listpr = new ArrayList<Temoignage>();
		Temoignage tm;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM Temoignage");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				tm = map(resultat);
				listpr.add(tm);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return listpr;
	}
	@Override
	public List<Temoignage> findTemoignage(String search){
	Connection connexion;
	ResultSet resultat;
	Temoignage pr;
	List<Temoignage> listpr = new ArrayList<Temoignage>();
	try {
		connexion = daofactory.getConnection();
		PreparedStatement statement = connexion.prepareStatement("SELECT * FROM temoignage WHERE id_user LIKE CONCAT( '%', ? , '%') OR description LIKE CONCAT( '%', ? , '%') OR typet LIKE CONCAT( '%', ? , '%')");
		statement.setString(1,search);	
		statement.setString(2,search);			
		statement.setString(3,search);					
		resultat = statement.executeQuery();
		while(resultat.next())
		{
			pr = map(resultat);
			listpr.add(pr);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}

	return listpr;
	}



}

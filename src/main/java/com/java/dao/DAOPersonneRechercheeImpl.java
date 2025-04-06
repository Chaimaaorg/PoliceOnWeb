package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.PersonneRecherchee;

public class DAOPersonneRechercheeImpl implements DAOPersonneRecherchee {
	private DAOFactory daofactory;
	public DAOPersonneRechercheeImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	@Override
	public List<PersonneRecherchee> getAll() {
		Connection connexion;
		ResultSet resultat;
		List<PersonneRecherchee> listPr = new ArrayList<PersonneRecherchee>();
		PersonneRecherchee pd;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_recherchee");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pd = map(resultat);
				listPr.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listPr;
		
	}

	private PersonneRecherchee map(ResultSet resultat) throws SQLException {
		PersonneRecherchee personne_recherchee = new PersonneRecherchee();
		personne_recherchee.setCIN_pre(resultat.getString("CIN_pre"));
		personne_recherchee.setFiliationconnue(resultat.getString("filiationconnue"));
		personne_recherchee.setNationalite(resultat.getString("nationalite"));		
		personne_recherchee.setDescription(resultat.getString("description"));
		personne_recherchee.setDerniereplaceretr(resultat.getString("derniereplaceretr"));
		personne_recherchee.setPhotos(resultat.getString("photos"));	
		return personne_recherchee;	}
	@Override
	public void addPersonneRecherchee(String id_pre, String filiationconnue, String nationalite, String description,
			String lieuDesFaits, String photos) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO personne_recherchee(CIN_pre,filiationconnue,nationalite,description,derniereplaceretr,photos) VALUES(?,?,?,?,?,?)");
			statement.setString(1,id_pre);
			statement.setString(2,filiationconnue);
			statement.setString(3,nationalite);
			statement.setString(4,description);
			statement.setString(5,lieuDesFaits);
			statement.setString(6,photos);

			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	@Override
	public void deletePersonneRecherchee(String cIN_pre) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("DELETE FROM personne_recherchee WHERE CIN_pre=?");
			statement.setString(1,cIN_pre);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	@Override
	public void editPersonneRecherchee(String cIN_pre, String filiationconnue, String nationalite, String description,
			String derniereplaceretr, String photos) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("Update personne_recherchee set filiationconnue=?,nationalite=?,description=?,derniereplaceretr=?,photos=? WHERE CIN_pre=?");
			statement.setString(1,filiationconnue);
			statement.setString(2,nationalite);
			statement.setString(3,description);
			statement.setString(4,derniereplaceretr);
			statement.setString(5,photos);
			statement.setString(6,cIN_pre);
			

			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	@Override
	public PersonneRecherchee getPersonById(String cIN_pre) {
		Connection connexion;
		ResultSet resultat;
		PersonneRecherchee pd = null;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_recherchee WHERE CIN_pre=?");
			statement.setString(1,cIN_pre);			
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pd = map(resultat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return pd;
		
	}
	@Override
	public List<PersonneRecherchee> getAllIndex() {
		Connection connexion;
		ResultSet resultat;
		List<PersonneRecherchee> listPr = new ArrayList<PersonneRecherchee>();
		PersonneRecherchee pd;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_recherchee LIMIT 5");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pd = map(resultat);
				listPr.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listPr;
	}
	@Override
	public List<PersonneRecherchee> findPersonneRecherchee(String cIN_pre) {
		Connection connexion;
		ResultSet resultat;
		PersonneRecherchee pr;
		List<PersonneRecherchee> listpr = new ArrayList<PersonneRecherchee>();
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_recherchee WHERE CIN_pre LIKE CONCAT( '%', ? , '%') OR filiationconnue LIKE CONCAT( '%', ? , '%') OR nationalite LIKE CONCAT( '%', ? , '%') OR description LIKE CONCAT( '%', ? , '%') OR derniereplaceretr LIKE CONCAT( '%', ? , '%') ");
			statement.setString(1,cIN_pre);			
			statement.setString(2,cIN_pre);			
			statement.setString(3,cIN_pre);			
			statement.setString(4,cIN_pre);
			statement.setString(5,cIN_pre);			

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

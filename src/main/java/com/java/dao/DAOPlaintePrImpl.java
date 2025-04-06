package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.PersonneRecherchee;
import com.java.beans.PlaintePr;

public class DAOPlaintePrImpl implements DAOPlaintePr{
	private DAOFactory daofactory;
	public DAOPlaintePrImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	@Override
	public void addPlaintePr(String userCIN,String CIN_pre,String lieuDesFaits,LocalDateTime dateDesFaits,  String description, String témoins) {
	    Connection connexion;
	    PreparedStatement statement = null;
	    try {
	        connexion = daofactory.getConnection();
	        statement = connexion.prepareStatement("INSERT INTO plainte_pr(id_user,id_pre,lieuDesFaits,dateDesFaits,description,témoins) VALUES (?,?,?,?,?,?)");
	        statement.setString(1,userCIN);
	        statement.setString(2,CIN_pre);
	        statement.setString(3, lieuDesFaits);
	        statement.setObject(4, dateDesFaits);	        
	        statement.setString(5, description);
	        statement.setString(6, témoins);
	        statement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	@Override
	public List<PersonneRecherchee> getAllSearchPerson(String CINUser) {
		Connection connexion;
		ResultSet resultat;
		List<PersonneRecherchee> listpr = new ArrayList<PersonneRecherchee>();
		PersonneRecherchee pr;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT pr.* FROM personne_recherchee pr,plainte_pr plainte where plainte.id_pre=pr.CIN_pre AND id_user=?");
	    	statement.setString(1, CINUser);
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pr = mapPersonne(resultat);
				listpr.add(pr);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return listpr;
	}
	public List<PlaintePr> getPlaintesPr(String CINUser,String id_pre) {
		Connection connexion;
		ResultSet resultat;
		List<PlaintePr> listpr = new ArrayList<PlaintePr>();
		PlaintePr pr;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT plainte.* FROM personne_recherchee pr,plainte_pr plainte where plainte.id_pre=pr.CIN_pre AND plainte.id_pre=? AND id_user=?");
	    	statement.setString(1, id_pre);
	    	statement.setString(2, CINUser);

			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pr = mapPlainte(resultat);
				listpr.add(pr);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return listpr;
	}
	private PersonneRecherchee mapPersonne(ResultSet resultat) throws SQLException {
        PersonneRecherchee PersonneRechercheee = new PersonneRecherchee();
        PersonneRechercheee.setFiliationconnue(resultat.getString("filiationconnue"));
        PersonneRechercheee.setDescription(resultat.getString("pr.description"));
        PersonneRechercheee.setPhotos(resultat.getString("photos"));
        PersonneRechercheee.setNationalite(resultat.getString("nationalite"));
        PersonneRechercheee.setDerniereplaceretr(resultat.getString("derniereplaceretr"));
        PersonneRechercheee.setCIN_pre(resultat.getString("CIN_pre"));


        return PersonneRechercheee;
	}
	private PlaintePr mapPlainte(ResultSet resultat) throws SQLException {
        PlaintePr plainte = new PlaintePr();
        plainte.setLieuDesFaits(resultat.getString("lieuDesFaits"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        plainte.setDateDesFaits(LocalDateTime.parse(resultat.getString("dateDesFaits"), formatter));        
        plainte.setTémoins(resultat.getString("témoins"));
        plainte.setDescription(resultat.getString("plainte.description"));
        plainte.setTémoins(resultat.getString("témoins"));

        return plainte;
	}


}

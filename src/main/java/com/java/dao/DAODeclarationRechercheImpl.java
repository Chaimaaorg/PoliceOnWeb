package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.DeclarationRecherche;

public class DAODeclarationRechercheImpl implements DAODeclarationRecherche
{
	private DAOFactory daofactory;
	public DAODeclarationRechercheImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	@Override
	public List<DeclarationRecherche> getAll() {
		Connection connexion;
		ResultSet resultat;
		List<DeclarationRecherche> listDesclarationsPr = new ArrayList<DeclarationRecherche>();
		DeclarationRecherche pre;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM plainte_pr, personne_recherchee where plainte_pr.id_pre=personne_recherchee.CIN_pre");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pre = map(resultat);
				listDesclarationsPr.add(pre);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listDesclarationsPr;
		}
	
	private DeclarationRecherche map(ResultSet resultat) throws SQLException {
		DeclarationRecherche declarationDispariton = new DeclarationRecherche();
		declarationDispariton.setId_plainte_pr(resultat.getInt("id_plainte_pr"));
		declarationDispariton.setId_user(resultat.getString("id_user"));
		declarationDispariton.setId_pre(resultat.getString("id_pre"));		
		declarationDispariton.setLieuDesFaits(resultat.getString("lieuDesFaits"));				
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        declarationDispariton.setDateDesFaits(LocalDateTime.parse(resultat.getString("dateDesFaits"), formatter));
		declarationDispariton.setTémoins(resultat.getString("témoins"));		
		declarationDispariton.setDescription(resultat.getString("description"));
		declarationDispariton.setFiliationconnue(resultat.getString("filiationconnue"));		
		declarationDispariton.setPhotos(resultat.getString("photos"));	
		return declarationDispariton;	
		
	}
	@Override
	public DeclarationRecherche getDeclarationById(int id) {
		Connection connexion;
		ResultSet resultat;
		DeclarationRecherche pre = null;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM plainte_pr, personne_recherchee where plainte_pr.id_pre=personne_recherchee.CIN_pre AND id_plainte_pr=?");
			statement.setInt(1,id);			
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pre = map(resultat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return pre;
		}
	@Override
	public List<DeclarationRecherche> findDeclarationPr(String searchDr) {
		Connection connexion;
		ResultSet resultat;
		DeclarationRecherche pni;
		List<DeclarationRecherche> listPni = new ArrayList<DeclarationRecherche>();
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT DISTINCT * FROM plainte_pr JOIN personne_recherchee ON plainte_pr.id_pre = personne_recherchee.CIN_pre WHERE id_pre LIKE CONCAT( '%', ? , '%') OR id_user LIKE CONCAT( '%', ? , '%') OR lieuDesFaits LIKE CONCAT( '%', ? , '%') OR témoins LIKE CONCAT( '%', ? , '%') OR filiationconnue LIKE CONCAT( '%', ? , '%') OR plainte_pr.description LIKE CONCAT( '%', ? , '%')");
			statement.setString(1,searchDr);	
			statement.setString(2,searchDr);			
			statement.setString(3,searchDr);			
			statement.setString(4,searchDr);			
			statement.setString(5,searchDr);			
			statement.setString(6,searchDr);			
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pni = map(resultat);
				listPni.add(pni);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listPni;
		
	}
	@Override
	public List<DeclarationRecherche> getDeclarationUserById(String cin, String id_pre) {
		Connection connexion;
		ResultSet resultat;
		List<DeclarationRecherche> listDesclarationsPr = new ArrayList<DeclarationRecherche>();
		DeclarationRecherche pre;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM plainte_pr, personne_recherchee where plainte_pr.id_pre=personne_recherchee.CIN_pre AND id_user=? AND id_pre=?");
			statement.setString(1, cin);
			statement.setString(2, id_pre);			
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pre = map(resultat);
				listDesclarationsPr.add(pre);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listDesclarationsPr;
		}
}
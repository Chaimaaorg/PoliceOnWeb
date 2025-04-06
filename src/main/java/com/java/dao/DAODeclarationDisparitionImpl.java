package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.DeclarationDisparition;

public class DAODeclarationDisparitionImpl implements DAODeclarationDisparition{
	private DAOFactory daofactory;
	public DAODeclarationDisparitionImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	@Override
	public List<DeclarationDisparition> getAll() {
		Connection connexion;
		ResultSet resultat;
		List<DeclarationDisparition> listDesclarationsPd = new ArrayList<DeclarationDisparition>();
		DeclarationDisparition pd;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM plainte_pd, personne_disparue where plainte_pd.id_pd=personne_disparue.CIN_pd");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pd = map(resultat);
				listDesclarationsPd.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listDesclarationsPd;

}
	private DeclarationDisparition map(ResultSet resultat) throws SQLException {
		DeclarationDisparition declarationDispariton = new DeclarationDisparition();
		declarationDispariton.setId_plainte_pd(resultat.getInt("id_plainte_pd"));
		declarationDispariton.setId_user(resultat.getString("id_user"));
		declarationDispariton.setId_pd(resultat.getString("id_pd"));		
		declarationDispariton.setAge(resultat.getInt("age"));
		declarationDispariton.setNom(resultat.getString("nom"));		
		declarationDispariton.setPrenom(resultat.getString("prenom"));		
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        declarationDispariton.setDatedisparition(LocalDateTime.parse(resultat.getString("datedisparition"), formatter));
		declarationDispariton.setLieudisparition(resultat.getString("lieudisparition"));
		declarationDispariton.setDescription(resultat.getString("description"));
		declarationDispariton.setPhotos(resultat.getString("photos"));	
		return declarationDispariton;
	}
	@Override
	public List<DeclarationDisparition> findDeclarationPd(String searchDD) {
		Connection connexion;
		ResultSet resultat;
		DeclarationDisparition pni;
		List<DeclarationDisparition> listPni = new ArrayList<DeclarationDisparition>();
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT DISTINCT * FROM plainte_pd JOIN personne_disparue ON plainte_pd.id_pd = personne_disparue.CIN_pd WHERE id_pd LIKE CONCAT( '%', ? , '%') OR nom LIKE CONCAT( '%', ? , '%') OR prenom LIKE CONCAT( '%', ? , '%') OR id_user LIKE CONCAT( '%', ? , '%') OR lieudisparition LIKE CONCAT( '%', ? , '%') OR description LIKE CONCAT( '%', ? , '%')");
			statement.setString(1,searchDD);	
			statement.setString(2,searchDD);			
			statement.setString(3,searchDD);			
			statement.setString(4,searchDD);			
			statement.setString(5,searchDD);			
			statement.setString(6,searchDD);			

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
}
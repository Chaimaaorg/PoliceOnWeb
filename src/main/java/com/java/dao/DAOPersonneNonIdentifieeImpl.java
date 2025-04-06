package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.PersonneNonIdentifiee;

public class DAOPersonneNonIdentifieeImpl implements DAOPersonneNonIdentifiee{
	private DAOFactory daofactory;
	public DAOPersonneNonIdentifieeImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	@Override
	public List<PersonneNonIdentifiee> getAll() {
		Connection connexion;
		ResultSet resultat;
		List<PersonneNonIdentifiee> listPni = new ArrayList<PersonneNonIdentifiee>();
		PersonneNonIdentifiee pni;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_non_identifiee");
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
	public void addPersonneNonIdentifiee(LocalDateTime date, String lieu, String description, String photos) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO personne_non_identifiee(date,lieu,description,photos) VALUES(?,?,?,?)");
			statement.setObject(1,date);
			statement.setString(2,lieu);
			statement.setString(3,description);
			statement.setString(4,photos);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deletePersonneNonIdentifiee(int id_pni) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("DELETE FROM personne_non_identifie WHERE id_pni=?");
			statement.setInt(1,id_pni);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public List<PersonneNonIdentifiee> findPersonneNonIdentifiee(String id_pni) {
		Connection connexion;
		ResultSet resultat;
		PersonneNonIdentifiee pni;
		List<PersonneNonIdentifiee> listPni = new ArrayList<PersonneNonIdentifiee>();
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_non_identifiee WHERE lieu LIKE CONCAT( '%', ? , '%') OR description LIKE CONCAT( '%', ? , '%') ");
			statement.setString(1,id_pni);			
			statement.setString(2,id_pni);			
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
	private PersonneNonIdentifiee map(ResultSet resultat) throws SQLException {
		PersonneNonIdentifiee personne_non_identifiee = new PersonneNonIdentifiee();
		personne_non_identifiee.setId_pni(resultat.getInt("id_pni"));
		personne_non_identifiee.setLieu(resultat.getString("lieu"));
		personne_non_identifiee.setDescription(resultat.getString("description"));		
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        personne_non_identifiee.setDate(LocalDateTime.parse(resultat.getString("date"), formatter));
		personne_non_identifiee.setPhotos(resultat.getString("photos"));	
		return personne_non_identifiee;
	}

}

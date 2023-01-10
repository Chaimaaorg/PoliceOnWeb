package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.PersonneDisparue;

public class DAOPersonneDisparueImpl implements DAOPersonneDisparue
{
	private DAOFactory daofactory;
	public DAOPersonneDisparueImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	@Override
	public List<PersonneDisparue> getAll() {
		Connection connexion;
		ResultSet resultat;
		List<PersonneDisparue> listPd = new ArrayList<PersonneDisparue>();
		PersonneDisparue pd;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_disparue ");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pd = map(resultat);
				listPd.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listPd;
		
	}
	private PersonneDisparue map(ResultSet resultat) throws SQLException {
		PersonneDisparue personne_disparue = new PersonneDisparue();
		personne_disparue.setCIN_pd(resultat.getString("CIN_pd"));
		personne_disparue.setNom(resultat.getString("nom"));
		personne_disparue.setAge(resultat.getInt("age"));		
		personne_disparue.setPrenom(resultat.getString("prenom"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        personne_disparue.setDatedisparition(LocalDateTime.parse(resultat.getString("datedisparition"), formatter));
		personne_disparue.setLieudisparition(resultat.getString("lieudisparition"));
		personne_disparue.setDescription(resultat.getString("description"));
		personne_disparue.setPhotos(resultat.getString("photos"));	
		return personne_disparue;
	}
	@Override
	public void addPersonneDisparue(String CIN_pd, int age, String nom, String prenom, LocalDateTime datefaits,
			String lieu, String description, String photos) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO personne_disparue(CIN_pd,age,nom,prenom,description,datedisparition,lieudisparition,photos) VALUES(?,?,?,?,?,?,?,?)");
			statement.setString(1,CIN_pd);
			statement.setInt(2,age);
			statement.setString(3,nom);
			statement.setString(4,prenom);
			statement.setString(5,description);
			statement.setObject(6,datefaits);
			statement.setString(7,lieu);
			statement.setString(8,photos);

			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void editPersonneDisparue(String CIN_pd, int age, String nom, String prenom, LocalDateTime datefaits,
			String lieu, String description, String photos) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("UPDATE personne_disparue set age=?,nom=?,prenom=?,description=?,datedisparition=?,lieudisparition=?,photos=? WHERE CIN_pd=?");
			statement.setInt(1,age);
			statement.setString(2,nom);
			statement.setString(3,prenom);
			statement.setString(4,description);
			statement.setObject(5,datefaits);
			statement.setString(6,lieu);
			statement.setString(7,photos);
			statement.setString(8,CIN_pd);			

			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	@Override
	public void deletePersonneDisparue(String CIN_pd) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("DELETE FROM personne_disparue WHERE CIN_pd=?");
			statement.setString(1,CIN_pd);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	@Override
	public PersonneDisparue getPersonById(String cIN_pd) {
		Connection connexion;
		ResultSet resultat;
		PersonneDisparue pd = null;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_disparue WHERE CIN_pd=?");
			statement.setString(1,cIN_pd);			
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
	public List<PersonneDisparue> getAllIndex() {
		Connection connexion;
		ResultSet resultat;
		List<PersonneDisparue> listPd = new ArrayList<PersonneDisparue>();
		PersonneDisparue pd;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_disparue LIMIT 5");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pd = map(resultat);
				listPd.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return listPd;
	}
	@Override
	public List<PersonneDisparue> findPersonneDisparu(String cIN_pd) {
		Connection connexion;
		ResultSet resultat;
		PersonneDisparue pd;
		List<PersonneDisparue> listpd = new ArrayList<PersonneDisparue>();
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM personne_disparue WHERE CIN_pd LIKE CONCAT( '%', ? , '%') OR nom LIKE CONCAT( '%', ? , '%') OR prenom LIKE CONCAT( '%', ? , '%') OR lieudisparition LIKE CONCAT( '%', ? , '%') OR description LIKE CONCAT( '%', ? , '%') ");
			statement.setString(1,cIN_pd);			
			statement.setString(2,cIN_pd);			
			statement.setString(3,cIN_pd);			
			statement.setString(4,cIN_pd);
			statement.setString(5,cIN_pd);			
			
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pd = map(resultat);
				listpd.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listpd;
		
	}

}

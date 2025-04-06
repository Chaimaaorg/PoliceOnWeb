package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.ObjetDisparu;

public class DAOObjetDisparuImpl implements DAOObjetDisparu{
	private DAOFactory daofactory;
	public DAOObjetDisparuImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	@Override
	public List<ObjetDisparu> getAll() {
		Connection connexion;
		ResultSet resultat;
		List<ObjetDisparu> listobjd= new ArrayList<ObjetDisparu>();
		ObjetDisparu objd;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM objet_disparu");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				objd = map(resultat);
				listobjd.add(objd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listobjd;
	}		

	@Override
	public void addObjetDisparu(LocalDateTime date, String lieu, String description, String photos) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO objet_disparu(date,lieu,description,photos) VALUES(?,?,?,?)");
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
	public void deleteObjetDisparu(int id_obj) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("DELETE FROM objet_disparu WHERE id_obj=?");
			statement.setInt(1,id_obj);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public List<ObjetDisparu> findObjetDisparu(String id_obj) {
		Connection connexion;
		ResultSet resultat;
		ObjetDisparu objd;
		List<ObjetDisparu> listobjd = new ArrayList<ObjetDisparu>();
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM objet_disparu WHERE lieu LIKE CONCAT( '%', ? , '%') OR description LIKE CONCAT( '%', ? , '%') ");
			statement.setString(1,id_obj);			
			statement.setString(2,id_obj);		
			
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				objd = map(resultat);
				listobjd.add(objd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listobjd;
		
	}
	private ObjetDisparu map(ResultSet resultat) throws SQLException {
		ObjetDisparu objetDisparu = new ObjetDisparu();
		objetDisparu.setId_obj(resultat.getInt("id_obj"));
		objetDisparu.setLieu(resultat.getString("lieu"));
		objetDisparu.setDescription(resultat.getString("description"));		
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        objetDisparu.setDate(LocalDateTime.parse(resultat.getString("date"), formatter));
		objetDisparu.setPhotos(resultat.getString("photos"));	
		return objetDisparu;
	}

}

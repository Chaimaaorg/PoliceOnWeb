package com.java.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.User;

public class DAOUserImpl implements DAOUser
{
	private DAOFactory daofactory;
	public DAOUserImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
	}
	@Override
	public List<User> getAllUsers() throws DAOException
	{		
		Connection connexion;
		ResultSet resultat;
		List<User> users = new ArrayList<User>();
		User user;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM user");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				user = map(resultat);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return users;
			
	}
	@Override
	public void deleteUser(String CIN)
	{
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("DELETE FROM user WHERE CIN=?");
			statement.setString(1,CIN);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateUser(String CIN,String nom,String prenom,String adresse,String tel,String email,String mdp)
	{
		Connection connexion;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("UPDATE user SET nom =?,prenom =?,adresse=?,tel=?,email =?,mdp =? where CIN=?");
			statement.setString(1, nom);
			statement.setString(2, prenom);
			statement.setString(3, adresse);
			statement.setString(4, tel);
			statement.setString(5, email);
			statement.setString(6, mdp);
			statement.setString(7, CIN);
			statement.executeUpdate();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}

	@Override
	public List<User> findUser(String CIN) {
		Connection connexion;
		ResultSet resultat;
		User user =null;
		List<User> users = new ArrayList<User>();
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM user WHERE CIN LIKE CONCAT( '%', ? , '%') OR nom LIKE CONCAT( '%', ? , '%') OR prenom LIKE CONCAT( '%', ? , '%') OR tel LIKE CONCAT( '%', ? , '%')");
			statement.setString(1,CIN);
			statement.setString(2,CIN);
			statement.setString(3,CIN);
			statement.setString(4,CIN);
			resultat = statement.executeQuery();
			if(resultat.next())
			{
				user = map(resultat);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	
	private User map(ResultSet resultat) throws SQLException 
	{
		User user = new User();
		user.setCIN(resultat.getString("CIN"));		
		user.setNom(resultat.getString("nom"));
		user.setPrenom(resultat.getString("prenom"));
		user.setAdresse(resultat.getString("adresse"));		
		user.setTel(resultat.getString("tel"));		
		user.setNationalite(resultat.getString("nationalite"));		
		user.setProfession(resultat.getString("profession"));		
		user.setDatenaissance(resultat.getDate("datenaissance"));		
		user.setLieunaissance(resultat.getString("lieunaissance"));	
		user.setSexe(resultat.getString("sexe"));
		user.setEmail(resultat.getString("email"));
		user.setMdp(resultat.getString("mdp"));
		user.setRole(resultat.getString("role"));
		return user;
	}
	@Override
	public User getUserByEmailAndPassword(String email, String mdp) {
		User user = null;
        Connection connexion;
        try {
        	connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("select * from user where email=? and mdp=?");
			statement.setString(1, email);
			statement.setString(2, mdp);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
				user = map(rs);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
	}
	@Override
	public void addUser(String CIN, String nom, String prenom, String adresse, String tel, String nationalite,
			String profession, java.sql.Date datenaissance, String lieunaissance, String sexe, String email, String mdp) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO user(CIN,nom,prenom,adresse,tel,nationalite,profession,datenaissance,lieunaissance,sexe,email,mdp,role) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			statement.setString(1,CIN);
			statement.setString(2,nom);
			statement.setString(3,prenom);
			statement.setString(4,adresse);
			statement.setString(5,tel);
			statement.setString(6,nationalite);
			statement.setString(7, profession);
			statement.setDate(8, (Date) datenaissance);
			statement.setString(9, lieunaissance);
			statement.setString(10, sexe);
			statement.setString(11, email);
			statement.setString(12, mdp);	
			statement.setInt(13, 1);
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	

}

package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.User;

public class UserDAOImpl implements DAOUser
{
	private DAOFactory daofactory;
	public UserDAOImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
	}
	@Override
	public List<User> getAllFreelancers() throws DAOException
	{		
		Connection connexion;
		ResultSet resultat;
		List<User> freelancers = new ArrayList<User>();
		User freelancer;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM freelancer");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				freelancer = map(resultat);
				freelancers.add(freelancer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return freelancers;
	}
	private User map(ResultSet resultat) throws SQLException 
	{
		User freelancer = new User();
		freelancer.setCIN(resultat.getString("CIN"));
		freelancer.setNom(resultat.getString("nom"));
		freelancer.setPrenom(resultat.getString("prenom"));
		freelancer.setJob(resultat.getString("job"));
		freelancer.setSkills(resultat.getString("skills"));

		return freelancer;
	}
	@Override
	public void addFreelancer(String CIN, String nom, String prenom, String job, String skills)
	{
		Connection connexion;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO freelancer(CIN,nom,prenom,job,skills) VALUES (?,?,?,?,?)");
			statement.setString(1, CIN);
			statement.setString(2, nom);
			statement.setString(3, prenom);
			statement.setString(4, job);
			statement.setString(5, skills);
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public void deleteFreelancer(String CIN)
	{
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("DELETE FROM freelancer WHERE CIN=?");
			statement.setString(1,CIN);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void updateFreelancer(String CIN, String nom, String prenom, String job, String skills) {
		// TODO Auto-generated method stub
		Connection connexion;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("UPDATE freelancer SET nom =?,prenom =?,job =?,skills =? where CIN=?");
			statement.setString(1, nom);
			statement.setString(2, prenom);
			statement.setString(3, job);
			statement.setString(4, skills);
			statement.setString(5, CIN);
			statement.executeUpdate();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}
	@Override
	public User findFreelancer(String CIN)
	{
		Connection connexion;
		ResultSet resultat;
		User freelancer =null;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM freelancer WHERE CIN = ?");
			statement.setString(1,CIN);
			resultat = statement.executeQuery();
			if(resultat.next())
			{
				freelancer = map(resultat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return freelancer;
	}
	

}

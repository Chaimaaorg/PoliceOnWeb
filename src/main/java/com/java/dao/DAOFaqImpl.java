package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.java.beans.Faq;

public class DAOFaqImpl implements DAOFaq
{
	private DAOFactory daofactory;
	public DAOFaqImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
	}
	@Override
	public List<Faq> getAllFaqs() throws DAOException
	{		
		Connection connexion;
		ResultSet resultat;
		List<Faq> faqs = new ArrayList<Faq>();
		Faq faq;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM faq");
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				faq = map(resultat);
				faqs.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return faqs;
	}

	@Override
	public void addFaq (String question, String reponse) 
	{
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO faq(question,reponse) VALUES(?,?)");
			statement.setString(1,question);
			statement.setString(2,reponse);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void deleteFaq(int id_faq)
	{
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("DELETE FROM faq WHERE id_faq=?");
			statement.setInt(1,id_faq);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void  updateFaq (int id_Faq, String question, String response)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Faq> findFaq (String question){
		Connection connexion;
		ResultSet resultat;
		Faq faq =null;
		List<Faq> faqs = new ArrayList<Faq>();
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT * FROM faq WHERE question LIKE CONCAT( '%', ? , '%')");
			statement.setString(1,question);
			resultat = statement.executeQuery();
			if(resultat.next())
			{
				faq = map(resultat);
				faqs.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return faqs;
	}
	private Faq map(ResultSet resultat) throws SQLException 
	{
		Faq faq = new Faq();
		faq.setId_faq(resultat.getInt("id_faq"));		
		faq.setQuestion(resultat.getString("question"));
		faq.setReponse(resultat.getString("reponse"));
		return faq;
	}

}


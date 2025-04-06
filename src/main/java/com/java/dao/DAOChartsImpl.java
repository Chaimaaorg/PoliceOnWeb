package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOChartsImpl implements DAOCharts{
	private DAOFactory daofactory;
	public DAOChartsImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
	}
	@Override
	public int getNumPlaintesRegion(String region) {
	    int n = 0;
	    int n2= 0;
	    Connection connexion = null;
	    PreparedStatement statement = null;
	    try {
	        connexion = daofactory.getConnection();
	        statement = connexion.prepareStatement("SELECT count(*) FROM plainte_pr WHERE (lieuDesFaits LIKE ?) AND EXTRACT(YEAR FROM dateDesFaits)=EXTRACT(YEAR FROM CURRENT_DATE())");
			statement.setString(1,region);
	        ResultSet resultSet = statement.executeQuery();
	        PreparedStatement statement2 = connexion.prepareStatement("SELECT count(*) FROM plainte_pd,personne_disparue WHERE plainte_pd.id_pd=personne_disparue.CIN_pd AND (lieudisparition LIKE ? ) AND EXTRACT(YEAR FROM datedisparition)=EXTRACT(YEAR FROM CURRENT_DATE());");
			statement2.setString(1,region);
	        ResultSet resultSet2 = statement2.executeQuery();
	        if(resultSet.next()){
	            n = resultSet.getInt(1);
	        }
	        if(resultSet2.next()){
	            n2 = resultSet2.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally{
	        try {
	            if(statement!=null) statement.close();
	            if(connexion!=null) connexion.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return n+n2;

	}
	@Override
	public int getNumCrimesRegion(String region) {

	    int n = 0;
	    Connection connexion = null;
	    PreparedStatement statement = null;
	    try {
	        connexion = daofactory.getConnection();
	        statement = connexion.prepareStatement("SELECT count(*) FROM plainte_pr WHERE (lieuDesFaits LIKE ?) AND EXTRACT(YEAR FROM dateDesFaits)=EXTRACT(YEAR FROM CURRENT_DATE())");
			statement.setString(1,region);
	        ResultSet resultSet = statement.executeQuery();
	        if(resultSet.next()){
	            n = resultSet.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally{
	        try {
	            if(statement!=null) statement.close();
	            if(connexion!=null) connexion.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return n;

	}
	@Override
	public int getTypeCrimeNum(String type) {

	    int n = 0;
	    Connection connexion = null;
	    PreparedStatement statement = null;
	    try {
	        connexion = daofactory.getConnection();
	        statement = connexion.prepareStatement("SELECT count(*) as volAvecViolance from personne_recherchee WHERE description LIKE ?");
			statement.setString(1,type);
	        ResultSet resultSet = statement.executeQuery();
	        if(resultSet.next()){
	            n = resultSet.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally{
	        try {
	            if(statement!=null) statement.close();
	            if(connexion!=null) connexion.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return n;
	}
	@Override
	public int getTendanceCrimesNum(int i) {
	    int n = 0;
	    Connection connexion = null;
	    PreparedStatement statement = null;
	    try {
	        connexion = daofactory.getConnection();
	        statement = connexion.prepareStatement("select count(*) from plainte_pr where EXTRACT(YEAR FROM dateDesFaits)=?");
			statement.setInt(1,i);
	        ResultSet resultSet = statement.executeQuery();
	        if(resultSet.next()){
	            n = resultSet.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally{
	        try {
	            if(statement!=null) statement.close();
	            if(connexion!=null) connexion.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return n;
	}
	public int getTendancePdNum(int i) {
	    int n = 0;
	    Connection connexion = null;
	    PreparedStatement statement = null;
	    try {
	        connexion = daofactory.getConnection();
	        statement = connexion.prepareStatement("select count(*) from personne_disparue where EXTRACT(YEAR FROM datedisparition)=?");
			statement.setInt(1,i);
	        ResultSet resultSet = statement.executeQuery();
	        if(resultSet.next()){
	            n = resultSet.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally{
	        try {
	            if(statement!=null) statement.close();
	            if(connexion!=null) connexion.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return n;
	}
	

}

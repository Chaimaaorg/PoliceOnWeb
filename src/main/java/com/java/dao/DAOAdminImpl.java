package com.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOAdminImpl implements DAOAdmin{
	private DAOFactory daofactory;
	public DAOAdminImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
	}
	public int getNum(String stat) {
	    int n = 0;
	    Connection connexion = null;
	    PreparedStatement statement = null;
	    try {
	        connexion = daofactory.getConnection();
	        statement = connexion.prepareStatement(stat);
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
	public int getNumUsers() {
			return getNum("SELECT count(*) FROM user");
		}

	@Override
	public int getNumPre() {
		return getNum("SELECT count(*) FROM personne_recherchee");
	}

	@Override
	public int getNumPdis() {
		return getNum("select count(*) from personne_disparue");

	}

	@Override
	public int getNumPlaintes() {
		return getNumPdis() + getNum("SELECT count(*) FROM plaintes_pr");
	}

}

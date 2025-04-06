package com.java.dao;
import java.util.List;

import com.java.beans.*;
public interface DAOUser 
{
	public List<User> getAllUsers();
	
	public void addUser(String CIN, String nom, String prenom, String adresse, String tel,String nationalite,String profession,java.sql.Date myDate,String lieunaissance,String sexe,String email,String mdp);
	
	public void deleteUser(String CIN);
	
	public void updateUser(String CIN,String nom,String prenom,String adresse,String tel,String email,String mdp);
	
	public List<User> findUser(String CIN);

	
	public User getUserByEmailAndPassword(String email,String mdp);
	

}


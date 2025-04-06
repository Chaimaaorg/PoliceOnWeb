package com.java.dao;

import java.time.LocalDateTime;
import java.util.List;

import com.java.beans.ObjetDisparu;

public interface DAOObjetDisparu {
	public List<ObjetDisparu > getAll();
	public void addObjetDisparu(LocalDateTime date,String lieu,String description,String photos);
	public void deleteObjetDisparu(int id_pni);
	public List<ObjetDisparu> findObjetDisparu(String id_obj);
}

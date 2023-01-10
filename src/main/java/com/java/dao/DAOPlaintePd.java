package com.java.dao;

import java.util.List;

import com.java.beans.PersonneDisparue;

public interface DAOPlaintePd {
	public List<PersonneDisparue> getAllPlaintesPd(String CINUser);
	public void addPlaintePd(String cin, String cIN_pd);

}

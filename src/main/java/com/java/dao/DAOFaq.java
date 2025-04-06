package com.java.dao;
import java.util.List;

import com.java.beans.*;
public interface DAOFaq
{
	public List<Faq> getAllFaqs();
	
	public void addFaq (String question, String response);
	
	public void deleteFaq (int id_faq);
	
	public void updateFaq (int id_Faq, String question, String response);
	
	public List<Faq> findFaq (String question);

	

}


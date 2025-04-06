package com.java.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import com.java.beans.PersonneDisparue;

	public class DAOPlaintePdImpl implements DAOPlaintePd {
	private DAOFactory daofactory;
	public DAOPlaintePdImpl(DAOFactory daofactory)
	{
		this.daofactory = daofactory;
		}
	public List<PersonneDisparue> getAllPlaintesPd(String CINUser) throws DAOException
	{		
		Connection connexion;
		ResultSet resultat;
		List<PersonneDisparue> listplainte = new ArrayList<PersonneDisparue>();
		PersonneDisparue pd;
		try {
			connexion = daofactory.getConnection();
			PreparedStatement statement = connexion.prepareStatement("SELECT CIN_pd,nom,prenom,datedisparition,lieudisparition,description,photos  FROM personne_disparue pd,plainte_pd plpd where plpd.id_pd=pd.CIN_pd AND id_user=?");
	    	statement.setString(1, CINUser);
			resultat = statement.executeQuery();
			while(resultat.next())
			{
				pd = map(resultat);
				listplainte.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return listplainte;
	}
	private PersonneDisparue map(ResultSet resultat) throws SQLException 
	{
        PersonneDisparue PersonneDisparuee = new PersonneDisparue();
        PersonneDisparuee.setCIN_pd(resultat.getString("CIN_pd"));
        PersonneDisparuee.setNom(resultat.getString("nom"));
        PersonneDisparuee.setPrenom(resultat.getString("prenom"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");        
        PersonneDisparuee.setDatedisparition(LocalDateTime.parse(resultat.getString("datedisparition"), formatter));        
        PersonneDisparuee.setLieudisparition(resultat.getString("lieudisparition"));
        PersonneDisparuee.setDescription(resultat.getString("description"));
        PersonneDisparuee.setPhotos(resultat.getString("photos"));
	return PersonneDisparuee;
	}

	@Override
	public void addPlaintePd(String cin, String cIN_pd) {
		Connection connexion ;
		PreparedStatement statement = null;
		try {
			connexion = daofactory.getConnection();
			statement = connexion.prepareStatement("INSERT INTO plainte_pd(id_user,id_pd) VALUES(?,?)");
			statement.setString(1,cin);
			statement.setString(2,cIN_pd);
			statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
}
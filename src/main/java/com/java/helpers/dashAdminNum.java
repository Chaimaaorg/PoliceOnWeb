package com.java.helpers;
import java.io.IOException;
import com.java.dao.DAOAdmin;
import com.java.dao.DAOCharts;
import com.java.dao.DAOFactory;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class dashAdminNum 
{
	public static void getInstance(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		DAOAdmin obj = DAOFactory.getInstance().getDAOAdmin();
		int NumUsers = obj.getNumUsers();
		int NumPre= obj.getNumPre();		
		int NumPdis = obj.getNumPdis();
		int NumPlaintes = obj.getNumPlaintes();		
		request.setAttribute("NumUsers", NumUsers);
		request.setAttribute("NumPre", NumPre);
		request.setAttribute("NumPdis", NumPdis);
		request.setAttribute("NumPlaintes", NumPlaintes);	
		
	}
	public static void getCharts(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		DAOCharts obj = DAOFactory.getInstance().getDAOCharts();
		int NumChartsTTAH = obj.getNumPlaintesRegion("Tanger");
		int NumChartsRSK = obj.getNumPlaintesRegion("Rabat");
		int NumChartsOR = obj.getNumPlaintesRegion("Oriental");
		int NumChartsFM = obj.getNumPlaintesRegion("Fes");
		int NumChartsBMK = obj.getNumPlaintesRegion("BeniMellal");
		int NumChartsCS = obj.getNumPlaintesRegion("Casablanca");
		int NumChartsMRS = obj.getNumPlaintesRegion("Marrakech");
		int NumChartsDT = obj.getNumPlaintesRegion("Tafilalet");
		int NumChartsSM = obj.getNumPlaintesRegion("Souss-Massa");
		int NumChartsGON = obj.getNumPlaintesRegion("Guelmim");
		int NumChartsLSH = obj.getNumPlaintesRegion("Laayoune");
		int NumChartsDOED = obj.getNumPlaintesRegion("Dakhla");
		request.setAttribute("NumChartsTTAH", NumChartsTTAH);
		request.setAttribute("NumChartsRSK", NumChartsRSK);
		request.setAttribute("NumChartsOR", NumChartsOR);
		request.setAttribute("NumChartsFM", NumChartsFM);
		request.setAttribute("NumChartsBMK", NumChartsBMK);
		request.setAttribute("NumChartsCS", NumChartsCS);
		request.setAttribute("NumChartsMRS", NumChartsMRS);
		request.setAttribute("NumChartsDT", NumChartsDT);
		request.setAttribute("NumChartsSM", NumChartsSM);
		request.setAttribute("NumChartsGON", NumChartsGON);
		request.setAttribute("NumChartsLSH", NumChartsLSH);
		request.setAttribute("NumChartsSM", NumChartsDOED);	
	}
	public static void getCrimesCharts(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		DAOCharts obj = DAOFactory.getInstance().getDAOCharts();
		int NumChartsTTAH2 = obj.getNumCrimesRegion("Tanger");
		int NumChartsRSK2 = obj.getNumCrimesRegion("Rabat");
		int NumChartsOR2 = obj.getNumCrimesRegion("Oriental");
		int NumChartsFM2 = obj.getNumCrimesRegion("Fes");
		int NumChartsBMK2 = obj.getNumCrimesRegion("BeniMellal");
		int NumChartsCS2 = obj.getNumCrimesRegion("Casablanca");
		int NumChartsMRS2 = obj.getNumCrimesRegion("Marrakech");
		int NumChartsDT2 = obj.getNumCrimesRegion("Tafilalet");
		int NumChartsSM2 = obj.getNumCrimesRegion("Souss-Massa");
		int NumChartsGON2 = obj.getNumCrimesRegion("Guelmim");
		int NumChartsLSH2 = obj.getNumCrimesRegion("Laayoune");
		int NumChartsDOED2 = obj.getNumCrimesRegion("Dakhla");
		request.setAttribute("NumChartsTTAH2", NumChartsTTAH2);
		request.setAttribute("NumChartsRSK2", NumChartsRSK2);
		request.setAttribute("NumChartsOR2", NumChartsOR2);
		request.setAttribute("NumChartsFM2", NumChartsFM2);
		request.setAttribute("NumChartsBMK2", NumChartsBMK2);
		request.setAttribute("NumChartsCS2", NumChartsCS2);
		request.setAttribute("NumChartsMRS2", NumChartsMRS2);
		request.setAttribute("NumChartsDT2", NumChartsDT2);
		request.setAttribute("NumChartsSM2", NumChartsSM2);
		request.setAttribute("NumChartsGON2", NumChartsGON2);
		request.setAttribute("NumChartsLSH2", NumChartsLSH2);
		request.setAttribute("NumChartsSM2", NumChartsDOED2);	
	}
	public static void getCrimesChartsTypes(HttpServletRequest request, HttpServletResponse response) {
		
		DAOCharts obj = DAOFactory.getInstance().getDAOCharts();
		int volTire = obj.getTypeCrimeNum("Vol à la tire");
		int volMain = obj.getTypeCrimeNum("Vol à main armée");
		int volViol = obj.getTypeCrimeNum("Vol avec violance");
		int aggression = obj.getTypeCrimeNum("Aggression");
		int assassinat = obj.getTypeCrimeNum("Assassinat");
		request.setAttribute("volTire", volTire);
		request.setAttribute("volMain", volMain);
		request.setAttribute("volViol", volViol);
		request.setAttribute("aggression", aggression);
		request.setAttribute("assassinat", assassinat);
	
	}
	public static void getTendanceCrimes(HttpServletRequest request, HttpServletResponse response) {
		DAOCharts obj = DAOFactory.getInstance().getDAOCharts();
		int NumCrimes17 = obj.getTendanceCrimesNum(2017);
		int NumCrimes18 = obj.getTendanceCrimesNum(2018);
		int NumCrimes19 = obj.getTendanceCrimesNum(2019);
		int NumCrimes20 = obj.getTendanceCrimesNum(2020);
		int NumCrimes21 = obj.getTendanceCrimesNum(2021);
		int NumCrimes22 = obj.getTendanceCrimesNum(2022);
		int NumCrimes23 = obj.getTendanceCrimesNum(2023);
		request.setAttribute("NumCrimes17", NumCrimes17);
		request.setAttribute("NumCrimes18", NumCrimes18);
		request.setAttribute("NumCrimes19", NumCrimes19);	
		request.setAttribute("NumCrimes20", NumCrimes20);	
		request.setAttribute("NumCrimes21", NumCrimes21);	
		request.setAttribute("NumCrimes22", NumCrimes22);
		request.setAttribute("NumCrimes23", NumCrimes23);	
		int NumPd17 = obj.getTendancePdNum(2017);	
		int NumPd18 = obj.getTendancePdNum(2018);		
		int NumPd19 = obj.getTendancePdNum(2019);		
		int NumPd20 = obj.getTendancePdNum(2020);		
		int NumPd21 = obj.getTendancePdNum(2021);		
		int NumPd22 = obj.getTendancePdNum(2022);		
		int NumPd23 = obj.getTendancePdNum(2023);
		request.setAttribute("NumPd17", NumPd17);
		request.setAttribute("NumPd18", NumPd18);		
		request.setAttribute("NumPd19", NumPd19);		
		request.setAttribute("NumPd20", NumPd20);		
		request.setAttribute("NumPd21", NumPd21);		
		request.setAttribute("NumPd22", NumPd22);
		request.setAttribute("NumPd23", NumPd23);		
		
	}

}

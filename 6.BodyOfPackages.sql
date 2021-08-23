create or replace package body dacovid as


 procedure countryWiseSort(id Country.cnId@site1 %TYPE) is
		
	   	
 begin
	
	    
		DBMS_OUTPUT.PUT_LINE('Country		Total Cases        Death		Total Tests        Transmission        ');
		DBMS_OUTPUT.PUT_LINE('________________________________________________________________________________');
		  for R in (select cnName, totalCases, death, totalTests,transmission from countryWise order by totalCases desc) loop
		  
		
			DBMS_OUTPUT.PUT_LINE(R.cnName||'		'||R.totalCases||'		'||R.death||'		'||R.totalTests||'		'||R.transmission||'		');
			
		  end loop;
 end countryWiseSort;
 
 
 
 
 
 procedure continentWiseGroup(id Country.cnId@site1 %TYPE) is
			
 begin
	
	   
		DBMS_OUTPUT.PUT_LINE('Continent		Total Cases');
		DBMS_OUTPUT.PUT_LINE('________________________________________________________________________________');
		
		  for R in (select continent, sum(totalCases) as totalCASE from continentWise group by continent) loop
				
			DBMS_OUTPUT.PUT_LINE(R.continent||'                     '||R.totalCASE||'		');
		  end loop;
		  
		  
		  exception
				when no_data_found then
					
					DBMS_OUTPUT.PUT_LINE('Data is not found');
		  
 end continentWiseGroup;
 
 
 procedure maleFemaleWiseDeathPer(id Gender.gnId@site1 %TYPE) is
 
  A   maleFemaleWise.totalDeathsMale%type;
  B   maleFemaleWise.death%type;
  C   maleFemaleWise.totalDeathsFemale%type;
  
			
 begin
	   
			select sum(totalDeathsMale),sum(death) into A,B from maleFemaleWise;
			dbms_output.put_line('MALE='||ROUND(((A/B)*100),2)||'%');
			
			select sum(totalDeathsFemale) into C from maleFemaleWise;
			dbms_output.put_line('FEMALE='||ROUND(((C/B)*100),2)||'%');
			
			
			exception
				when no_data_found then
					
					DBMS_OUTPUT.PUT_LINE('Data is not found');
					
					
					
				when ZERO_DIVIDE then
					
					DBMS_OUTPUT.PUT_LINE('Divide By Zero Exception');	
					
					
				
					
					
			
				 
 end maleFemaleWiseDeathPer;
 
 
 
 procedure TransmissionWiseCountryC(id Decision.dnId@site1 %TYPE) is


   CommunityTcnt number :=0;
   ClusterCcnt number:=0;
   OtheRcnt number:=0;

			
 begin
	
	   		
		  for R in (select * from TransmissionWise) loop
		        
		  
		       if R.transmission like 'Community Transmission' then
				    CommunityTcnt:=CommunityTcnt+1;
					
			   elsif 	R.transmission like 'Clusters of Cases' then
					ClusterCcnt:=ClusterCcnt+1;
					
			   else
                      				
				     OtheRcnt:=OtheRcnt+1;
			   end if;
				
			
		  end loop;
		  
		  dbms_output.put_line('Number of Countries with Community Transmission =  '||CommunityTcnt);
		  dbms_output.put_line('Number of Countries with Clusters of Cases =  '||ClusterCcnt);
		  dbms_output.put_line('Number of Countries with Other Transmission =  '||OtheRcnt);
		  
		  
		  exception
				when no_data_found then
					
					DBMS_OUTPUT.PUT_LINE('Data is not found');
		  
 end TransmissionWiseCountryC;
 
 
 
 
 
 
 procedure PopulationWiseTestRate(id Tests.testId@site1 %TYPE) is


   CommunityTcnt number :=0;
   ClusterCcnt number:=0;
   OtheRcnt number:=0;

			
 begin
	
	   		dbms_output.put_line('Countries Total Test Rate According to Population:');
			dbms_output.put_line('--------------------------------------------------');
		  for R in (select cnName, CAST(totalTests/population as float) as rate from PopulationWise) loop
		        
		          dbms_output.put_line(R.cnName||' = '||ROUND(R.rate,3)||'  ');
		       
				
			
		  end loop;
		  
		  exception
				when no_data_found then
					
					DBMS_OUTPUT.PUT_LINE('Data is not found');
					
					
					
		        when ZERO_DIVIDE then
					
					DBMS_OUTPUT.PUT_LINE('Divide By Zero Exception');
		  
		  
		  
 end PopulationWiseTestRate;
 
 
 
 
 
 
 function SingleCountryWiseInfo(id in Country.cnName@site1 %TYPE) return char is


 tTest integer:=0;  

			
 begin
	
	   		dbms_output.put_line('                   INFORMATION:               ');
			dbms_output.put_line('--------------------------------------------------');
		  for R in (select * from SingleCountryWise) loop
		        
		          if R.cnName=id then
				  
				     dbms_output.put_line('Population = '||R.population);
					 dbms_output.put_line('Continent = '||R.continent);
					 dbms_output.put_line('Total Cases = '||R.totalCases);
					 dbms_output.put_line('Deaths = '||R.death);
					 dbms_output.put_line('Recovered = '||R.recovered);	
					 dbms_output.put_line('Case Fatality Rate = '||R.caseFatalityRate);
                     dbms_output.put_line('Infection Fatality Rate = '||R.infectionFatalityRate);	
                     dbms_output.put_line('Transmission Type = '||R.transmission);					 
                     
					 
					 dbms_output.put('Total Tests = ');
					  tTest:=R.totalTests;
					 
					 
				  
				  end if;
		       
				
			
		  end loop;
		  return tTest;
		  
		  exception
				when no_data_found then
					
					DBMS_OUTPUT.PUT_LINE('Data is not found');
		  
		  
		  
		  
		 
		  
 end SingleCountryWiseInfo;
 
 
 
 
 
 procedure PredictWorldsCondition(id Predict2.pd2Id@site1 %TYPE) is


    TotalRows float :=0;
    GoodCount float:=0;
    BadCount float:=0;
  

			
 begin
 
              select count(*) into  TotalRows from Predict;
             select count(*) into  GoodCount from Predict where condition='GOOD';
             select count(*) into  BadCount from Predict where condition='BAD';
			 
			 
			 dbms_output.put_line('           Prediction             ');
			 dbms_output.put_line('___________________________________');
			 dbms_output.put_line('The Probability of the GOOD condition is:'||ROUND(GoodCount/TotalRows,2));
			 dbms_output.put_line('The Probability of the BAD condition is:'||ROUND(BadCount/TotalRows,2));
			 
	
	        if GoodCount/TotalRows  = BadCount/TotalRows  then
			
			  dbms_output.put_line('The condition of the world is EQUALLY LIKELY');
			  
			elsif  GoodCount/TotalRows > BadCount/TotalRows   then
			   dbms_output.put_line('The condition of the world is MORE LIKELY');
			   
			   
			elsif  GoodCount/TotalRows  < BadCount/TotalRows  then
			   dbms_output.put_line('The condition of the world is LESS LIKELY');
			   
			end if;
			
			exception
				when no_data_found then
					
					DBMS_OUTPUT.PUT_LINE('Data is not found');
					
					
					
				when ZERO_DIVIDE then
					
					DBMS_OUTPUT.PUT_LINE('Divide By Zero Exception');
					
		       
				
			
		  
			  
		  
		  
 end PredictWorldsCondition;
 
 
 
 procedure PredictWithNaiveBayes(id2 Predict2.pd2Id@site1 %TYPE) is


    TotalRows float :=0;
    GoodCount float:=0;
    BadCount float:=0;
	TransmissionRateGoodCount float :=0;
	TransmissionRateBadCount float :=0;
	WeatherGoodCount float:=0;
	WeatherBadCount float:=0;
  

			
 begin
 
              
              
              
			  select count(*) into  TotalRows from Predict;
			  select count(*) into  GoodCount from Predict where condition='GOOD';
			  
			  Select count(*) into TransmissionRateGoodCount from Predict where transmissionRate='LOW' and condition='GOOD';
			  Select count(*) into WeatherGoodCount from Predict where Temparature='HOT' and condition='GOOD';
			  
			  
			  select count(*) into  BadCount from Predict where condition='BAD';
			  
			  Select count(*) into TransmissionRateBadCount from Predict where transmissionRate='HIGH' and condition='BAD';
			  Select count(*) into WeatherBadCount from Predict where Temparature='COLD' and condition='BAD';
			 
			 
			 
			 dbms_output.put_line('           Prediction With Naive Bayes            ');
			 dbms_output.put_line('___________________________________');
			 dbms_output.put_line('The Probability of the GOOD condition is:'||ROUND(GoodCount/TotalRows,2));
			 dbms_output.put_line('The Probability of the BAD condition is:'||ROUND(BadCount/TotalRows,2));
			 
			 
			 
	         if GoodCount/TotalRows * TransmissionRateGoodCount/GoodCount * WeatherBadCount/GoodCount > BadCount/TotalRows * TransmissionRateBadCount/BadCount * WeatherBadCount/BadCount then
			          dbms_output.put_line('Condition=GOOD for the test data and the selected country is in good condition');
					  
					  
			 elsif GoodCount/TotalRows * TransmissionRateGoodCount/GoodCount * WeatherBadCount/GoodCount < BadCount/TotalRows * TransmissionRateBadCount/BadCount * WeatherBadCount/BadCount then
			          dbms_output.put_line('Condition=BAD for the test data and the selected country is in bad condition');		  
			 
			 
			 end if;
			 
			 exception
				when no_data_found then
					
					DBMS_OUTPUT.PUT_LINE('Data is not found');
					
					
					
				when ZERO_DIVIDE then
					
					DBMS_OUTPUT.PUT_LINE('Divide By Zero Exception');	
					
	
	
	        
			
		  
		  
 end PredictWithNaiveBayes;
 
 
 
 
  
end dacovid;
/




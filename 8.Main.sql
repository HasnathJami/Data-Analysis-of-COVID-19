set serveroutput on;
set verify off;

ACCEPT options NUMBER PROMPT 'Please Select Any Option: '
ACCEPT inp CHAR PROMPT 'Enter Any Country: '




declare
id Country.cnId@site1%TYPE;

options number:=&options;
inp Country.cnName@site1 %TYPE:='&inp';


store number;



begin
				 
	if options=1 then
		dacovid.countryWiseSort(id);
	elsif options=2 then
		dacovid.continentWiseGroup(id);	
	elsif options=3 then
	   dacovid.maleFemaleWiseDeathPer(id);
		
	elsif options=4 then
	    dacovid.TransmissionWiseCountryC(id);
		
	elsif options=5 then
	    dacovid.PopulationWiseTestRate(id);
		
	elsif options=6 then
	
	
	       
			     store:=dacovid.SingleCountryWiseInfo(inp);
                 dbms_output.put_line(store);
			  
			  
	    
	     
		 
 
	elsif options=7 then
		dacovid.PredictWorldsCondition(id);
		
		
	elsif options=8 then
		dacovid.PredictWithNaiveBayes(id);
	
	end if;			  
				  
		       
				

end;
/







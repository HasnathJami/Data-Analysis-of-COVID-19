create or replace package dacovid as

procedure countryWiseSort(id Country.cnId@site1 %TYPE);
procedure continentWiseGroup(id Country.cnId@site1 %TYPE);
procedure maleFemaleWiseDeathPer(id Gender.gnId@site1 %TYPE);
procedure TransmissionWiseCountryC(id Decision.dnId@site1 %TYPE);
procedure PopulationWiseTestRate(id Tests.testId@site1 %TYPE);
function  SingleCountryWiseInfo(id in Country.cnName@site1 %TYPE) return char;
procedure PredictWorldsCondition(id Predict2.pd2Id@site1 %TYPE);
procedure PredictWithNaiveBayes(id2 Predict2.pd2Id@site1 %TYPE);




end dacovid;
/
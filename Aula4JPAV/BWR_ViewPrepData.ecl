IMPORT $,STD;
//Browse raw input data
// OUTPUT($.File_Lending.File,NAMED('Lending'));
// COUNT($.File_Lending.File);
// Profiling the raw data
// OUTPUT(STD.DataPatterns.Benford($.File_Lending.File));
// OUTPUT(STD.DataPatterns.Profile($.File_Lending.File));
// Browse formatted input data
// OUTPUT($.Prep01.myDataE,NAMED('FormattedHousing'));
// COUNT($.Prep01.myDataE);
//Browse train data
// OUTPUT($.Prep01.myTrainData,NAMED('MyTrainData'));
//Browse standardized and converted train data
OUTPUT($.Convert02.myTrainAttrNF,NAMED('TrainAttributesNF'));
OUTPUT($.Convert02.myTrainDataSTD,NAMED('TrainAttributesSTD'));

 OUTPUT($.Convert02.MyAggs);

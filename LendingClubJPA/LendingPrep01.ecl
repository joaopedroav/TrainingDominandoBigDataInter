IMPORT $;

Lending := $.File_Lending.File;
LendingRelevant := $.File_Lending.LendingRelevant;

EXPORT LendingPrep01 := MODULE
  
  MLPropExt := RECORD(LendingRelevant)
    UNSIGNED4 rnd; // A random number
  END;

  // Clean the data and assign a random number to each record
  CleanFilter := Lending.emp_length <> '' AND Lending.emp_length = '10+ years' AND 
  Lending.mths_since_last_delinq > '24' AND Lending.acc_now_delinq <> '1';

//   CleanFilter := Property.zip <> '' AND Property.assessed_value <> 0 AND Property.year_acquired <> 0 AND 
//                  Property.land_square_footage <> 0 AND Property.living_square_feet <> 0 AND 
//                  Property.bedrooms <> 0 AND Property.year_Built <> 0;
							 
  EXPORT myDataE := PROJECT(Lending(CleanFilter), TRANSFORM(MLPropExt, 
                                                             SELF.rnd := RANDOM(),
                                                             SELF.allowed := 'yes',
                                                             SELF := LEFT));
																														 
  // Shuffle your data by sorting on the random field
  SHARED myDataES := SORT(myDataE, rnd);
  // Now cut the deck and you have random samples within each set
  // While you're at it, project back to your original format -- we dont need the rnd field anymore
  // Treat first 5000 as training data.  Transform back to the original format.
  EXPORT myTrainData := PROJECT(myDataES[1..5000], LendingRelevant);  
  // Treat next 2000 as test data
  EXPORT myTestData  := PROJECT(myDataES[5001..7000], LendingRelevant); 
END;

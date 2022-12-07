IMPORT $;

Lendings := $.File_Optimized.Dataset_optimized;
ML_Prop := $.File_Optimized.Lending_Relevant;

EXPORT LendingPrep01 := MODULE

  ML_Prop_Ext := RECORD (ML_Prop)
  UNSIGNED4 random_index;
  
END;

CleanFilter := Lendings.acc_now_delinq = 0 AND //doesn't have current debts 
               Lendings.delinq_2yrs = 0 AND //doesn't have debts in the past 2 years
               Lendings.emp_length IN [
                '2 years', 
                '3 years', 
                '4 years', 
                '5 years', 
                '6 years', 
                '7 years',
                '8 years',
                '9 years',
                '10 years',
                '10+ years'
               ] AND //have a job for over a year
               Lendings.home_ownership <> 'MORTGAGE' AND //doesn't have to pay mortage
               Lendings.loan_status = 'Fully Paid'; //doesn't have current lending

EXPORT myDataE := PROJECT (Lendings(CleanFilter), 
                           TRANSFORM(ML_Prop_Ext, 
                                     SELF.random_index := RANDOM(), 
                                     SELF := LEFT));

SHARED myDataEs := SORT(myDataE, random_index);
EXPORT myTrainData := PROJECT(myDataES[1..500000], ML_Prop);
EXPORT myTestData  := PROJECT(myDataES[500001..700000], ML_Prop);

END;
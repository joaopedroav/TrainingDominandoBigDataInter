IMPORT $, STD;

Lending   := $.File_Lending.File;
ML_Lending := $.File_Lending.MLLending;

EXPORT Prep01 := MODULE 

    EXPORT MLLendingExt := RECORD(ML_Lending)
        UNSIGNED4 rnd; // A random number
	END;

    // Format the data and assign a random number to each record
    MLLendingExt ML_Clean (Lending Le) := TRANSFORM
        SELF.rnd                   := RANDOM();
        SELF.acc_now_delinq        := (REAL)Le.acc_now_delinq;
        SELF.acc_open_past_24mths  := (REAL)Le.acc_open_past_24mths;
        SELF.all_util              := (REAL)Le.all_util;
        SELF.annual_inc            := (REAL)Le.annual_inc;
        SELF.delinq_2yrs           := (REAL)Le.delinq_2yrs;
        SELF.avg_cur_bal           := (REAL)Le.avg_cur_bal;
    END;

    EXPORT myDataE := PROJECT(Lending, ML_Clean(LEFT));
    SHARED myDataES := SORT(myDataE, rnd);
    EXPORT myTrainData := PROJECT(myDataES[1..5000], ML_Lending);
END;
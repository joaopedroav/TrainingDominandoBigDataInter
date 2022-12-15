IMPORT $;

Lending := $.File_Lending.File;
ML_Lend := $.File_Lending.MLLending;

EXPORT Prep01 := MODULE

    MLLendExt := RECORD(ML_Lend)
        UNSIGNED4 rnd; // A random number
    END;

    CleanFilter := Lending.acc_now_delinq = 0 AND Lending.acc_open_past_24mths > 0 AND Lending.delinq_2yrs = 0;

    EXPORT myDataE := PROJECT(Lending(CleanFilter), TRANSFORM(MLLendExt, 
                                                             SELF.rnd := RANDOM(),
                                                             SELF := LEFT));

    // Shuffle your data by sorting on the random field
    SHARED myDataES := SORT(myDataE, rnd);
    // Now cut the deck and you have random samples within each set
    // While you're at it, project back to your original format -- we dont need the rnd field anymore
    // Treat first 5000 as training data.  Transform back to the original format.
    EXPORT myTrainData := PROJECT(myDataES[1..5000], ML_Lend);
                                    
    // Treat next 2000 as test data
    EXPORT myTestData  := PROJECT(myDataES[5001..7000], ML_Lend);
END;

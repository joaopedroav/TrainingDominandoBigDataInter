IMPORT $;
IMPORT ML_Core;

myTrainData := $.Prep01.myTrainData;

//Add a sequential ID
ML_Core.AppendSeqId(myTrainData, recid, myTrainIDData); 

//Numeric Field Matrix conversion
ML_Core.ToField(myTrainIDData, myTrainIDDataNF);

EXPORT Convert02 := MODULE
    //Calculate basic statistics for the field values 
    EXPORT myAggs := ML_Core.FieldAggregates(myTrainIDDataNF).simple;

    //Function to standardize the field values 
    fSTD(REAL fieldval, UNSIGNED varnum):= (fieldval-myAggs(number=varnum)[1].mean)/myAggs(number=varnum)[1].sd;
    RECORDOF(myTrainIDData) ML_STD(myTrainIDData Le) := TRANSFORM
        //SELF.rnd                   := RANDOM();
        SELF.acc_now_delinq        := fSTD(Le.acc_now_delinq, 1);
        SELF.acc_open_past_24mths  := fSTD(Le.acc_open_past_24mths, 2);
        SELF.all_util              := fSTD(Le.all_util, 3);
        SELF.annual_inc            := fSTD(Le.annual_inc, 4);
        SELF.delinq_2yrs           := fSTD(Le.delinq_2yrs, 5);
        SELF.avg_cur_bal           := fSTD(Le.avg_cur_bal, 6);
        SELF                       := Le;
    END;

    //Project for value standardization
    EXPORT myTrainDataSTD := PROJECT(myTrainIDData,ML_STD(LEFT));
    
    //Numeric Field Matrix conversion for standardized values
	ML_Core.ToField(myTrainDataSTD,myTrainDataSTDNF);

    //We have 13 numeric attributes for clustering  
	EXPORT myTrainAttrNF := myTrainDataSTDNF(number < 7);
END;

IMPORT $;

// lending := $.File_Lending.File;

// OUTPUT(lending, NAMED('lending'));
// COUNT(lending);

// OUTPUT(lending, {emp_length, mths_since_last_delinq, acc_now_delinq}, NAMED('lending_relevant'));
/*
STRING emp_length;
        STRING mths_since_last_delinq;
        STRING acc_now_delinq;
*/
// isOwnership:= lending(home_ownership='OWN');
// OUTPUT(isOwnership, NAMED('Owned'));
// COUNT(isOwnership);

// isFromCalifornia := lending(addr_state='CA');
// OUTPUT(isFromCalifornia, NAMED('California'));
// COUNT(isFromCalifornia);

// isFromCaliforniaAndOwned := lending(addr_state='CA' AND home_ownership='OWN');
// OUTPUT(isFromCaliforniaAndOwned, NAMED('California_Owned'));
// COUNT(isFromCaliforniaAndOwned);

// isFromCACC := lending(addr_state='CA' AND home_ownership='OWN' AND purpose='credit_card');
// OUTPUT(isFromCACC, NAMED('California_Owned_Credit_Card'));
// COUNT(isFromCACC);

lending_optimized := $.File_Optimized.Dataset_optimized;
// OUTPUT(lending_optimized, { acc_now_delinq, avg_cur_bal, delinq_2yrs, emp_length, home_ownership, annual_inc, loan_status, total_bc_limit }, NAMED('test_machine_learning'));
OUTPUT(COUNT(lending_optimized), NAMED('all'));

OUTPUT($.LendingPrep01.myDataE, NAMED('aproved'));
COUNT($.LendingPrep01.myDataE);

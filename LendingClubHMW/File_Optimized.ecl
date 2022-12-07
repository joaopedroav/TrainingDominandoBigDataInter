﻿EXPORT File_Optimized := MODULE

EXPORT NewLayout := RECORD
    UNSIGNED3 field1;
    STRING40 id;
    UNSIGNED3 loan_amnt;
    UNSIGNED3 funded_amnt;
    REAL8 funded_amnt_inv;
    STRING9 term;
    STRING6 int_rate;
    REAL4 installment;
    STRING1 grade;
    STRING2 sub_grade;
    STRING78 emp_title;
    STRING9 emp_length;
    STRING8 home_ownership;
    REAL8 annual_inc;
    STRING15 verification_status;
    STRING8 issue_d;
    STRING51 loan_status;
    STRING1 pymnt_plan;
    STRING66 url;
    STRING18 purpose;
    STRING81 title;
    STRING5 zip_code;
    STRING2 addr_state;
    REAL4 dti;
    UNSIGNED1 delinq_2yrs;
    STRING8 earliest_cr_line;
    UNSIGNED2 fico_range_low;
    UNSIGNED2 fico_range_high;
    UNSIGNED1 inq_last_6mths;
    UNSIGNED2 mths_since_last_delinq;
    UNSIGNED2 mths_since_last_record;
    UNSIGNED2 open_acc;
    UNSIGNED1 pub_rec;
    UNSIGNED4 revol_bal;
    STRING6 revol_util;
    UNSIGNED2 total_acc;
    STRING1 initial_list_status;
    REAL8 out_prncp;
    REAL8 out_prncp_inv;
    REAL8 total_pymnt;
    REAL8 total_pymnt_inv;
    REAL8 total_rec_prncp;
    REAL8 total_rec_int;
    REAL8 total_rec_late_fee;
    REAL8 recoveries;
    REAL8 collection_recovery_fee;
    STRING8 last_pymnt_d;
    REAL8 last_pymnt_amnt;
    STRING8 next_pymnt_d;
    STRING8 last_credit_pull_d;
    UNSIGNED2 last_fico_range_high;
    UNSIGNED2 last_fico_range_low;
    UNSIGNED1 collections_12_mths_ex_med;
    UNSIGNED2 mths_since_last_major_derog;
    UNSIGNED1 policy_code;
    STRING10 application_type;
    REAL8 annual_inc_joint;
    REAL4 dti_joint;
    STRING15 verification_status_joint;
    UNSIGNED1 acc_now_delinq;
    UNSIGNED4 tot_coll_amt;
    UNSIGNED4 tot_cur_bal;
    UNSIGNED1 open_acc_6m;
    UNSIGNED1 open_act_il;
    UNSIGNED1 open_il_12m;
    UNSIGNED1 open_il_24m;
    UNSIGNED2 mths_since_rcnt_il;
    UNSIGNED4 total_bal_il;
    UNSIGNED2 il_util;
    UNSIGNED1 open_rv_12m;
    UNSIGNED1 open_rv_24m;
    UNSIGNED4 max_bal_bc;
    UNSIGNED2 all_util;
    UNSIGNED4 total_rev_hi_lim;
    UNSIGNED1 inq_fi;
    UNSIGNED2 total_cu_tl;
    UNSIGNED1 inq_last_12m;
    UNSIGNED1 acc_open_past_24mths;
    UNSIGNED3 avg_cur_bal;
    UNSIGNED3 bc_open_to_buy;
    REAL4 bc_util;
    UNSIGNED1 chargeoff_within_12_mths;
    UNSIGNED3 delinq_amnt;
    UNSIGNED2 mo_sin_old_il_acct;
    UNSIGNED2 mo_sin_old_rev_tl_op;
    UNSIGNED2 mo_sin_rcnt_rev_tl_op;
    UNSIGNED2 mo_sin_rcnt_tl;
    UNSIGNED1 mort_acc;
    UNSIGNED2 mths_since_recent_bc;
    UNSIGNED2 mths_since_recent_bc_dlq;
    UNSIGNED1 mths_since_recent_inq;
    UNSIGNED2 mths_since_recent_revol_delinq;
    UNSIGNED1 num_accts_ever_120_pd;
    UNSIGNED1 num_actv_bc_tl;
    UNSIGNED1 num_actv_rev_tl;
    UNSIGNED1 num_bc_sats;
    UNSIGNED1 num_bc_tl;
    UNSIGNED2 num_il_tl;
    UNSIGNED1 num_op_rev_tl;
    UNSIGNED2 num_rev_accts;
    UNSIGNED1 num_rev_tl_bal_gt_0;
    UNSIGNED2 num_sats;
    UNSIGNED1 num_tl_120dpd_2m;
    UNSIGNED1 num_tl_30dpd;
    UNSIGNED1 num_tl_90g_dpd_24m;
    UNSIGNED1 num_tl_op_past_12m;
    REAL4 pct_tl_nvr_dlq;
    REAL4 percent_bc_gt_75;
    UNSIGNED1 pub_rec_bankruptcies;
    UNSIGNED1 tax_liens;
    UNSIGNED4 tot_hi_cred_lim;
    UNSIGNED4 total_bal_ex_mort;
    UNSIGNED4 total_bc_limit;
    UNSIGNED4 total_il_high_credit_limit;
    UNSIGNED4 revol_bal_joint;
    UNSIGNED2 sec_app_fico_range_low;
    UNSIGNED2 sec_app_fico_range_high;
    STRING8 sec_app_earliest_cr_line;
    UNSIGNED1 sec_app_inq_last_6mths;
    UNSIGNED1 sec_app_mort_acc;
    UNSIGNED1 sec_app_open_acc;
    REAL4 sec_app_revol_util;
    UNSIGNED1 sec_app_open_act_il;
    UNSIGNED2 sec_app_num_rev_accts;
    UNSIGNED1 sec_app_chargeoff_within_12_mths;
    UNSIGNED1 sec_app_collections_12_mths_ex_med;
    STRING1 hardship_flag;
    STRING31 hardship_type;
    STRING21 hardship_reason;
    STRING9 hardship_status;
    UNSIGNED1 deferral_term;
    REAL4 hardship_amount;
    STRING8 hardship_start_date;
    STRING8 hardship_end_date;
    STRING8 payment_plan_start_date;
    UNSIGNED1 hardship_length;
    UNSIGNED1 hardship_dpd;
    STRING18 hardship_loan_status;
    REAL8 orig_projected_additional_accrued_interest;
    REAL8 hardship_payoff_balance_amount;
    REAL8 hardship_last_payment_amount;
    STRING1 debt_settlement_flag;
END;

EXPORT Dataset_optimized := DATASET('~tarefa::lendingclub::hmw::loan_status_2007-2020q3.csv',NewLayout,CSV(HEADING(1)));
   
END;
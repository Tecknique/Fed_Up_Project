#!/bin/bash
### creates a csv of each table, split into 500mb blocks
### gzip each block, partition the datafiels to respecive folders

find . -name "*.csv.gz" -type f -delete

mkdir agency
cd agency
psql -U root -d data_store_api -c \
"\COPY agency(id,create_date,update_date,toptier_flag,office_agency_id,subtier_agency_id,toptier_agency_id) \
 TO '/home/ubuntu/dump/agency/agency.csv' DELIMITER E'\x1f' CSV HEADER"
echo agency done
ls -lh
split -b 500MB -d agency.csv --additional-suffix=.csv
cd ..
gzip -r agency/

mkdir awards
cd awards
psql -U root -d data_store_api -c \
"\COPY awards(id,generated_unique_award_id,is_fpds,transaction_unique_id,type,type_description,uri,total_obligation,date_signed,description,awarding_agency_id,place_of_performance_id,recipient_id,category,fiscal_year,total_funding_amount,fpds_agency_id,fpds_parent_agency_id) \
 TO '/home/ubuntu/dump/awards/awards.csv' DELIMITER E'\x1f' CSV HEADER"
echo awards done
split -b 500MB -d awards.csv --additional-suffix=.csv
ls -lh
cd ..
gzip -r awards/

mkdir subaward
cd subaward
psql -U root -d data_store_api -c \
"\COPY subaward(id,subaward_number,amount,description,action_date,award_report_fy_month,award_report_fy_year,award_id,awarding_agency_id,cfda_id,award_type,internal_id,awarding_subtier_agency_abbreviation,awarding_subtier_agency_name,awarding_toptier_agency_abbreviation,awarding_toptier_agency_name,business_categories,cfda_number,cfda_title,keyword_ts_vector,latest_transaction_id,parent_recipient_unique_id,pop_city_code,pop_congressional_code,pop_county_code,pop_county_name,pop_state_code,prime_award_type,prime_recipient_name,recipient_location_congressional_code,recipient_location_county_code,recipient_location_county_name,recipient_location_state_code,recipient_name,recipient_name_ts_vector,recipient_unique_id,total_obl_bin,pop_city_name,recipient_location_city_name,parent_recipient_name,business_type_code,business_type_description,recipient_location_street_address) \
  TO '/home/ubuntu/dump/subaward/subaward.csv' DELIMITER E'\x1f' CSV HEADER"
echo subaward done
split -b 500MB -d subaward.csv --additional-suffix=.csv
ls -lh
cd ..
gzip -r subaward/

mkdir transaction_normalized
cd transaction_normalized
psql -U root -d data_store_api -c \
  "\COPY transaction_normalized(award_id,id,is_fpds,transaction_unique_id,generated_unique_award_id,type,type_description,period_of_performance_start_date,period_of_performance_current_end_date,action_date,action_type,action_type_description,
federal_action_obligation,description,fiscal_year,awarding_agency_id,place_of_performance_id,recipient_id,funding_amount) \
  TO '/home/ubuntu/dump/transaction_normalized/transaction_normalized.csv' DELIMITER E'\x1f' CSV HEADER"
echo transaction_normalized done
split -b 500MB -d transaction_normalized.csv --additional-suffix=.csv
ls -lh
cd ..
gzip -r transaction_normalized/

mkdir federal_account
cd federal_account
psql -U root -d data_store_api -c \
   "\COPY federal_account(id,agency_identifier,main_account_code,account_title,federal_account_code) \
    TO '/home/ubuntu/dump/federal_account/federal_account.csv' DELIMITER E'\x1f' CSV HEADER"
echo federal_account done
split -b 500MB -d federal_account.csv --additional-suffix=.csv
ls -lh
cd ..
gzip -r federal_account/

mkdir treasury_appropriation_account
cd treasury_appropriation_account
psql -U root -d data_store_api -c \
    "\COPY treasury_appropriation_account(treasury_account_identifier,tas_rendering_label,agency_id,beginning_period_of_availability,ending_period_of_availability,availability_type_code,availability_type_code_description,main_account_code,sub_account_code,account_title,reporting_agency_id,reporting_agency_name,budget_bureau_code,budget_bureau_name,fr_entity_code,fr_entity_description,budget_function_code,budget_function_title,budget_subfunction_code,budget_subfunction_title,federal_account_id,funding_toptier_agency_id) \
    TO '/home/ubuntu/dump/treasury_appropriation_account/treasury_appropriation_account.csv' DELIMITER E'\x1f' CSV HEADER"
echo treasury_appropriation_account done
split -b 500MB -d treasury_appropriation_account.csv --additional-suffix=.csv
ls -lh
cd ..
gzip -r treasury_appropriation_account/

mkdir legal_entity
cd legal_entity
psql -U root -d data_store_api -c \
    "\COPY legal_entity(legal_entity_id,is_fpds,transaction_unique_id,location_id,parent_recipient_unique_id,recipient_name,vendor_doing_as_business_name,business_types,business_types_description,business_categories,recipient_unique_id,limited_liability_corporation,sole_proprietorship,partnership_or_limited_liability_partnership,subchapter_scorporation,foundation,for_profit_organization,nonprofit_organization,corporate_entity_tax_exempt,corporate_entity_not_tax_exempt,other_not_for_profit_organization,sam_exception,city_local_government,county_local_government,inter_municipal_local_government,local_government_owned,municipality_local_government,school_district_local_government,township_local_government,us_state_government,us_federal_government,federal_agency,federally_funded_research_and_development_corp,us_tribal_government,foreign_government,community_developed_corporation_owned_firm,labor_surplus_area_firm,small_agricultural_cooperative,international_organization,us_government_entity,emerging_small_business,dot_certified_disadvantage,self_certified_small_disadvantaged_business,historically_underutilized_business_zone,small_disadvantaged_business,the_ability_one_program,historically_black_college,minority_institution,private_university_or_college,school_of_forestry,state_controlled_institution_of_higher_learning,tribal_college,veterinary_college,educational_institution,alaskan_native_servicing_institution,community_development_corporation,native_hawaiian_servicing_institution,domestic_shelter,manufacturer_of_goods,hospital_flag,veterinary_hospital,hispanic_servicing_institution,woman_owned_business,minority_owned_business,women_owned_small_business,economically_disadvantaged_women_owned_small_business,joint_venture_women_owned_small_business,joint_venture_economic_disadvantaged_women_owned_small_bus,veteran_owned_business,service_disabled_veteran_owned_business,contracts,grants,receives_contracts_and_grants,airport_authority,council_of_governments,housing_authorities_public_tribal,interstate_entity,planning_commission,port_authority,transit_authority,foreign_owned_and_located,american_indian_owned_business,alaskan_native_owned_corporation_or_firm,indian_tribe_federally_recognized,native_hawaiian_owned_business,tribally_owned_business,asian_pacific_american_owned_business,black_american_owned_business,hispanic_american_owned_business,native_american_owned_business,subcontinent_asian_asian_indian_american_owned_business,other_minority_owned_business,us_local_government,undefinitized_action,domestic_or_foreign_entity,domestic_or_foreign_entity_description,division_name,division_number,last_modified_date,certified_date,reporting_period_start,reporting_period_end,create_date,update_date,city_township_government,special_district_government,small_business,small_business_description,individual,parent_recipient_name) \
    TO '/home/ubuntu/dump/legal_entity/legal_entity.csv' DELIMITER E'\x1f' CSV HEADER"
echo legal_entity done
split -b 500MB -d legal_entity.csv --additional-suffix=.csv
ls -lh
cd ..
gzip -r legal_entity/


mkdir references_legalentityofficers
cd references_legalentityofficers
psql -U root -d data_store_api -c \
   "\COPY references_legalentityofficers(legal_entity_id,officer_1_name,officer_2_name,officer_3_name,officer_4_name,officer_5_name,officer_1_amount,officer_2_amount,officer_3_amount,officer_4_amount,officer_5_amount) \
    TO '/home/ubuntu/dump/references_legalentityofficers/references_legalentityofficers.csv' DELIMITER E'\x1f' CSV HEADER"
echo references_legalentityofficers done
split -b 500MB -d references_legalentityofficers.csv --additional-suffix=.csv
ls -lh
cd ..
gzip -r references_legalentityofficers/


mkdir ref_program_activity
cd ref_program_activity
psql -U root -d data_store_api -c  \
    "\COPY ref_program_activity(id,program_activity_code,program_activity_name,budget_year,responsible_agency_id,main_account_code,valid_begin_date,valid_end_date,valid_code_indicator) \
    TO '/home/ubuntu/dump/ref_program_activity/ref_program_activity.csv' DELIMITER E'\x1f' CSV HEADER"
echo ref_program_activity done
split -b 500MB -d ref_program_activity.csv --additional-suffix=.csv
ls -lh
cd ..
gzip -r ref_program_activity/


mkdir financial_accounts_by_awards
cd financial_accounts_by_awards
psql -U root -d data_store_api -c \
    "\COPY financial_accounts_by_awards(financial_accounts_by_awards_id,parent_award_id,fain,award_type,transaction_obligated_amount,reporting_period_start,reporting_period_end,award_id,object_class_id,program_activity_id,submission_id) \
    TO '/home/ubuntu/dump/financial_accounts_by_awards/financial_accounts_by_awards.csv' DELIMITER E'\x1f' CSV HEADER"
ls -lh
split -b 500MB -d  financial_accounts_by_awards.csv --additional-suffix=.csv
cd ..
gzip -r financial_accounts_by_awards/


mkdir references_cfda
cd references_cfda
psql -U root -d data_store_api -c \
    "\COPY references_cfda(id,program_number,program_title,popular_name,federal_agency,objectives,types_of_assistance,uses_and_use_restrictions,applicant_eligibility,beneficiary_eligibility,credentials_documentation,pre_application_coordination,application_procedures,award_procedure,deadlines,range_of_approval_disapproval_time,website_address,formula_and_matching_requirements,length_and_time_phasing_of_assistance,reports,audits,records,account_identification,obligations,range_and_average_of_financial_assistance,appeals,renewals,program_accomplishments,regulations_guidelines_and_literature,regional_or_local_office,headquarters_office,related_programs,examples_of_funded_projects,criteria_for_selecting_proposals,url,recovery,omb_agency_code,omb_bureau_code,published_date) \
    TO '/home/ubuntu/dump/references_cfda/references_cfda.csv' DELIMITER E'\x1f' CSV HEADER"
ls -lh
cd ..
gzip -r federal_account


mkdir references_location
cd references_location
psql -U root -d data_store_api -c \
    "\COPY references_location(location_id,state_code,state_name,city_name,county_name,county_code,congressional_code,zip_last4,last_modified_date,certified_date,create_date,update_date,data_source,place_of_performance_flag,recipient_flag,is_fpds,transaction_unique_id) \
    TO '/home/ubuntu/dump/references_location/references_location.csv' DELIMITER E'\x1f' CSV HEADER"
ls -lh
split -b 500MB -d references_location.csv --additional-suffix=.csv
cd ..
gzip -r references_location/



mkdir submission_attributes
cd submission_attributes
psql -U root -d data_store_api -c \
    "\COPY submission_attributes(submission_id,broker_submission_id,certified_date,cgac_code,reporting_period_start,reporting_period_end,reporting_fiscal_year,reporting_fiscal_quarter,reporting_fiscal_period,quarter_format_flag) \
    TO '/home/ubuntu/dump/submission_attributes/submission_attributes.csv' DELIMITER E'\x1f' CSV HEADER"
ls -lh
split -b 500MB -d submission_attributes.csv --additional-suffix=.csv
cd ..
gzip -r submission_attributes/


mkdir subtier_agency
cd subtier_agency
psql -U root -d data_store_api -c \
    "\COPY subtier_agency(subtier_agency_id,create_date,subtier_code,abbreviation,name) \
    TO '/home/ubuntu/dump/subtier_agency/subtier_agency.csv' DELIMITER E'\x1f' CSV HEADER"
    split -b 500MB -d subtier_agency.csv --additional-suffix=.csv
cd ..
gzip -r subtier_agency/


mkdir toptier_agency
cd toptier_agency
psql -U root -d data_store_api -c \
    "\COPY toptier_agency(toptier_agency_id,create_date,cgac_code,fpds_code,abbreviation,name,mission,website) \
    TO '/home/ubuntu/dump/toptier_agency/toptier_agency.csv' DELIMITER E'\x1f' CSV HEADER"
echo all done
ls -lh
split -b 500MB -d toptier_agency.csv --additional-suffix=.csv
cd ..
gzip -r toptier_agency/


#aws s3 cp . s3://usaspending-gov/csvgz/ --recursive --exclude "*" --include "*.csv.gz"

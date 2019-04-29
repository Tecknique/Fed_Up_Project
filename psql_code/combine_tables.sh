###
### Combime the legal_entity, awards. and references_location
### to be used for further aggregation and visualization
###


create table data_store_api.a_e_l_combined as
select
a.fiscal_year,
a.transaction_unique_id,
a.total_obligation,
a.state_code,
a.city_name,
a.county_name,
a.county_code,
        e.recipient_name,
        e.business_types,
        e.business_types_description,
        e.foundation,
        e.for_profit_organization,
        e.nonprofit_organization,
        e.corporate_entity_tax_exempt,
        e.corporate_entity_not_tax_exempt,
        e.municipality_local_government,
        e.us_state_government,
        e.us_federal_government,
        e.federal_agency,
        e.federally_funded_research_and_development_corp,
        e.emerging_small_business,
        e.small_disadvantaged_business,
        e.minority_institution,
        e.private_university_or_college,
        e.educational_institution,
        e.community_development_corporation,
        e.manufacturer_of_goods,
        e.woman_owned_business,
        e.minority_owned_business,
        e.women_owned_small_business,
        e.veteran_owned_business,
        e.interstate_entity,
        e.transit_authority,
        e.american_indian_owned_business,
        e.black_american_owned_business
 from data_store_api.unional2 as a
 join data_store_api.testentity2 as e
 on a.transaction_unique_id = e.transaction_unique_id;

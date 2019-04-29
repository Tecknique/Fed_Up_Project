###
### Creates a table that aggregates the legal_entity, references_location, and awards
### table for analysis in tableau. Without aggregation, the table has 77million rows
### tableau public profiles only allows for up to 15million rows
###

create table data_store_api.a_e_l_aggregate as
select fiscal_year,state_code,business_types_description,sum(total_obligation)
from data_store_api.a_e_l_combined
where fiscal_year is not null
group by fiscal_year,state_code,business_types_description
order by fiscal_year desc;

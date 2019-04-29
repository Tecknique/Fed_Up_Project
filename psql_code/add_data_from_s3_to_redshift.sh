###
###Adds all data into the redshift scehma
###

BEGIN;

copy data_store_api.agency
from 's3://usaspending-gov/db-split/agency/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.awards
from 's3://usaspending-gov/db-split/awards/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.subaward
from 's3://usaspending-gov/db-split/subaward/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.legal_entity
from 's3://usaspending-gov/db-split/legal_entity/legal_entity1/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.legal_entity
from 's3://usaspending-gov/db-split/agency/legal_entity2'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.legal_entity
from 's3://usaspending-gov/db-split/agency/legal_entity/legal_entity3/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.references_location
from 's3://usaspending-gov/db-split/references_location'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.references_cfda
from 's3://usaspending-gov/db-split/references_cfda/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.subtier_agency
from 's3://usaspending-gov/db-split/subtier_agency/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.toptier_agency
from 's3://usaspending-gov/db-split/toptier_agency/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.financial_accounts_by_awards
from 's3://usaspending-gov/db-split/agency/financial_accounts_by_awards/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.agency
from 's3://usaspending-gov/db-split/agency'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.ref_program_activity
from 's3://usaspending-gov/db-split/ref_program_activity/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.submission_attributes
from 's3://usaspending-gov/db-split/submission_attributes/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.references_legalentityofficers
from 's3://usaspending-gov/db-split/references_legalentityofficers'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.treasury_appropriation_account
from 's3://usaspending-gov/db-split/treasury_appropriation_account/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.federal_account
from 's3://usaspending-gov/db-split/federal_account/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

copy data_store_api.transaction_normalized
from 's3://usaspending-gov/db-split/transaction_normalized/'
iam_role 'arn:aws:iam::511409704243:role/myRedshiftRole'
DELIMITER '|'
CSV
gzip
IGNOREHEADER 1
removequotes
emptyasnull
Null as 'NaN'
blanksasnull
maxerror 1000;

COMMIT;

#aws s3 cp  s3://usaspending-gov/csvgz/ --recursive --exclude "*" --include "*.csv.gz"

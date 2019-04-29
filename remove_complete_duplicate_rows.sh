###
### 1) Removes all 100% completely similar rows
###    - identify which rows were entered in unison


BEGIN;

CREATE TEMP TABLE duplicateent as
SELECT transaction_unique_id
FROM data_store_api.testentity
GROUP BY transaction_unique_id
HAVING COUNT(*) > 1;


CREATE TEMP TABLE newtestent(LIKE data_store_api.testentity);
INSERT INTO newtestent
SELECT DISTINCT*
FROM data_store_api.testentity
WHERE testentity.transaction_unique_id IN(
     SELECT transaction_unique_id
     FROM duplicateent
);

DELETE FROM data_store_api.testentity
WHERE transaction_unique_id IN(
     SELECT transaction_unique_id
     FROM duplicateent
);

INSERT INTO data_store_api.testentity
SELECT *
FROM newtestent;


DROP TABLE duplicateent;
DROP TABLE newtestent;

COMMIT;

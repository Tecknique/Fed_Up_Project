# FedUp (Federal Up)

>The DATA Act (The Digital Accountability and Transparency Act) was passed in 2014. This act made it so past and present USA spending data would be available for the public to scrutinize. However, the database is very difficult to access without a very large amount of preprocessing. This data can be very beneficial for individuals and businesses because with proper analyzing, it could be used to identify what factors are played in recieving funds in the form of lucrative government grants. Fed up is a project created in the Insight 7-week long Data Engineering program that ingests, processes, and makes available the USA spending dataset for all to analyze with minimal processing.

## About

In order to get the dataset available to be taken advantage by in the public there are several pre processing steps that needs to be undertaken

* Postgres compatibility
    -Redshift doesn't support the restore of the Postgrsql image file because it only works in Postgres10
* Time frame
    -A fully restored dataset from USA spending is over a terabyte. With having to first restore it in postgresql 10, then dump it into csv's, then place them into 500 MB blocks and gzipping the result all in the ec2 instance takes some time and a deep understanding of cross compatability issues that could arise
* Parallel processing
    -In order to make sure the program runs at the most efficient speed, taking advantage of Redshift's elastic resize, or classic resize is very beneficial for given tasks. Splitting up the files into managable blocks that can be analyzed in parallel by multiple nodes ensures the most efficient runtime and output.
* Raw data is all human entered
    -There are many errors in the data that make it difficult to effectively have data move from postgresql 10, to csv, to Redshift
    -Having to use rare ascii bit character delimiter
    -Treating oversized cells programmatically
    -Assigning the right varibles
    -Primary and foreign key issues
    -Duplicate data with only one cell difference

[Presentation Slides](https://docs.google.com/presentation/d/1TyNB1u1OltjJN3w82YUiCP0-cOhZjgIrJ3dTmMIhP88/edit?usp=sharing)


## Introduction

This is an example of how the restored dataset can be used to make some impactful analysis for businesses or individuals

This visualizes how the government spends its money in forms of grants and contracts per year, by state

## Demo

[Demo](https://public.tableau.com/profile/james3162#!/vizhome/FedUpDataVisualization/Story1?publish=yes) 

## Dataset

This dataset is provided as a 51 GB gzipped postgresql image file that gzipped can be larger than 1 terabyte. There includes 57 different tables with over 800 columns

[Dataset from usaspending.gov](https://www.sec.gov/dera/data/edgar-log-file-data-set.html)


## Architecture

![Tech Stack]](https://github.com/Tecknique/Fed_Up_Project/blob/master/Fed_Up_Presentation.jpg)

* Download the data onto an EC2 Instance, unzip, restore, split, dump, zip, break up

* Send to s3 as storage

* Redshift ingest data, further process the data for compatability, perform aggregations

* Tableau vizualize data

* Tableau public publish visualizations

## Engineering Challenge

In order to get the dataset available to be taken advantage by in the public there are several pre processing steps that needs to be undertaken

* Postgres compatibility
    -Redshift doesn't support the restore of the Postgrsql image file because it only works in Postgres10
* Time frame
    -A fully restored dataset from USA spending is over a terabyte. With having to first restore it in postgresql 10, then dump it into csv's, then place them into 500 MB blocks and gzipping the result all in the ec2 instance takes some time and a deep understanding of cross compatability issues that could arise
* Parallel processing
    -In order to make sure the program runs at the most efficient speed, taking advantage of Redshift's elastic resize, or classic resize is very beneficial for given tasks. Splitting up the files into managable blocks that can be analyzed in parallel by multiple nodes ensures the most efficient runtime and output.
* Raw data is all human entered
    -There are many errors in the data that make it difficult to effectively have data move from postgresql 10, to csv, to Redshift
    -Having to use rare ascii bit character delimiter
    -Treating oversized cells programmatically
    -Assigning the right varibles
    -Primary and foreign key issues
    -Duplicate data with only one cell difference
* No valuable error messages
    -Error messages did not point in the right direction in Redshift
    -Some messages were appologetic

## Demo

[Demo](http://bit.ly/loginsightsdemo)

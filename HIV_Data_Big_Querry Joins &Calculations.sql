SELECT
*
FROM `hiv-data-analysis.HIV_DATA.ART_Children`;

#TOTAL PEOPLE LIVING WITH HIV INFECTIONS 
SELECT
SUM(Estimated_People_Living_With_HIV) AS Total_HIV_CASES
FROM `hiv-data-analysis.HIV_DATA.ARTcoverage_people`;

#INFECTIONS BY COUNTRY

CREATE OR REPLACE VIEW `hiv-data-analysis.HIV_DATA.VW_HIV_INFECTIONS_BY_COUNTRY` AS
SELECT
    country,
    Estimated_People_Living_With_HIV,
FROM `hiv-data-analysis.HIV_DATA.ARTcoverage_people`;

# DEATHS BY COUNTRY

CREATE OR REPLACE VIEW `hiv-data-analysis.HIV_DATA.VW_HIV_DEATHS_BY_COUNTRY` AS
SELECT
    country,
    Count,
FROM `hiv-data-analysis.HIV_DATA.Deaths`;

SELECT
*
FROM `hiv-data-analysis.HIV_DATA.Deaths`;

#HIV INFECTIONS VS ART COVERAGE 

CREATE OR REPLACE VIEW `hiv-data-analysis.HIV_DATA.VW_INFECTIONS_VS_ART_COVERAGE` AS
SELECT
    plh.country,
    plh.Estimated_People_Living_With_HIV,
    artp.ART_Coverage AS ART_Coverage
FROM `hiv-data-analysis.HIV_DATA.ARTcoverage_people` plh
LEFT JOIN `hiv-data-analysis.HIV_DATA.ARTcoverage_people` artp
       ON plh.country = artp.country;

#PMTCT ART COVERAGE (MOTHERS NEEDING ART VS RECEIVED ART)
CREATE OR REPLACE VIEW `hiv-data-analysis.HIV_DATA.VW_MOTHERS_NEEDING_VS_ART_COVERAGE` AS
SELECT
    country,
    needing_art,
    received_art,
FROM `hiv-data-analysis.HIV_DATA.PMTCT`;

#TABLE JOINS

FROM `hiv-data-analysis.HIV_DATA.countries` c
LEFT JOIN `hiv-data-analysis.HIV_DATA.people_living_with_hiv` plh
      ON c.country = plh.country
LEFT JOIN `hiv-data-analysis.HIV_DATA.Deaths` d
      ON c.country = d.country
LEFT JOIN `hiv-data-analysis.HIV_DATA.ARTcoverage_people` artp
      ON c.country = artp.country
LEFT JOIN `hiv-data-analysis.HIV_DATA.ART_Children` artc
      ON c.country = artc.country
LEFT JOIN `hiv-data-analysis.HIV_DATA.PMTCT` pm
      ON c.country = pm.country;
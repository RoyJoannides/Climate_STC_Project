Guide To the analysis of Climate Change and Animal prduct selling prices DataSets:

Hypothesis 1: Global Temperature Trend
Null Hypothesis (H0): There is no significant change in global surface temperatures over the years.
Alternative Hypothesis (H1): There is a significant upward or downward trend in global surface temperatures.
Justification: Analyzing the overall trend in global temperatures will help us understand the direction and magnitude of changes over the years, providing valuable insights into the broader climate patterns.

Hypothesis 2: Regional Variation in Temperature Changes
Null Hypothesis (H0): There is no significant difference in temperature changes across countries.
Alternative Hypothesis (H1): There are significant regional variations in surface temperature changes.
Justification: Investigating regional differences can aid in identifying specific areas that might be more susceptible to climate change, guiding targeted interventions and policies.



Hypothesis 3: Correlation between sellin prices of animal products and Temperature Changes
Null Hypothesis (H0): There is no correlation between a country's animal products' selling prices and surface temperature changes.
Alternative Hypothesis (H1): There is a significant correlation between a animal products' selling prices and surface temperature changes.
Justification: The increase in selling prices of animal products in Europe may also represent an indirect consequence of warmer temperatures. The increase in prices might be increased due to, among other factors, increased production costs due to extreme weather events or water scarcity.

Business Use Cases:

Environmental Policy Planning:Objective: Develop data-driven recommendations for environmental policies.Actions: Identify countries or regions with the most significant temperature changes. Propose targeted policies to mitigate adverse effects and promote sustainable practices.

Entities and Attributes:


Countries:
Attributes: CountryID (INT AI Primary Key), 
country_name (varchar)

Subregions:
Attributes: subregionID (INT AI Primary Key), 
subregion_name (varchar)

Years:
year_id (int AI Primary Key) 
year_category (varchar)

Temperature_Changes:
Attributes: temperature_id (int AI Primary Key),
country (varchar )
years (varchar) 
Temperature (float) 
year_id (int, Foreign Key)
subregion_id (int, Foreign Key)

Animal_prices:
Attibutes: price_id (INT AI Primary Key) 
subregions (varchar) 
years (varchar) -> years ranges
animal_price (float) 
year_id (int, Foreign Key)
subregion_id (int, Foreign Key)


Env_policies (Environmental Policies):
Attributes: policy_ID (int AI Primary Key)
policy_description (varchar)
subregion_id (int, Foreign Key)


Relations between Entities:

One-to-Many relationship between Subregions and Temperature_Changes.

One-to-Many relationship between Subregions and Animal_prices.

Many-to-Many relationship between Subregions and Environmental_Policies.

Many-to-Many relationship between Subregions and Years


Jupyter Notebook was employed to clean, tranform and format the data from three databases: Climate Change (from Kaggle), Animal products selling prices from 2000 to 2022 (from Eurostat) and Animal products selling prices from 1969 to 2005 (from Eurostat).
Python and Pandas library, together with numpy, matplotlib and seaborn were used to analyse the databases and create plots for data visualization.

A presentation of the data analysis can be found here : https://www.canva.com/design/DAF_kNmLiL0/D287kMB_A5EUaHIZukoVZg/edit
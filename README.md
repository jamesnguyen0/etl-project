# etl-project notes

Source of data: 
  -Basketball Reference (https://www.basketball-reference.com/)
Types of transformation needed for this data:
  -cleaning
  -joining
  -filtering
Type of final production database to load the data into:
  -relational
Final tables:
  -mvp_data.csv
  -roty_data.csv
  -contracts.csv

Final Report:
  -Extract: your original data sources and how the data was formatted (CSV, JSON, pgAdmin 4, etc)
    --We downloaded player statistics from Basketball Reference in the form of .xls files.
  -Transform: what data cleaning or transformation was required.
    --For the Rookie of the Year information, we used Python to load all of the information into a dataframe. We used the notebook to format the following fields:
          *Age: split year age from day age
          *MP: split minutes:seconds:milliseconds into separate columns, then calculated total seconds played for later use
    --We then exported the cleaned data into roty_data.csv.
    --For the Most Valuable Player information, we loaded all of the information into a single csv and performed the same formatting. We also added a Season column for later      
      merging.
    --For the contract information, we downloaded the players' contract values per year into a single csv.
    --PostgresSQL was used to upload all of the csv files and merge mvp_data and roty_data with the contracts in order to get one single table for each with stats and contract 
      values. After performing the initial merge for the MVP data, we realized that the merge was duplicating rows due to players winning multiple MVP titles within the chosen 
      time range. In order to ensure the correct merges, we merged the tables on player_name and season.
  -Load: the final database, tables/collections, and why this was chosen
    --The final database was created on Postgres because it was the easiest way to load and display our data for later manipulation. 

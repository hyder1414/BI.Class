# BI.Class
ISQS 3349- Spring 2020 
Covers Skills, methodologies, and knowledge for data management with Business Intelligence techniques such as dimensional data modeling, data warehousing, and OLAP. 

Background & Overview
• Create databases using the relational approach
• Write advanced reporting SQL commands to query existing databases
• Identify and describe the different phases of the data warehouse life-cycle
• Compare and contrast data warehouse architectures
Design
• Design dimensional model databases from multiple data sources
• Design and create dimensional models that are easily consumed by end users
• Implement ETL methodologies that can handle change over time using a variety of approaches
based on business requirements
• Design ETL programs that can run automated for data acquisition based on business
requirements
Acquisition
• Identify and describe the components of an ETL system
• Design and implement ETL processes based on data source(s) and OLAP design
• Identify and evaluate the viability of disparate datasets


 
          ----------------------------------------------------------------
          
### one of the Featured Project 

OLAP Design, Database Population and .csv ETL’s, and Business Question Answer

### OLAP Design:

Granularity:
•	Tracking individual shipments and insurance costs of those shipments every day
<img width="834" alt="Screen Shot 2020-09-14 at 3 54 08 AM" src="https://user-images.githubusercontent.com/34618387/93066490-b055b180-f63f-11ea-8e1e-98cb0d0236cd.png">


### ETL’s:

•	All under a single job, separated into two png’s.

Database Population:
<img width="838" alt="Screen Shot 2020-09-14 at 3 54 30 AM" src="https://user-images.githubusercontent.com/34618387/93066500-b2b80b80-f63f-11ea-8643-5101bf0f68ee.png">


<img width="837" alt="Screen Shot 2020-09-14 at 3 54 36 AM" src="https://user-images.githubusercontent.com/34618387/93066508-b350a200-f63f-11ea-9a58-fc7393b64691.png">


### Business Question:

Should a new insurance cost method that utilizes overall region costs, rather than the highest cost between the two stores of a shipment, be utilized to gain better profits?

In a short answer: yes!





<img width="831" alt="Screen Shot 2020-09-14 at 3 54 46 AM" src="https://user-images.githubusercontent.com/34618387/93066509-b3e93880-f63f-11ea-9e45-50cca760afce.png">



If you look at the screenshot above, you will see four columns.  These columns were added to the ‘all_data’ csv output.  We used this output because it incorporates any calculation information we need to compute the new metric and has all one-thousand shipments (hence ‘all data’).  The first column is ‘Total_Value’, which represents the current way of assigning insurance cost.  The second column, ‘Total_V_NEW_Metric’, represents the proposed way of assigning insurance cost.  These metrics measure the amount of profit gained by each method (revenue of shipment minus costs associated with shipment).  The third column shows the resulting profit gain or loss per shipments when utilizing the new method versus the old method.  The last column, ‘Result’, labels each shipment as ‘Wahoo!’ , which means a profit resulted, or ‘Doh!’ , which inversely means that an overall cost resulted if the new metric was to be utilized.

According to the highlighted section, only about 23% of all the shipments in this dataset would have had an overall result of a cost rather than a profit.  78% of all the shipments resulted in more profit.  It is interesting to see that Region #1 experienced less dramatic results, and this is most likely due to that region experiencing the highest estimated insurance cost.  Inversely, the estimated insurance cost of Region #3 was dramatically lower (>$1), which caused the lack of ‘Doh’s!’.

Overall, with this specific dataset of shipments, the company could have netted an additional $5,615.50 if they would have utilized the regional insurance cost rather than the larger insurance cost per shipment. 


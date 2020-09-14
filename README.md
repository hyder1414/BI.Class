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





           ----------------------------------------------------------------

### one of the Featured InClass Assignment



<img width="680" alt="Screen Shot 2020-09-14 at 4 14 53 AM" src="https://user-images.githubusercontent.com/34618387/93067474-e21b4800-f640-11ea-9227-8760eafedaab.png">


#### 2.SQL queries 

1.	select distinct concat(FirstName, ‘ ‘, LastName) as Professor_Name 
from person_dim pd 
inner join schedule_fact sf on pd.person_dk = sf.student_dk 
where person_dk in (select professor_dk from schedule_fact); 
 


#### 2.	select concat(SemesterName, ‘ ‘, sem_year) as Semester, 
(count(course_dk)/count(distinct(student_dk))) as AvgCoursesTaken 
from schedule_fact sf, semester_dim sd 
where sf.semester_dk = sd.semester_dk 
group by Semester; 
 
#### 3.	select sf.loc_dk, concat(sd.SemesterName, ‘ ‘, sd.sem_year) as Semester, 
(sum(sf.cnt)/ld.SeatCapacity) as RoomUtilization, 
ld.RoomCode, ld.BuildingName 
from schedule_fact sf 
inner join location_dim ld on sf.loc_dk = ld.loc_dk 
Inner join semester_dim sd on sf.semester_dk = sd.semester_dk 
group by sf.loc_dk, Semester, ld.BuildingName, ld.RoomCode 
order by Semester; 
 
#### 3.	Statement of Granularity for the fact tables 
One row per individual student performance rating in each course taken every semester. 
 
 
#### 4.	Statement of Dimensional History applied to each dimension table 
Type 0: N/A 
Type 1: student_junk_dim, professor_junk_dim, person_junk_dim 
Type 2: camp_buil_room_dim, person_dim, course_dim 
Type 3: N/A 



     --------------------------------------------------------------------




<img width="530" alt="Screen Shot 2020-09-14 at 4 19 21 AM" src="https://user-images.githubusercontent.com/34618387/93068002-89987a80-f641-11ea-8467-2b5a674de613.png">
<img width="533" alt="Screen Shot 2020-09-14 at 4 19 30 AM" src="https://user-images.githubusercontent.com/34618387/93068007-8b623e00-f641-11ea-965a-540c2d137fb4.png">


<img width="870" alt="Screen Shot 2020-09-14 at 4 23 04 AM" src="https://user-images.githubusercontent.com/34618387/93068503-3115ad00-f642-11ea-9940-f266483df2c9.png">
<img width="786" alt="Screen Shot 2020-09-14 at 4 23 26 AM" src="https://user-images.githubusercontent.com/34618387/93068509-3246da00-f642-11ea-8502-2f12d2078979.png">
<img width="815" alt="Screen Shot 2020-09-14 at 4 23 50 AM" src="https://user-images.githubusercontent.com/34618387/93068515-34109d80-f642-11ea-91d0-4a1619a87129.png">



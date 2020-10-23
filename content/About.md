#### About RUSP_AaBC

Timing of blood spot collection is important for accurately interpreting newborn screening test results. The application shows the dynamic changes in newborn metabolism in relation to different age at blood collection (AaBC) period. Users can view and compare the changes of an individual or a combination of metabolites within or across different clinical variable groups, including birth weight (BW), gestational age (GA), race/ethnicity, sex, and total parenteral nutrition (TPN). 
The purpose of the application is to visualize the differences of metabolite levels of dried blood samples collected at different times after birth and to offer suggestions for adjusting cutoff values to achieve better testing results.

#### Instructions

Click `Analytes` to view the changes of a selected individual or a combination of metabolites (e.g. C3+C2) and click `Ratios` to view the changes of a metabolite ratio (e.g. C3/C2) within or across different clinical variable groups in relation to AaBC. The comparisons across different groups could be viewed by first choosing one of the parameters under the ’select comparing groups’ menu, and then choose the sub-divided groups from the upper menu for that parameter. 
The boxplot shows the concrete changes of the metabolite level(s)/ratio in three different AaBC groups: 12-23 hours, 24-48 hours, and 49-72 hours, respectively. The smoothed line graph indicates the changes of the mean of the metabolite level(s)/ratio across AaBC. The shading area shows the 95% confidence interval of the mean. 

#### Data

Data from 500,000 screen-negative singleton infants born between 2013 and 2017 were selected at random by the California NBS program that included metabolic analytes measured by MS/MS as well as BW, GA, sex, race/ethnicity, AaBC, and TPN. The California Department of Public Health is not responsible for the results or conclusions drawn by the authors of this publication.

#### Code

All the RUSPtools websites are built with <a href="http://www.r-project.org" target="_blank">R</a> and the <a href="http://shiny.rstudio.com" target="_blank">Shiny framework</a> and the source code are publicly available at GitHub(TBA). 




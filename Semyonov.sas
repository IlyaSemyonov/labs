TITLE KR-1,Semyonov,IS-M20,Variant 4;
TITLE "PROC RANK, PROC PRINT";
proc rank data=sashelp.iris descending out=rankings;
   var SepalLength;
   ranks R_SepalLength;
run;
proc sort data=rankings;
by SepalLength;
run;
options OBS=9;
proc print data=rankings;
run;
title "Расчет MEAN, STD, N, MAX, MIN";
proc means data=sashelp.iris;
class species;
var SepalLength;
run;
proc means data=sashelp.iris;
class species;
var PetalLength;
run;
proc means data=sashelp.iris;
class species;
var PetalWidth;
run;
proc summary data = sashelp.iris print;
 class species;
 var SepalLength PetalLength PetalWidth;
 run;
title "Корреляции Пирсона и Спирмена"; 
 proc corr data = sashelp.iris spearman pearson plots = matrix;
var SEPALLENGTH PETALLENGTH SEPALWIDTH PETALWIDTH;
run;
title "Ящик с усами";
ods graphics on;
proc boxplot data=sashelp.iris;
   plot SEPALLENGTH*Species / boxstyle = POINTS
                     outbox   = POINTS;
run;
proc boxplot data=sashelp.iris;
   plot PETALLENGTH*Species / boxstyle = POINTS
                     outbox   = POINTS;
/*Не придумал другого решения */
run;
  
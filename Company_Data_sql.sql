create database company_data;
use company_data;

select* from company_data;

-- avg sales or shelveloc 
select Shelveloc,round(avg(Sales),2) as avg_sales
from company_data group by Shelveloc order by avg_sales desc;

-- prie affect in high , medium , low 
select case when Price < 100 then "low price" when Price between 100 and 130 then "medium price "
else "high price " 
end as price_category,
round(avg(Sales),2)as avg_sales 
from company_data
group by price_category;

-- advertising spend

select case when Advertising >= 10 then "high advertsing " else "low advertising"
end as ad_level,
round(avg(Sales),2) as avg_sales
from company_data
group by ad_level;

-- urban vs no-urban sales 
select Urban, round(avg(Sales),2) as avg_sales
from company_data
group by Urban;

-- Us  vs non-us sales perfomance
select US, round(avg(Sales),2) as avg_sales
from company_data
group by US;

-- age group generates higher sales
select case when Age<= 30 then "young " when Age between 30 and 50 then "middle age"else "senior"
end as age_group,
round(avg(Sales),2) as avg_sales
from company_data
group by age_group;

-- top 5 highest selling records
select * from company_data
order by Sales desc limit 5;

-- competitor price check 
select case when CompPrice >= 130 then "high competitor price " else "low competitor price"
end as competitor_price_level,
round(avg(Sales),2) as avg_sales
from company_data
group by competitor_price_level ;

-- Shelf location + advertising impact
select case when Advertising >= 10 then "high advertsing " else "low advertising"
end as ad_level,
round(avg(Sales),2) as avg_sales
from company_data
group by  Shelveloc ,ad_level
order by avg_sales desc;

select *from company_data
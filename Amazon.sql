select *
From dbo.supermarket
Select invoice_ID, gender ,                                                                                                                                                                                                                                                                                                                                                                                                                                                          
     CASE WHEN Customer_type = 'Member' Then 'Membership Card'
          WHEN Customer_type= 'Normal' Then 'No Membership Card'
	      ELSE NULL END  as Card
FROM dbo.supermarket;

/* Sales Category by Gender */
Select Distinct gender, AVG(total) AS Average_Sales,
        CASE WHEN gender ='Female' THEN SUM(total)
		     WHEN gender = 'male' THEN  SUM(total)
			 ELSE NULL END AS Sales_per_gender
FROM dbo.supermarket
Group by gender

/* Profitability Analysis*/
SELECT DISTINCT Product_line
FROM dbo.supermarket

Select Distinct Product_line, MIN(gross_income) as min_gross_income, MAX(gross_income) as max_gross_income
 FROM dbo.supermarket
 Group by Product_Line

 /*Tax Revenue Analysis */
 Select Distinct Product_line, AVG(total),
     CASE WHEN Product_line ='Fashion accesories' then SUM(Tax_5)
	      WHEN Product_line = 'Health and Beauty' then SUM(Tax_5)
		  WHEN Product_line ='Electronic Accessories' then SUM(Tax_5)
		  WHEN Product_line = 'Food and beverages' then SUM(Tax_5)
		  WHEN Product_line = 'Sports and travel' then SUM(Tax_5)
		  WHEN Product_line ='Home and lifestyle' then SUM(Tax_5)
		  END AS Tax_Revenue
FROM dbo.supermarket
Group by Product_line
    
     

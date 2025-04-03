SELECT
 $__timeEpoch([Datetime]),
    [Province],
    [City],
    sum([L2300F Traffic (Erlang)])AS TDD_Volte,
    sum([L2600F Traffic (Erlang)]+[L1800F Traffic (Erlang)]+[L2100F Traffic (Erlang)]+[L900F Traffic (Erlang)]) AS FDD_Volte,
    case 
				when 
				sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])= 0 then null else
                    sum([L2300F Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) end AS TDD_Volte_Percentage,
    case 
				when 
				sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])= 0 then null else
                    sum([L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS FDD_Volte_Percentage
from
    (select
        [Datetime],
        [Site],
        [Vendor],
        [Contractor],
         [Province],
    [City],
        isnull([L2300F3 Traffic (Erlang)],0)+isnull([L2300F2 Traffic (Erlang)],0)+isnull([L2300F1 Traffic (Erlang)],0) 
                                                                                              as [L2300F Traffic (Erlang)],
        isnull([L2600F1 Traffic (Erlang)],0)+isnull([L2600F2 Traffic (Erlang)],0) as [L2600F Traffic (Erlang)],
        isnull([L1800F1 Traffic (Erlang)],0)+isnull([L1800F2 Traffic (Erlang)],0) as [L1800F Traffic (Erlang)],
        isnull([L2100F1 Traffic (Erlang)],0)+isnull([L2100F2 Traffic (Erlang)],0) as [L2100F Traffic (Erlang)],
        isnull([L900F1 Traffic (Erlang)],0)+isnull([L900F2 Traffic (Erlang)],0)   as [L900F Traffic (Erlang)],




        isnull([L2600F1 Traffic (Erlang)],0)[L2600F1 Traffic (Erlang)],
        isnull([L2600F2 Traffic (Erlang)],0)[L2600F2 Traffic (Erlang)],
        isnull([L1800F1 Traffic (Erlang)],0)[L1800F1 Traffic (Erlang)],
        isnull([L1800F2 Traffic (Erlang)],0)[L1800F2 Traffic (Erlang)],
        isnull([L2100F1 Traffic (Erlang)],0)[L2100F1 Traffic (Erlang)],
        isnull([L2100F2 Traffic (Erlang)],0)[L2100F2 Traffic (Erlang)],
        isnull([L2300F1 Traffic (Erlang)],0)[L2300F1 Traffic (Erlang)],
        isnull([L2300F2 Traffic (Erlang)],0)[L2300F2 Traffic (Erlang)],
        isnull([L2300F3 Traffic (Erlang)],0)[L2300F3 Traffic (Erlang)],
        isnull([L900F1 Traffic (Erlang)],0)[L900F1 Traffic (Erlang)],
        isnull([L900F2 Traffic (Erlang)],0)[L900F2 Traffic (Erlang)]
from sa_site_traffic_sharing
    where cast([Datetime] as date) >=GetDATE()-90 and [Province] in ('ALborz')
)TBL
WHERE
  $__timeFilter([Datetime])
group by [Datetime],
          [Province],
    [City]
order by [Datetime]



------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT
    [Datetime],

    [Province],
    -- sum([L2600F1 Traffic (Erlang)])[L2600F1 Traffic (Erlang)],
    -- sum([L2600F2 Traffic (Erlang)])[L2600F2 Traffic (Erlang)],
    -- sum([L1800F1 Traffic (Erlang)])[L1800F1 Traffic (Erlang)],
    -- sum([L1800F2 Traffic (Erlang)])[L1800F2 Traffic (Erlang)],
    -- sum([L2100F1 Traffic (Erlang)])[L2100F1 Traffic (Erlang)],
    -- sum([L2100F2 Traffic (Erlang)])[L2100F2 Traffic (Erlang)],
    -- sum([L2300F1 Traffic (Erlang)])[L2300F1 Traffic (Erlang)],
    -- sum([L2300F2 Traffic (Erlang)])[L2300F2 Traffic (Erlang)],
    -- sum([L900F1 Traffic (Erlang)])[L900F1 Traffic (Erlang)],
    sum([L2300F Traffic (Erlang)])[L2300F Traffic (Erlang)],
    sum([L2600F Traffic (Erlang)])[L2600F Traffic (Erlang)],
    sum([L1800F Traffic (Erlang)])[L1800F Traffic (Erlang)],
    sum([L2100F Traffic (Erlang)])[L2100F Traffic (Erlang)],
    sum([L900F Traffic (Erlang)])[L900F Traffic (Erlang)],

    case 
				   when
				 sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then null else
				   
				   
				   
				  100* sum([L2300F Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) end AS L2300F_Traffic_Erlang_Volte_Percentage,
    case 
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L2600F Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L2600F_Traffic_Erlang_Volte_Percentage,
    case 
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L1800F Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L1800F_Traffic_Erlang_Volte_Percentage,
    case 
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L2100F Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L2100F_Traffic_Erlang_Volte_Percentage,
    case 
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L900F Traffic (Erlang)])/
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L900F_Traffic_Erlang_Volte_Percentage



from
    (select
        [Datetime],
        [Site],
        [Vendor],
        [Contractor],
        [Province],
        isnull([L2300F3 Traffic (Erlang)],0)+isnull([L2300F2 Traffic (Erlang)],0)+isnull([L2300F1 Traffic (Erlang)],0) 
                                                                                              as [L2300F Traffic (Erlang)],
        isnull([L2600F1 Traffic (Erlang)],0)+isnull([L2600F2 Traffic (Erlang)],0) as [L2600F Traffic (Erlang)],
        isnull([L1800F1 Traffic (Erlang)],0)+isnull([L1800F2 Traffic (Erlang)],0) as [L1800F Traffic (Erlang)],
        isnull([L2100F1 Traffic (Erlang)],0)+isnull([L2100F2 Traffic (Erlang)],0) as [L2100F Traffic (Erlang)],
        isnull([L900F1 Traffic (Erlang)],0)+isnull([L900F2 Traffic (Erlang)],0)   as [L900F Traffic (Erlang)],




        isnull([L2600F1 Traffic (Erlang)],0)[L2600F1 Traffic (Erlang)],
        isnull([L2600F2 Traffic (Erlang)],0)[L2600F2 Traffic (Erlang)],
        isnull([L1800F1 Traffic (Erlang)],0)[L1800F1 Traffic (Erlang)],
        isnull([L1800F2 Traffic (Erlang)],0)[L1800F2 Traffic (Erlang)],
        isnull([L2100F1 Traffic (Erlang)],0)[L2100F1 Traffic (Erlang)],
        isnull([L2100F2 Traffic (Erlang)],0)[L2100F2 Traffic (Erlang)],
        isnull([L2300F1 Traffic (Erlang)],0)[L2300F1 Traffic (Erlang)],
        isnull([L2300F2 Traffic (Erlang)],0)[L2300F2 Traffic (Erlang)],
        isnull([L2300F3 Traffic (Erlang)],0)[L2300F3 Traffic (Erlang)],
        isnull([L900F1 Traffic (Erlang)],0)[L900F1 Traffic (Erlang)],
        isnull([L900F2 Traffic (Erlang)],0)[L900F2 Traffic (Erlang)]



    from sa_site_traffic_sharing
    where cast([Datetime] as date) >=GetDATE()-90 and [Province] in ('ALborz')
)TBL

group by [Datetime],[Province]
order by [Datetime]



---------------------------------------------------------------------------------------------------------------------------




SELECT
    $__timeEpoch([Datetime]),

    [Province],
    sum([L2600F1 Traffic (Erlang)])[L2600F1 Traffic (Erlang)],
    sum([L2600F2 Traffic (Erlang)])[L2600F2 Traffic (Erlang)],
    sum([L1800F1 Traffic (Erlang)])[L1800F1 Traffic (Erlang)],
    sum([L1800F2 Traffic (Erlang)])[L1800F2 Traffic (Erlang)],
    sum([L2100F1 Traffic (Erlang)])[L2100F1 Traffic (Erlang)],
    sum([L2100F2 Traffic (Erlang)])[L2100F2 Traffic (Erlang)],
    sum([L2300F1 Traffic (Erlang)])[L2300F1 Traffic (Erlang)],
    sum([L2300F2 Traffic (Erlang)])[L2300F2 Traffic (Erlang)],
    sum([L2300F3 Traffic (Erlang)])[L2300F3 Traffic (Erlang)],
    sum([L900F1 Traffic (Erlang)])[L900F1 Traffic (Erlang)],
    sum([L900F2 Traffic (Erlang)])[L900F2 Traffic (Erlang)],
    -- sum([L2300F Traffic (Erlang)])[L2300F Traffic (Erlang)],
    -- sum([L2600F Traffic (Erlang)])[L2600F Traffic (Erlang)],
    -- sum([L1800F Traffic (Erlang)])[L1800F Traffic (Erlang)],
    -- sum([L2100F Traffic (Erlang)])[L2100F Traffic (Erlang)],
    -- sum([L900F Traffic (Erlang)])[L900F Traffic (Erlang)],

    case 
				   when
				 sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then null else
				   
				   
				   
				  100* sum([L2600F1 Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) end AS L2600F1_Traffic_Erlang_Volte_Percentage,
    case 
				   when
				 sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then null else
				   
				   
				   
				  100* sum([L2600F2 Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) end AS L2600F2_Traffic_Erlang_Volte_Percentage,
    case 
				   when
				 sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then null else
				   
				   
				   
				  100* sum([L1800F1 Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) end AS L1800F1_Traffic_Erlang_Volte_Percentage,
    case 
		when  sum([L1800F2 Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L2100F1 Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L2100F1_Traffic_Erlang_Volte_Percentage,
    case 
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L2100F2 Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L2100F2_Traffic_Erlang_Volte_Percentage,
    case 
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L2300F1 Traffic (Erlang)]) /
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L2300F1_Traffic_Erlang_Volte_Percentage,

    CASE            
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L2300F2 Traffic (Erlang)])/
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L2300F2_Traffic_Erlang_Volte_Percentage,
    CASE            
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L2300F3 Traffic (Erlang)])/
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L2300F3_Traffic_Erlang_Volte_Percentage,
    CASE            
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L900F1 Traffic (Erlang)])/
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L900F1_Traffic_Erlang_Volte_Percentage,
    CASE            
		when  sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)]) = 0 then NULL 
		else
                   100* sum([L900F2 Traffic (Erlang)])/
                    sum([L2300F Traffic (Erlang)] 
                    +[L2600F Traffic (Erlang)]
                    +[L1800F Traffic (Erlang)]
                    +[L2100F Traffic (Erlang)]
                    +[L900F Traffic (Erlang)])end AS L900F2_Traffic_Erlang_Volte_Percentage



from
    (select
        [Datetime],
        [Site],
        [Vendor],
        [Contractor],
        [Province],
        isnull([L2300F3 Traffic (Erlang)],0)+isnull([L2300F2 Traffic (Erlang)],0)+isnull([L2300F1 Traffic (Erlang)],0) 
                                                                                              as [L2300F Traffic (Erlang)],
        isnull([L2600F1 Traffic (Erlang)],0)+isnull([L2600F2 Traffic (Erlang)],0) as [L2600F Traffic (Erlang)],
        isnull([L1800F1 Traffic (Erlang)],0)+isnull([L1800F2 Traffic (Erlang)],0) as [L1800F Traffic (Erlang)],
        isnull([L2100F1 Traffic (Erlang)],0)+isnull([L2100F2 Traffic (Erlang)],0) as [L2100F Traffic (Erlang)],
        isnull([L900F1 Traffic (Erlang)],0)+isnull([L900F2 Traffic (Erlang)],0)   as [L900F Traffic (Erlang)],




        isnull([L2600F1 Traffic (Erlang)],0)[L2600F1 Traffic (Erlang)],
        isnull([L2600F2 Traffic (Erlang)],0)[L2600F2 Traffic (Erlang)],
        isnull([L1800F1 Traffic (Erlang)],0)[L1800F1 Traffic (Erlang)],
        isnull([L1800F2 Traffic (Erlang)],0)[L1800F2 Traffic (Erlang)],
        isnull([L2100F1 Traffic (Erlang)],0)[L2100F1 Traffic (Erlang)],
        isnull([L2100F2 Traffic (Erlang)],0)[L2100F2 Traffic (Erlang)],
        isnull([L2300F1 Traffic (Erlang)],0)[L2300F1 Traffic (Erlang)],
        isnull([L2300F2 Traffic (Erlang)],0)[L2300F2 Traffic (Erlang)],
        isnull([L2300F3 Traffic (Erlang)],0)[L2300F3 Traffic (Erlang)],
        isnull([L900F1 Traffic (Erlang)],0)[L900F1 Traffic (Erlang)],
        isnull([L900F2 Traffic (Erlang)],0)[L900F2 Traffic (Erlang)]



    from sa_site_traffic_sharing
    where cast([Datetime] as date) >=GetDATE()-90 and [Province] in ('ALborz')
)TBL
WHERE
  $__timeFilter([Datetime])
group by [Datetime],[Province]
order by [Datetime]



-----------------------------------------------------------------------------------------------------------------------------------

SELECT
    [Datetime],

    [Province],
    sum([L2300F Payload (GB)])AS TDD_Payload,
    sum([L2600F Payload (GB)]+[L1800F Payload (GB)]+[L2100F Payload (GB)]+[L900F Payload (GB)]) AS FDD_Payload,
    case 
				when 
				sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])= 0 then null else
                    sum([L2300F Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) end AS TDD_Payload_Percentage,
    case 
				when 
				sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])= 0 then null else
                    sum([L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS FDD_Payload_Percentage



from
    (select
        [Datetime],
        [Site],
        [Vendor],
        [Contractor],
        [Province],
        isnull([L2300F3 Payload (GB)],0)+isnull([L2300F2 Payload (GB)],0)+isnull([L2300F1 Payload (GB)],0) 
                                                                                              as [L2300F Payload (GB)],
        isnull([L2600F1 Payload (GB)],0)+isnull([L2600F2 Payload (GB)],0) as [L2600F Payload (GB)],
        isnull([L1800F1 Payload (GB)],0)+isnull([L1800F2 Payload (GB)],0) as [L1800F Payload (GB)],
        isnull([L2100F1 Payload (GB)],0)+isnull([L2100F2 Payload (GB)],0) as [L2100F Payload (GB)],
        isnull([L900F1 Payload (GB)],0)+isnull([L900F2 Payload (GB)],0)   as [L900F Payload (GB)],




        isnull([L2600F1 Payload (GB)],0)[L2600F1 Payload (GB)],
        isnull([L2600F2 Payload (GB)],0)[L2600F2 Payload (GB)],
        isnull([L1800F1 Payload (GB)],0)[L1800F1 Payload (GB)],
        isnull([L1800F2 Payload (GB)],0)[L1800F2 Payload (GB)],
        isnull([L2100F1 Payload (GB)],0)[L2100F1 Payload (GB)],
        isnull([L2100F2 Payload (GB)],0)[L2100F2 Payload (GB)],
        isnull([L2300F1 Payload (GB)],0)[L2300F1 Payload (GB)],
        isnull([L2300F2 Payload (GB)],0)[L2300F2 Payload (GB)],
        isnull([L2300F3 Payload (GB)],0)[L2300F3 Payload (GB)],
        isnull([L900F1 Payload (GB)],0)[L900F1 Payload (GB)],
        isnull([L900F2 Payload (GB)],0)[L900F2 Payload (GB)]



    from sa_site_traffic_sharing
    where cast([Datetime] as date) >=GetDATE()-90 and [Province] in ('ALborz')
)TBL

group by [Datetime],

                 [Province]
order by [Datetime]



------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT
    [Datetime],

    [Province],
    -- sum([L2600F1 Payload (GB)])[L2600F1 Payload (GB)],
    -- sum([L2600F2 Payload (GB)])[L2600F2 Payload (GB)],
    -- sum([L1800F1 Payload (GB)])[L1800F1 Payload (GB)],
    -- sum([L1800F2 Payload (GB)])[L1800F2 Payload (GB)],
    -- sum([L2100F1 Payload (GB)])[L2100F1 Payload (GB)],
    -- sum([L2100F2 Payload (GB)])[L2100F2 Payload (GB)],
    -- sum([L2300F1 Payload (GB)])[L2300F1 Payload (GB)],
    -- sum([L2300F2 Payload (GB)])[L2300F2 Payload (GB)],
    -- sum([L900F1 Payload (GB)])[L900F1 Payload (GB)],
    sum([L2300F Payload (GB)])[L2300F Payload (GB)],
    sum([L2600F Payload (GB)])[L2600F Payload (GB)],
    sum([L1800F Payload (GB)])[L1800F Payload (GB)],
    sum([L2100F Payload (GB)])[L2100F Payload (GB)],
    sum([L900F Payload (GB)])[L900F Payload (GB)],

    case 
				   when
				 sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then null else
				   
				   
				   
				  100* sum([L2300F Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) end AS L2300F_Payload_Traffic_Percentage,
    case 
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L2600F Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L2600F_Payload_Traffic_Percentage,
    case 
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L1800F Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L1800F_Payload_Traffic_Percentage,
    case 
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L2100F Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L2100F_Payload_Traffic_Percentage,
    case 
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L900F Payload (GB)])/
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L900F_Payload_Traffic_Percentage



from
    (select
        [Datetime],
        [Site],
        [Vendor],
        [Contractor],
        [Province],
        isnull([L2300F3 Payload (GB)],0)+isnull([L2300F2 Payload (GB)],0)+isnull([L2300F1 Payload (GB)],0) 
                                                                                              as [L2300F Payload (GB)],
        isnull([L2600F1 Payload (GB)],0)+isnull([L2600F2 Payload (GB)],0) as [L2600F Payload (GB)],
        isnull([L1800F1 Payload (GB)],0)+isnull([L1800F2 Payload (GB)],0) as [L1800F Payload (GB)],
        isnull([L2100F1 Payload (GB)],0)+isnull([L2100F2 Payload (GB)],0) as [L2100F Payload (GB)],
        isnull([L900F1 Payload (GB)],0)+isnull([L900F2 Payload (GB)],0)   as [L900F Payload (GB)],




        isnull([L2600F1 Payload (GB)],0)[L2600F1 Payload (GB)],
        isnull([L2600F2 Payload (GB)],0)[L2600F2 Payload (GB)],
        isnull([L1800F1 Payload (GB)],0)[L1800F1 Payload (GB)],
        isnull([L1800F2 Payload (GB)],0)[L1800F2 Payload (GB)],
        isnull([L2100F1 Payload (GB)],0)[L2100F1 Payload (GB)],
        isnull([L2100F2 Payload (GB)],0)[L2100F2 Payload (GB)],
        isnull([L2300F1 Payload (GB)],0)[L2300F1 Payload (GB)],
        isnull([L2300F2 Payload (GB)],0)[L2300F2 Payload (GB)],
        isnull([L2300F3 Payload (GB)],0)[L2300F3 Payload (GB)],
        isnull([L900F1 Payload (GB)],0)[L900F1 Payload (GB)],
        isnull([L900F2 Payload (GB)],0)[L900F2 Payload (GB)]



    from sa_site_traffic_sharing
    where cast([Datetime] as date) >=GetDATE()-90 and [Province] in ('ALborz')
)TBL

group by [Datetime],[Province]
order by [Datetime]



---------------------------------------------------------------------------------------------------------------------------




SELECT
    [Datetime],

    [Province],
    sum([L2600F1 Payload (GB)])[L2600F1 Payload (GB)],
    sum([L2600F2 Payload (GB)])[L2600F2 Payload (GB)],
    sum([L1800F1 Payload (GB)])[L1800F1 Payload (GB)],
    sum([L1800F2 Payload (GB)])[L1800F2 Payload (GB)],
    sum([L2100F1 Payload (GB)])[L2100F1 Payload (GB)],
    sum([L2100F2 Payload (GB)])[L2100F2 Payload (GB)],
    sum([L2300F1 Payload (GB)])[L2300F1 Payload (GB)],
    sum([L2300F2 Payload (GB)])[L2300F2 Payload (GB)],
    sum([L2300F3 Payload (GB)])[L2300F3 Payload (GB)],
    sum([L900F1 Payload (GB)])[L900F1 Payload (GB)],
    sum([L900F2 Payload (GB)])[L900F2 Payload (GB)],
    -- sum([L2300F Payload (GB)])[L2300F Payload (GB)],
    -- sum([L2600F Payload (GB)])[L2600F Payload (GB)],
    -- sum([L1800F Payload (GB)])[L1800F Payload (GB)],
    -- sum([L2100F Payload (GB)])[L2100F Payload (GB)],
    -- sum([L900F Payload (GB)])[L900F Payload (GB)],

    case 
				   when
				 sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then null else
				   
				   
				   
				  100* sum([L2600F1 Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) end AS L2600F1_Payload_Traffic_Percentage,
    case 
				   when
				 sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then null else
				   
				   
				   
				  100* sum([L2600F2 Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) end AS L2600F2_Payload_Traffic_Percentage,
    case 
				   when
				 sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then null else
				   
				   
				   
				  100* sum([L1800F1 Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) end AS L1800F1_Payload_Traffic_Percentage,
    case 
		when  sum([L1800F2 Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L2100F1 Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L2100F1_Payload_Traffic_Percentage,
    case 
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L2100F2 Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L2100F2_Payload_Traffic_Percentage,
    case 
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L2300F1 Payload (GB)]) /
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L2300F1_Payload_Traffic_Percentage,

    CASE            
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L2300F2 Payload (GB)])/
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L2300F2_Payload_Traffic_Percentage,
    CASE            
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L2300F3 Payload (GB)])/
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L2300F3_Payload_Traffic_Percentage,
    CASE            
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L900F1 Payload (GB)])/
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L900F1_Payload_Traffic_Percentage,
    CASE            
		when  sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)]) = 0 then NULL 
		else
                   100* sum([L900F2 Payload (GB)])/
                    sum([L2300F Payload (GB)] 
                    +[L2600F Payload (GB)]
                    +[L1800F Payload (GB)]
                    +[L2100F Payload (GB)]
                    +[L900F Payload (GB)])end AS L900F2_Payload_Traffic_Percentage



from
    (select
        [Datetime],
        [Site],
        [Vendor],
        [Contractor],
        [Province],
        isnull([L2300F3 Payload (GB)],0)+isnull([L2300F2 Payload (GB)],0)+isnull([L2300F1 Payload (GB)],0) 
                                                                                              as [L2300F Payload (GB)],
        isnull([L2600F1 Payload (GB)],0)+isnull([L2600F2 Payload (GB)],0) as [L2600F Payload (GB)],
        isnull([L1800F1 Payload (GB)],0)+isnull([L1800F2 Payload (GB)],0) as [L1800F Payload (GB)],
        isnull([L2100F1 Payload (GB)],0)+isnull([L2100F2 Payload (GB)],0) as [L2100F Payload (GB)],
        isnull([L900F1 Payload (GB)],0)+isnull([L900F2 Payload (GB)],0)   as [L900F Payload (GB)],




        isnull([L2600F1 Payload (GB)],0)[L2600F1 Payload (GB)],
        isnull([L2600F2 Payload (GB)],0)[L2600F2 Payload (GB)],
        isnull([L1800F1 Payload (GB)],0)[L1800F1 Payload (GB)],
        isnull([L1800F2 Payload (GB)],0)[L1800F2 Payload (GB)],
        isnull([L2100F1 Payload (GB)],0)[L2100F1 Payload (GB)],
        isnull([L2100F2 Payload (GB)],0)[L2100F2 Payload (GB)],
        isnull([L2300F1 Payload (GB)],0)[L2300F1 Payload (GB)],
        isnull([L2300F2 Payload (GB)],0)[L2300F2 Payload (GB)],
        isnull([L2300F3 Payload (GB)],0)[L2300F3 Payload (GB)],
        isnull([L900F1 Payload (GB)],0)[L900F1 Payload (GB)],
        isnull([L900F2 Payload (GB)],0)[L900F2 Payload (GB)]



    from sa_site_traffic_sharing
    where cast([Datetime] as date) >=GetDATE()-90 and [Province] in ('ALborz')
)TBL

group by [Datetime],[Province]
order by [Datetime]



-----------------------------------------------------------------------------------------------------------------------------------
select
    Date,
    [Province],
    [City],
    [L2600F1][PRB_Utilization_L2600F1],
    [L2600F2][PRB_Utilization_L2600F2],
    [L1800F1][PRB_Utilization_L1800F1],
    [L1800F2][PRB_Utilization_L1800F2],
    [L2100F1][PRB_Utilization_L2100F1],
    [L2100F2][PRB_Utilization_L2100F2],
    [L2300F3][PRB_Utilization_L2300F3],
    [L2300F2][PRB_Utilization_L2300F2],
    [L2300F1][PRB_Utilization_L2300F1],
    [L900F2][PRB_Utilization_L900F2],
    [L900F1][PRB_Utilization_L900F1]

from
    (SELECT
        [Date],
        [Province],
        [City],
        [Carrier],
        avg([DL PRB Utilization]) as [DL PRB Utilization]


    from

        (
select
            [Date],
            [Vendor],
            [Province],
            [City],
            SUBSTRING([ElementID1],1,2)+SUBSTRING([ElementID1],5,5) as [Sector],
            [ElementID1],
            case
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='3' then 'L2300F3'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='2' then 'L2300F2'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='1' then 'L2300F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='1' then 'L900F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='1' then 'L900F1' end as Carrier,
            [DL PRB Utilization],
            [UL PRB Utilization]


        from [Performance_PARS].[dbo].[Tbl_PRB_Daily]
        where 
cast([Date] as date)>='2025-02-01'
            and [Province] in ('Alborz')
            and [City] in ('Fardis',
'Kamalshahr',
'Vahidiye',
'Shahr Ghods',
'Safadasht',
'Garmdare',
'Sabashahr',
'Mahestan',
'Hashtgerd',
'Charbagh',
'Eshtehard',
'Shahedshahr',
'Malard',
'Andishe',
'Shahriar',
'Palangabad',
'Meshkindasht',
'Taleghan',
'Ferdosiye',
'Tankaman',
'Mahdasht',
'Baqestan',
'Nazarabad',
'Shahr jadid Hashtgerd',
'Golsar',
'Karaj',
'Mohammadshahr',
'Koohsar',
'Asara')

)TBL


    group by 
[Date],
[Province],
[City],
[Carrier])TBL2


 PIVOT(avg([DL PRB Utilization]) for [Carrier] in ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2
order by
  Date


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select
    $__timeEpoch([Date]),
    [Province],
   -- [City],
    [L2600F][PRB_Utilization_L2600F],
    [L1800F][PRB_Utilization_L1800F],
    [L2300F][PRB_Utilization_L2300F],
    [L2100F][PRB_Utilization_L2100F],
    [L900F][PRB_Utilization_L900F]

from
    (SELECT
        [Date],
        [Province],
        [City],

        [Band],
        avg([DL PRB Utilization]) as [DL PRB Utilization]


    from

        (
select
            [Date],
            [Vendor],
            [Province],
            [City],
            SUBSTRING([ElementID1],1,2)+SUBSTRING([ElementID1],5,5) as [Sector],
            [ElementID1],
            case
when substring([ElementID1],3,2) ='1L' then 'L2600F'
when substring([ElementID1],3,2) ='1L' then 'L2600F'
when substring([ElementID1],3,2) ='7L' then 'L2600F'
when substring([ElementID1],3,2) ='7L' then 'L2600F'
when substring([ElementID1],3,2) ='2L' then 'L1800F'
when substring([ElementID1],3,2) ='2L' then 'L1800F'
when substring([ElementID1],3,2) ='8L' then 'L1800F'
when substring([ElementID1],3,2) ='8L' then 'L1800F'
when substring([ElementID1],3,2) ='3L' then 'L2100F'
when substring([ElementID1],3,2) ='3L' then 'L2100F'
when substring([ElementID1],3,2) ='6L' then 'L2100F'
when substring([ElementID1],3,2) ='6L' then 'L2100F'
when substring([ElementID1],3,2) ='9L' then 'L2100F'
when substring([ElementID1],3,2) ='9L' then 'L2100F'
when substring([ElementID1],3,2) ='5L' then 'L2300F'
when substring([ElementID1],3,2) ='5L' then 'L2300F'
when substring([ElementID1],3,2) ='5L' then 'L2300F'
when substring([ElementID1],3,2) ='AL' then 'L900F'
when substring([ElementID1],3,2) ='AL' then 'L900F'
when substring([ElementID1],3,2) ='4L' then 'L900F'
when substring([ElementID1],3,2) ='4L' then 'L900F' end as Carrier,

            case
when substring([ElementID1],3,2) ='1L' then 'L2600F'
when substring([ElementID1],3,2) ='7L' then 'L2600F'
when substring([ElementID1],3,2) ='2L' then 'L1800F'
when substring([ElementID1],3,2) ='8L' then 'L1800F'
when substring([ElementID1],3,2) ='3L' then 'L2100F'
when substring([ElementID1],3,2) ='6L' then 'L2100F'
when substring([ElementID1],3,2) ='9L' then 'L2100F'
when substring([ElementID1],3,2) ='5L' then 'L2300F'
when substring([ElementID1],3,2) ='AL' then 'L900F'
when substring([ElementID1],3,2) ='4L' then 'L900F' end as Band,

            [DL PRB Utilization],
            [UL PRB Utilization]


        from [Performance_PARS].[dbo].[Tbl_PRB_Daily]
        where 
cast([Date] as date)>='2025-02-01'
            and [Province] in ('Alborz')
            and [City] in ('Fardis',
'Kamalshahr',
'Vahidiye',
'Shahr Ghods',
'Safadasht',
'Garmdare',
'Sabashahr',
'Mahestan',
'Hashtgerd',
'Charbagh',
'Eshtehard',
'Shahedshahr',
'Malard',
'Andishe',
'Shahriar',
'Palangabad',
'Meshkindasht',
'Taleghan',
'Ferdosiye',
'Tankaman',
'Mahdasht',
'Baqestan',
'Nazarabad',
'Shahr jadid Hashtgerd',
'Golsar',
'Karaj',
'Mohammadshahr',
'Koohsar',
'Asara')

)TBL


    group by 
[Date],
[Province],
[City],
[Band])TBL2


 PIVOT(avg([DL PRB Utilization]) for [Band] in ([L2600F],
[L1800F],
[L2100F],
[L2300F],
[L900F]
)) as Tab2
WHERE
$__timeFilter([Date])
order by
  Date

-----------------------------------------------------------------------------------------------------------------------------------------------------------
select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][PRB_Utilization_L2600F1],
    [L2600F2][PRB_Utilization_L2600F2],
    [L1800F1][PRB_Utilization_L1800F1],
    [L1800F2][PRB_Utilization_L1800F2],
    [L2100F1][PRB_Utilization_L2100F1],
    [L2100F2][PRB_Utilization_L2100F2],
    [L2300F3][PRB_Utilization_L2300F3],
    [L2300F2][PRB_Utilization_L2300F2],
    [L2300F1][PRB_Utilization_L2300F1],
    [L900F2][PRB_Utilization_L900F2],
    [L900F1][PRB_Utilization_L900F1]

from
    (select
        [Sector],
        [Carrier],
        avg([DL PRB Utilization])[DL PRB Utilization]
    from (
select
            [Date],
            substring([ElementID1],1,2)+substring([ElementID1],5,5) as 'Sector',
            case
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='3' then 'L2300F3'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='2' then 'L2300F2'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='1' then 'L2300F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='1' then 'L900F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='1' then 'L900F1' end as Carrier,
            [ElementID1],
            [DL PRB Utilization],
            [UL PRB Utilization]
        from [Performance_PARS].[dbo].[Tbl_PRB_Daily]
        where cast([Date] as date) >= Getdate()- 8 and [Province] in ('Alborz'))TBL1

    group by
[Sector],
[Carrier]

)TBL2
 PIVOT(avg([DL PRB Utilization]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2

order by
SUBSTRING([Sector],1,6), [Sector]
-------------------------------------------------------Unbalanced---------------------------------------------------------------------------
select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][PRB_Utilization_L2600F1],
    [L2600F2][PRB_Utilization_L2600F2],
    [L1800F1][PRB_Utilization_L1800F1],
    [L1800F2][PRB_Utilization_L1800F2],
    [L2100F1][PRB_Utilization_L2100F1],
    [L2100F2][PRB_Utilization_L2100F2],
    [L2300F3][PRB_Utilization_L2300F3],
    [L2300F2][PRB_Utilization_L2300F2],
    [L2300F1][PRB_Utilization_L2300F1],
    [L900F2][PRB_Utilization_L900F2],
    [L900F1][PRB_Utilization_L900F1]

from
    (select
        [Sector],
        [Carrier],
        avg([DL PRB Utilization])[DL PRB Utilization]
    from (
select
            [Date],
            substring([ElementID1],1,2)+substring([ElementID1],5,5) as 'Sector',
            case
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='3' then 'L2300F3'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='2' then 'L2300F2'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='1' then 'L2300F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='1' then 'L900F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='1' then 'L900F1' end as Carrier,
            [ElementID1],
            [DL PRB Utilization],
            [UL PRB Utilization]
        from [Performance_PARS].[dbo].[Tbl_PRB_Daily]
        where cast([Date] as date) >= Getdate()- 8 and [Province] in ('Alborz'))TBL1

    group by
[Sector],
[Carrier]

)TBL2
 PIVOT(avg([DL PRB Utilization]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
))
--------------------------------------------------------------------------------------------------------------------------------------
select 
TBL101.SITE,
TBL101.SECTOR,
TBL101.[PRB_Utilization_L2600F1],
TBL101.[PRB_Utilization_L2600F2],
TBL101.[PRB_Utilization_L1800F1],
TBL101.[PRB_Utilization_L1800F2],
TBL101.[PRB_Utilization_L2100F1],
TBL101.[PRB_Utilization_L2100F2],
TBL101.[PRB_Utilization_L2300F3],
TBL101.[PRB_Utilization_L2300F2],
TBL101.[PRB_Utilization_L2300F1],
TBL101.[PRB_Utilization_L900F2],

TBL101.[PRB_Utilization_L900F1],


TBL102.Maximum_Carrier_Name,
TBL102.Maximum_PRB_Value






 from
(select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][PRB_Utilization_L2600F1],
    [L2600F2][PRB_Utilization_L2600F2],
    [L1800F1][PRB_Utilization_L1800F1],
    [L1800F2][PRB_Utilization_L1800F2],
    [L2100F1][PRB_Utilization_L2100F1],
    [L2100F2][PRB_Utilization_L2100F2],
    [L2300F3][PRB_Utilization_L2300F3],
    [L2300F2][PRB_Utilization_L2300F2],
    [L2300F1][PRB_Utilization_L2300F1],
    [L900F2][PRB_Utilization_L900F2],
    [L900F1][PRB_Utilization_L900F1]

from
    (select
        [Sector],
        [Carrier],
        avg([DL PRB Utilization])[DL PRB Utilization]
    from (
select
            [Date],
            substring([ElementID1],1,2)+substring([ElementID1],5,5) as 'Sector',
            case
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='3' then 'L2300F3'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='2' then 'L2300F2'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='1' then 'L2300F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='1' then 'L900F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='1' then 'L900F1' end as Carrier,
            [ElementID1],
            [DL PRB Utilization],
            [UL PRB Utilization]
        from [Performance_PARS].[dbo].[Tbl_PRB_Daily]
        where cast([Date] as date) >= Getdate()- 8 and [Province] in ('Alborz'))TBL1

    group by
[Sector],
[Carrier]

)TBL2
 PIVOT(avg([DL PRB Utilization]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
))
 as Tab2


  )TBL101

left join

(
SELECT t.SECTOR, v.Maximum_Carrier_Name, v.Maximum_PRB_Value
FROM (
select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][PRB_Utilization_L2600F1],
    [L2600F2][PRB_Utilization_L2600F2],
    [L1800F1][PRB_Utilization_L1800F1],
    [L1800F2][PRB_Utilization_L1800F2],
    [L2100F1][PRB_Utilization_L2100F1],
    [L2100F2][PRB_Utilization_L2100F2],
    [L2300F3][PRB_Utilization_L2300F3],
    [L2300F2][PRB_Utilization_L2300F2],
    [L2300F1][PRB_Utilization_L2300F1],
    [L900F2][PRB_Utilization_L900F2],
    [L900F1][PRB_Utilization_L900F1]

from
    (select
        [Sector],
        [Carrier],
        avg([DL PRB Utilization])[DL PRB Utilization]
    from (
select
            [Date],
            substring([ElementID1],1,2)+substring([ElementID1],5,5) as 'Sector',
            case
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='3' then 'L2300F3'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='2' then 'L2300F2'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='1' then 'L2300F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='1' then 'L900F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='1' then 'L900F1' end as Carrier,
            [ElementID1],
            [DL PRB Utilization],
            [UL PRB Utilization]
        from [Performance_PARS].[dbo].[Tbl_PRB_Daily]
        where cast([Date] as date) >= Getdate()- 8 and [Province] in ('Alborz'))TBL1

    group by
[Sector],
[Carrier]

)TBL2
 PIVOT(avg([DL PRB Utilization]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2


 

    ) t
    CROSS APPLY (
        SELECT TOP 1 Carrier_Name, PRB_Value
        FROM (VALUES ('[PRB_Utilization_L2600F1]',[PRB_Utilization_L2600F1]),
    ('[PRB_Utilization_L2600F2]',[PRB_Utilization_L2600F2]),
    ('[PRB_Utilization_L1800F1]',[PRB_Utilization_L1800F1]),
    ('[PRB_Utilization_L1800F2]',[PRB_Utilization_L1800F2]),
    ('[PRB_Utilization_L2100F1]',[PRB_Utilization_L2100F1]),
    ('[PRB_Utilization_L2100F2]',[PRB_Utilization_L2100F2]),
    ('[PRB_Utilization_L2300F3]',[PRB_Utilization_L2300F3]),
    ('[PRB_Utilization_L2300F2]',[PRB_Utilization_L2300F2]),
    ('[PRB_Utilization_L2300F1]',[PRB_Utilization_L2300F1]),
    ('[PRB_Utilization_L900F2]',[PRB_Utilization_L900F2]),
    ('[PRB_Utilization_L900F1]',[PRB_Utilization_L900F1])) 
            AS kpis(Carrier_Name, PRB_Value)
        ORDER BY PRB_Value DESC
    ) v(Maximum_Carrier_Name, Maximum_PRB_Value)
    )TBL102

    on TBL101.SECTOR=TBL102.SECTOR


---------------------------------------------------------------------------------------------------------------------------------------
select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][PRB_Utilization_BH_L2600F1],
    [L2600F2][PRB_Utilization_BH_L2600F2],
    [L1800F1][PRB_Utilization_BH_L1800F1],
    [L1800F2][PRB_Utilization_BH_L1800F2],
    [L2100F1][PRB_Utilization_BH_L2100F1],
    [L2100F2][PRB_Utilization_BH_L2100F2],
    [L2300F3][PRB_Utilization_BH_L2300F3],
    [L2300F2][PRB_Utilization_BH_L2300F2],
    [L2300F1][PRB_Utilization_BH_L2300F1],
    [L900F2][PRB_Utilization_BH_L900F2],
    [L900F1][PRB_Utilization_BH_L900F1]

from
    (select
        [Sector],
        [Carrier],
        avg([DL PRB Utilization])[DL PRB Utilization]
    from (
select
            [Date],
            substring([ElementID1],1,2)+substring([ElementID1],5,5) as 'Sector',
            case
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='1L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='1' then 'L2600F1'
                    when substring([ElementID1],3,2) ='7L' and substring([ElementID1],10,1) ='2' then 'L2600F2'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='2L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='2' then 'L1800F2'
                    when substring([ElementID1],3,2) ='8L' and substring([ElementID1],10,1) ='1' then 'L1800F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='3L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='6L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='2' then 'L2100F2'
                    when substring([ElementID1],3,2) ='9L' and substring([ElementID1],10,1) ='1' then 'L2100F1'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='3' then 'L2300F3'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='2' then 'L2300F2'
                    when substring([ElementID1],3,2) ='5L' and substring([ElementID1],10,1) ='1' then 'L2300F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='1' then 'L900F1'
                    when substring([ElementID1],3,2) ='AL' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='2' then 'L900F2'
                    when substring([ElementID1],3,2) ='4L' and substring([ElementID1],10,1) ='1' then 'L900F1' end as Carrier,
            [ElementID1],
            [DL PRB Utilization],
            [UL PRB Utilization]
        from [Performance_PARS].[dbo].[Tbl_PRB_BH]
        where cast([Date] as date) >= Getdate()- 8 and [Province] in ('Alborz'))TBL1

    group by
[Sector],
[Carrier]

)TBL2
 PIVOT(avg([DL PRB Utilization]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2

order by
SUBSTRING([Sector],1,6), [Sector]

---------------------------------------------------------------------------------------------------------------------------------------
select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][Throughput_UE_DL_L2600F1],
    [L2600F2][Throughput_UE_DL_L2600F2],
    [L1800F1][Throughput_UE_DL_L1800F1],
    [L1800F2][Throughput_UE_DL_L1800F2],
    [L2100F1][Throughput_UE_DL_L2100F1],
    [L2100F2][Throughput_UE_DL_L2100F2],
    [L2300F3][Throughput_UE_DL_L2300F3],
    [L2300F2][Throughput_UE_DL_L2300F2],
    [L2300F1][Throughput_UE_DL_L2300F1],
    [L900F2][Throughput_UE_DL_L900F2],
    [L900F1][Throughput_UE_DL_L900F1]

FROM
    (
SELECT
        [Sector],
        [Province],
        [Carrier],
        case 
when sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) = 0 then Null 
    else
        sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]*[Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)])/sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) 
                 end as 'Throughput'
    from
        (select
            [Datetime],
            substring([eNodeB],1,2) +substring([eNodeB],5,5) as [Sector],
            [Province],
            case
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='3' then 'L2300F3'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='2' then 'L2300F2'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='1' then 'L2300F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='1' then 'L900F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='1' then 'L900F1' 
                                                                                    end as Carrier,
            [Total_Volume(UL+DL)(GB)(eNodeB_Eric)],
            [Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)]
        from TBL_LTE_CELL_Daily_E
        where [Province] in ('Alborz')
            and
            cast([Datetime] as date) >= Getdate()-8
 
 )TBL1
    group BY
[Sector],
[Province],
[Carrier])TBL2
PIVOT(avg([Throughput]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2
order by
SUBSTRING([Sector],1,6)
,[Sector]


--------------------------------------------------------------------------------------------------------------------






select





    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][Throughput_UE_DL_BH_L2600F1],
    [L2600F2][Throughput_UE_DL_BH_L2600F2],
    [L1800F1][Throughput_UE_DL_BH_L1800F1],
    [L1800F2][Throughput_UE_DL_BH_L1800F2],
    [L2100F1][Throughput_UE_DL_BH_L2100F1],
    [L2100F2][Throughput_UE_DL_BH_L2100F2],
    [L2300F3][Throughput_UE_DL_BH_L2300F3],
    [L2300F2][Throughput_UE_DL_BH_L2300F2],
    [L2300F1][Throughput_UE_DL_BH_L2300F1],
    [L900F2][Throughput_UE_DL_BH_L900F2],
    [L900F1][Throughput_UE_DL_BH_L900F1]

FROM
    (
SELECT
        [Sector],
        [Province],
        [Carrier],
        case 
when sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) = 0 then Null 
    else
        sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]*[Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)])/sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) 
                 end as 'Throughput'
    from
        (select
            [Datetime],
            substring([eNodeB],1,2) +substring([eNodeB],5,5) as [Sector],
            [Province],
            case
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='3' then 'L2300F3'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='2' then 'L2300F2'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='1' then 'L2300F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='1' then 'L900F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='1' then 'L900F1' 
                                                                                    end as Carrier,
            [Total_Volume(UL+DL)(GB)(eNodeB_Eric)],
            [Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)]
        from TBL_LTE_CELL_BH_E
        where [Province] in ('Alborz')
            and
            cast([Datetime] as date) >= Getdate()-8
 
 )TBL1
    group BY
[Sector],
[Province],
[Carrier])TBL2
PIVOT(avg([Throughput]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2
order by
SUBSTRING([Sector],1,6)
,[Sector]





SELECT t.id, v.max_value, v.max_kpi_column
FROM (select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][Throughput_UE_DL_L2600F1],
    [L2600F2][Throughput_UE_DL_L2600F2],
    [L1800F1][Throughput_UE_DL_L1800F1],
    [L1800F2][Throughput_UE_DL_L1800F2],
    [L2100F1][Throughput_UE_DL_L2100F1],
    [L2100F2][Throughput_UE_DL_L2100F2],
    [L2300F3][Throughput_UE_DL_L2300F3],
    [L2300F2][Throughput_UE_DL_L2300F2],
    [L2300F1][Throughput_UE_DL_L2300F1],
    [L900F2][Throughput_UE_DL_L900F2],
    [L900F1][Throughput_UE_DL_L900F1]

FROM
    (
SELECT
        [Sector],
        [Province],
        [Carrier],
        case 
when sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) = 0 then Null 
    else
        sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]*[Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)])/sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) 
                 end as 'Throughput'
    from
        (select
            [Datetime],
            substring([eNodeB],1,2) +substring([eNodeB],5,5) as [Sector],
            [Province],
            case
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='3' then 'L2300F3'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='2' then 'L2300F2'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='1' then 'L2300F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='1' then 'L900F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='1' then 'L900F1' 
                                                                                    end as Carrier,
            [Total_Volume(UL+DL)(GB)(eNodeB_Eric)],
            [Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)]
        from TBL_LTE_CELL_Daily_E
        where [Province] in ('Alborz')
            and
            cast([Datetime] as date) >= Getdate()-8
 
 )TBL1
    group BY
[Sector],
[Province],
[Carrier])TBL2
PIVOT(avg([Throughput]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2
order by
SUBSTRING([Sector],1,6)
,[Sector]


--------------------------------------------------------------------------------------------------------------------
select 
TBL101.SITE,
TBL101.SECTOR,
TBL101.[Throughput_UE_DL_BH_L2600F1],
TBL101.[Throughput_UE_DL_BH_L2600F2],
TBL101.[Throughput_UE_DL_BH_L1800F1],
TBL101.[Throughput_UE_DL_BH_L1800F2],
TBL101.[Throughput_UE_DL_BH_L2100F1],
TBL101.[Throughput_UE_DL_BH_L2100F2],
TBL101.[Throughput_UE_DL_BH_L2300F3],
TBL101.[Throughput_UE_DL_BH_L2300F2],
TBL101.[Throughput_UE_DL_BH_L2300F1],
TBL101.[Throughput_UE_DL_BH_L900F2],
TBL101.[Throughput_UE_DL_BH_L900F1],
TBL102.Maximum_Carrier_Name,
TBL102.Maximum_Throughput_Value






 from
(
select

        SUBSTRING([Sector],1,6) as 'Site',
        [Sector],
        [L2600F1][Throughput_UE_DL_BH_L2600F1],
        [L2600F2][Throughput_UE_DL_BH_L2600F2],
        [L1800F1][Throughput_UE_DL_BH_L1800F1],
        [L1800F2][Throughput_UE_DL_BH_L1800F2],
        [L2100F1][Throughput_UE_DL_BH_L2100F1],
        [L2100F2][Throughput_UE_DL_BH_L2100F2],
        [L2300F3][Throughput_UE_DL_BH_L2300F3],
        [L2300F2][Throughput_UE_DL_BH_L2300F2],
        [L2300F1][Throughput_UE_DL_BH_L2300F1],
        [L900F2][Throughput_UE_DL_BH_L900F2],
        [L900F1][Throughput_UE_DL_BH_L900F1]

    FROM
        (
    SELECT
            [Sector],
            [Province],
            [Carrier],
            case 
    when sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) = 0 then Null 
        else
            sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]*[Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)])/sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) 
                    end as 'Throughput'
        from
            (select
                [Datetime],
                substring([eNodeB],1,2) +substring([eNodeB],5,5) as [Sector],
                [Province],
                case
                    when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                    when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                    when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                    when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                    when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                    when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                    when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                    when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                    when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                    when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                    when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                    when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                    when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                    when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                    when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='3' then 'L2300F3'
                    when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='2' then 'L2300F2'
                    when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='1' then 'L2300F1'
                    when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='1' then 'L900F1'
                    when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='2' then 'L900F2'
                    when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='2' then 'L900F2'
                    when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='1' then 'L900F1' 
                                                                                        end as Carrier,
                [Total_Volume(UL+DL)(GB)(eNodeB_Eric)],
                [Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)]
            from TBL_LTE_CELL_BH_E
            where [Province] in ('Alborz')
                and
                cast([Datetime] as date) >= Getdate()-8
    
    )TBL1
        group BY
    [Sector],
    [Province],
    [Carrier])TBL2
    PIVOT(avg([Throughput]) for [Carrier] in  ([L2600F1],
    [L2600F2],
    [L1800F1],
    [L1800F2],
    [L2100F1],
    [L2100F2],
    [L2300F3],
    [L2300F2],
    [L2300F1],
    [L900F2],
    [L900F1]
    )) as Tab2
  )TBL101

left join

(
SELECT t.SECTOR, v.Maximum_Carrier_Name, v.Maximum_Throughput_Value
FROM (


select
     SUBSTRING([Sector],1,6) as 'Site',
        [Sector],
        [L2600F1][Throughput_UE_DL_BH_L2600F1],
        [L2600F2][Throughput_UE_DL_BH_L2600F2],
        [L1800F1][Throughput_UE_DL_BH_L1800F1],
        [L1800F2][Throughput_UE_DL_BH_L1800F2],
        [L2100F1][Throughput_UE_DL_BH_L2100F1],
        [L2100F2][Throughput_UE_DL_BH_L2100F2],
        [L2300F3][Throughput_UE_DL_BH_L2300F3],
        [L2300F2][Throughput_UE_DL_BH_L2300F2],
        [L2300F1][Throughput_UE_DL_BH_L2300F1],
        [L900F2][Throughput_UE_DL_BH_L900F2],
        [L900F1][Throughput_UE_DL_BH_L900F1]

    FROM
        (
    SELECT
            [Sector],
            [Province],
            [Carrier],
            case 
    when sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) = 0 then Null 
        else
            sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]*[Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)])/sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) 
                    end as 'Throughput'
        from
            (select
                [Datetime],
                substring([eNodeB],1,2) +substring([eNodeB],5,5) as [Sector],
                [Province],
                case
                    when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                    when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                    when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                    when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                    when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                    when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                    when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                    when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                    when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                    when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                    when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                    when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                    when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                    when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                    when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='3' then 'L2300F3'
                    when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='2' then 'L2300F2'
                    when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='1' then 'L2300F1'
                    when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='1' then 'L900F1'
                    when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='2' then 'L900F2'
                    when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='2' then 'L900F2'
                    when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='1' then 'L900F1' 
                                                                                        end as Carrier,
                [Total_Volume(UL+DL)(GB)(eNodeB_Eric)],
                [Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)]
            from TBL_LTE_CELL_BH_E
            where [Province] in ('Alborz')
                and
                cast([Datetime] as date) >= Getdate()-8
    
    )TBL1
        group BY
    [Sector],
    [Province],
    [Carrier])TBL2
    PIVOT(avg([Throughput]) for [Carrier] in  ([L2600F1],
    [L2600F2],
    [L1800F1],
    [L1800F2],
    [L2100F1],
    [L2100F2],
    [L2300F3],
    [L2300F2],
    [L2300F1],
    [L900F2],
    [L900F1]
    )) as Tab2
 

    ) t
    CROSS APPLY (
        SELECT TOP 1 Carrier_Name, Throughput_Value
        FROM (VALUES ('[Throughput_UE_DL_BH_L2600F1]',[Throughput_UE_DL_BH_L2600F1]),
    ('[Throughput_UE_DL_BH_L2600F2]',[Throughput_UE_DL_BH_L2600F2]),
    ('[Throughput_UE_DL_BH_L1800F1]',[Throughput_UE_DL_BH_L1800F1]),
    ('[Throughput_UE_DL_BH_L1800F2]',[Throughput_UE_DL_BH_L1800F2]),
    ('[Throughput_UE_DL_BH_L2100F1]',[Throughput_UE_DL_BH_L2100F1]),
    ('[Throughput_UE_DL_BH_L2100F2]',[Throughput_UE_DL_BH_L2100F2]),
    ('[Throughput_UE_DL_BH_L2300F3]',[Throughput_UE_DL_BH_L2300F3]),
    ('[Throughput_UE_DL_BH_L2300F2]',[Throughput_UE_DL_BH_L2300F2]),
    ('[Throughput_UE_DL_BH_L2300F1]',[Throughput_UE_DL_BH_L2300F1]),
    ('[Throughput_UE_DL_BH_L900F2]',[Throughput_UE_DL_BH_L900F2]),
    ('[Throughput_UE_DL_BH_L900F1]',[Throughput_UE_DL_BH_L900F1])) 
            AS kpis(Carrier_Name, Throughput_Value)
        ORDER BY Throughput_Value DESC
    ) v(Maximum_Carrier_Name, Maximum_Throughput_Value))TBL102

    on TBL101.SECTOR=TBL102.SECTOR




--------------------------------------------------------------------------------------------------------------------------------------------------------------

select  $__timeEpoch([Datetime]),
[Province],
-- [City],
sum(isnull([5G Payload (GB)],0))[5G Payload (GB)],
sum(isnull([4G Payload (GB)],0))[4G Payload (GB)],
sum(isnull([3G Payload (GB)],0))[3G Payload (GB)],
sum(isnull([2G Payload (GB)],0))[2G Payload (GB)]


-- case when (sum(isnull([2G Payload (GB)],0))+sum(isnull([3G Payload (GB)],0))+sum(isnull([4G Payload (GB)],0))+sum(isnull([5G Payload (GB)],0))) = 0 then null 
-- else
-- 100*sum(isnull([2G Payload (GB)],0))/(sum(isnull([2G Payload (GB)],0))+sum(isnull([3G Payload (GB)],0))+sum(isnull([4G Payload (GB)],0))+sum(isnull([5G Payload (GB)],0))) end as '2G_Share',
-- case when (sum(isnull([2G Payload (GB)],0))+sum(isnull([3G Payload (GB)],0))+sum(isnull([4G Payload (GB)],0))+sum(isnull([5G Payload (GB)],0))) = 0 then null 
-- else
-- 100*sum(isnull([3G Payload (GB)],0))/(sum(isnull([2G Payload (GB)],0))+sum(isnull([3G Payload (GB)],0))+sum(isnull([4G Payload (GB)],0))+sum(isnull([5G Payload (GB)],0))) end as '3G_Share',
-- case when (sum(isnull([2G Payload (GB)],0))+sum(isnull([3G Payload (GB)],0))+sum(isnull([4G Payload (GB)],0))+sum(isnull([5G Payload (GB)],0))) = 0 then null 
-- else
-- 100*sum(isnull([4G Payload (GB)],0))/(sum(isnull([2G Payload (GB)],0))+sum(isnull([3G Payload (GB)],0))+sum(isnull([4G Payload (GB)],0))+sum(isnull([5G Payload (GB)],0))) end as '4G_Share',
-- case when (sum(isnull([2G Payload (GB)],0))+sum(isnull([3G Payload (GB)],0))+sum(isnull([4G Payload (GB)],0))+sum(isnull([5G Payload (GB)],0))) = 0 then null 
-- else
-- 100*sum(isnull([5G Payload (GB)],0))/(sum(isnull([2G Payload (GB)],0))+sum(isnull([3G Payload (GB)],0))+sum(isnull([4G Payload (GB)],0))+sum(isnull([5G Payload (GB)],0)))end as '5G_Share'
 from SA_SITE_TRAffic_Sharing where $__timeFilter([Datetime]) and cast([Datetime] as date)>=GETDATE()-90 and [Province] in ('Alborz') and isnull([5G Payload (GB)],0)!=0
-- and City=N'$City'
 group by 
 [Datetime],
[Province],
[City]
order by [Datetime]





-----------------------------------------------------------------------------------------------------------------------------------------------------------


select 
TBL101.SITE,
TBL101.SECTOR,
TBL101.[Throughput_UE_DL_L2600F1],
TBL101.[Throughput_UE_DL_L2600F2],
TBL101.[Throughput_UE_DL_L1800F1],
TBL101.[Throughput_UE_DL_L1800F2],
TBL101.[Throughput_UE_DL_L2100F1],
TBL101.[Throughput_UE_DL_L2100F2],
TBL101.[Throughput_UE_DL_L2300F3],
TBL101.[Throughput_UE_DL_L2300F2],
TBL101.[Throughput_UE_DL_L2300F1],
TBL101.[Throughput_UE_DL_L900F2],
TBL101.[Throughput_UE_DL_L900F1],
TBL102.Maximum_Carrier_Name,
TBL102.Maximum_Throughput_Value






 from
(


select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][Throughput_UE_DL_L2600F1],
    [L2600F2][Throughput_UE_DL_L2600F2],
    [L1800F1][Throughput_UE_DL_L1800F1],
    [L1800F2][Throughput_UE_DL_L1800F2],
    [L2100F1][Throughput_UE_DL_L2100F1],
    [L2100F2][Throughput_UE_DL_L2100F2],
    [L2300F3][Throughput_UE_DL_L2300F3],
    [L2300F2][Throughput_UE_DL_L2300F2],
    [L2300F1][Throughput_UE_DL_L2300F1],
    [L900F2][Throughput_UE_DL_L900F2],
    [L900F1][Throughput_UE_DL_L900F1]

FROM
    (
SELECT
        [Sector],
        [Province],
        [Carrier],
        case 
when sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) = 0 then Null 
    else
        sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]*[Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)])/sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) 
                 end as 'Throughput'
    from
        (select
            [Datetime],
            substring([eNodeB],1,2) +substring([eNodeB],5,5) as [Sector],
            [Province],
            case
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='3' then 'L2300F3'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='2' then 'L2300F2'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='1' then 'L2300F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='1' then 'L900F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='1' then 'L900F1' 
                                                                                    end as Carrier,
            [Total_Volume(UL+DL)(GB)(eNodeB_Eric)],
            [Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)]
        from TBL_LTE_CELL_Daily_E
        where [Province] in ('Alborz')
            and
            cast([Datetime] as date) >= Getdate()-8
 
 )TBL1
    group BY
[Sector],
[Province],
[Carrier])TBL2
PIVOT(avg([Throughput]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2
  )TBL101

left join

(
SELECT t.SECTOR, v.Maximum_Carrier_Name, v.Maximum_Throughput_Value
FROM (

select
    SUBSTRING([Sector],1,6) as 'Site',
    [Sector],
    [L2600F1][Throughput_UE_DL_L2600F1],
    [L2600F2][Throughput_UE_DL_L2600F2],
    [L1800F1][Throughput_UE_DL_L1800F1],
    [L1800F2][Throughput_UE_DL_L1800F2],
    [L2100F1][Throughput_UE_DL_L2100F1],
    [L2100F2][Throughput_UE_DL_L2100F2],
    [L2300F3][Throughput_UE_DL_L2300F3],
    [L2300F2][Throughput_UE_DL_L2300F2],
    [L2300F1][Throughput_UE_DL_L2300F1],
    [L900F2][Throughput_UE_DL_L900F2],
    [L900F1][Throughput_UE_DL_L900F1]

FROM
    (
SELECT
        [Sector],
        [Province],
        [Carrier],
        case 
when sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) = 0 then Null 
    else
        sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]*[Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)])/sum([Total_Volume(UL+DL)(GB)(eNodeB_Eric)]) 
                 end as 'Throughput'
    from
        (select
            [Datetime],
            substring([eNodeB],1,2) +substring([eNodeB],5,5) as [Sector],
            [Province],
            case
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='1L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='1' then 'L2600F1'
                when substring([eNodeB],3,2) ='7L' and substring([eNodeB],10,1) ='2' then 'L2600F2'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='2L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='2' then 'L1800F2'
                when substring([eNodeB],3,2) ='8L' and substring([eNodeB],10,1) ='1' then 'L1800F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='3L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='6L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='2' then 'L2100F2'
                when substring([eNodeB],3,2) ='9L' and substring([eNodeB],10,1) ='1' then 'L2100F1'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='3' then 'L2300F3'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='2' then 'L2300F2'
                when substring([eNodeB],3,2) ='5L' and substring([eNodeB],10,1) ='1' then 'L2300F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='1' then 'L900F1'
                when substring([eNodeB],3,2) ='AL' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='2' then 'L900F2'
                when substring([eNodeB],3,2) ='4L' and substring([eNodeB],10,1) ='1' then 'L900F1' 
                                                                                    end as Carrier,
            [Total_Volume(UL+DL)(GB)(eNodeB_Eric)],
            [Average_UE_DL_Throughput(Mbps)(eNodeB_Eric)]
        from TBL_LTE_CELL_Daily_E
        where [Province] in ('Alborz')
            and
            cast([Datetime] as date) >= Getdate()-8
 
 )TBL1
    group BY
[Sector],
[Province],
[Carrier])TBL2
PIVOT(avg([Throughput]) for [Carrier] in  ([L2600F1],
[L2600F2],
[L1800F1],
[L1800F2],
[L2100F1],
[L2100F2],
[L2300F3],
[L2300F2],
[L2300F1],
[L900F2],
[L900F1]
)) as Tab2
 

    ) t
    CROSS APPLY (
        SELECT TOP 1 Carrier_Name, Throughput_Value
        FROM (VALUES ('[Throughput_UE_DL_BH_L2600F1]',[Throughput_UE_DL_L2600F1]),
    ('[Throughput_UE_DL_L2600F2]',[Throughput_UE_DL_L2600F2]),
    ('[Throughput_UE_DL_L1800F1]',[Throughput_UE_DL_L1800F1]),
    ('[Throughput_UE_DL_L1800F2]',[Throughput_UE_DL_L1800F2]),
    ('[Throughput_UE_DL_L2100F1]',[Throughput_UE_DL_L2100F1]),
    ('[Throughput_UE_DL_L2100F2]',[Throughput_UE_DL_L2100F2]),
    ('[Throughput_UE_DL_L2300F3]',[Throughput_UE_DL_L2300F3]),
    ('[Throughput_UE_DL_L2300F2]',[Throughput_UE_DL_L2300F2]),
    ('[Throughput_UE_DL_L2300F1]',[Throughput_UE_DL_L2300F1]),
    ('[Throughput_UE_DL_L900F2]',[Throughput_UE_DL_L900F2]),
    ('[Throughput_UE_DL_L900F1]',[Throughput_UE_DL_L900F1])) 
            AS kpis(Carrier_Name, Throughput_Value)
        ORDER BY Throughput_Value DESC
    ) v(Maximum_Carrier_Name, Maximum_Throughput_Value)
	
	
	
	
	)TBL102

    on TBL101.SECTOR=TBL102.SECTOR

    AVG
    SUM
    COUNT
    MIN
    MAX
    DISTINCT

Table...        name             age         breed          net_worth 
                ---------------  ----------  -------------  ----------
                Maru             3           Scottish Fold  1000000   
                Hana             1           Tabby          21000    
                Grumpy Cat       4           Persian        181800    
                Lil' Bub         2           Tortoiseshell  3000000  

AVG()...      
    SELECT AVG(net_worth) FROM cats;

    Returns...  AVG(net_worth) 
                ---------------
                1050700.0

    SELECT AVG(net_worth) AS average_net_worth FROM cats;

    Returns...  average_net_worth   
                --------------------
                1050700.0 

SUM()...
    SELECT SUM(net_worth) FROM cats;
    
    Returns...  SUM(net_worth)      
                --------------------
                4202800   

MIN() + MAX()...
    SELECT MIN(net_worth) FROM cats;
    
    Returns...  MIN(net_worth)      
                --------------------
                21000   

COUNT()...
    SELECT COUNT(name) FROM cats;

    Returns...  COUNT(name)            
                --------------------
                4

    SELECT COUNT(*) FROM cats WHERE net_worth > 1000000;
    
    Returns...  COUNT(*)            
                --------------------
                1    
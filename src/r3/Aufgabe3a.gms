$title Task 3a - Optimization under Uncertainty
$ontext
$offtext

* Sets for foods (i) and nutrients (j)
Set
    i  / apple, cornflake, carrots, potatoes, cheese, milk, chocolate, spinach, steak /
    uncertainty_surcharge_c_absolut_items(i) 'Items to apply sum increases' / apple, potatoes, cheese, spinach /
    uncertainty_surcharge_c_relative_items(i) 'Items to apply percentage increases' / cornflake, carrots, milk, chocolate, steak/
    j  / calories, protein, carbs, fat_min, fat_max, calcium, vit_b2, min_amount /;

* Table for nutritional values of each food (left-hand side coefficients)
Table A_initial(i,j) Nutritional values per 100g
             calories   protein   carbs   fat_min   fat_max   calcium   vit_b2   min_amount
    apple       52       0.35      18      0.4       0.4       7         30        1
    cornflake  355       7        307      0.6       0.6       13        60        0
    carrots     26       1          7      0.2       0.2       41        53        1
    potatoes    71       2        24.5     0.11      0.11      6         47        0
    cheese     354       25       177     28.3      28.3      800       300        0
    milk        64       3.5       12      3.5       3.5      120       170        0
    chocolate  536       9         52     31.5      31.5      214       370        0
    spinach     17       2.5        6.5    0.3       0.3      126       230        1
    steak      121       21        60.5    4         4         3        130        0;

* Table of reduction percentages as for an lp equivalent the worst case scenario is considered, which is that less nutrients are available in the food than expected
Table Uncertainty_interval_A_relativ(i,j) Uncertainty percentage for each nutrient of each food item
             calories   protein   carbs   fat_min   fat_max   calcium   vit_b2   min_amount
    u_apple       0        0.2       0       0.2       0.2       0.2       0.15       0
    u_cornflake   0        0.1       0       0.2       0.2       0.5       0.2        0
    u_carrots     0        0.2       0       0.2       0.2       0.2       0.2        0
    u_potatoes    0        0.05      0       0.02      0.02      0.02      0.01       0
    u_cheese      0        0.01      0       0.01      0.01      0.1       0.05       0
    u_milk        0        0.1       0       0.1       0.1       0.2       0.05       0
    u_chocolate   0        0.01      0       0.01      0.01      0.01      0.01       0
    u_spinach     0        0.1       0       0.015     0.015     0.1       0.2        0
    u_steak       0        0.15      0       0.3       0.3       0.2       0.15       0;

* Table for updated nutritional values
Table A(i,j) Updated nutritional values per 100g;

* Apply reductions to the nutritional values
A(i,j) = A_initial(i,j) * (1 - Uncertainty_interval_A_relativ(i,j));


* Parameters for right-hand side constraints (nutritional requirements) and objective function coefficients
Parameter
    b_initial(j) /
        calories 2400,
        protein  56,
        carbs    0,
        fat_min  50,
        fat_max  70,
        calcium  500,
        vit_b2   1100,
        min_amount 4 /
    uncertainty_surcharge_b_absolut(j) 'Amount of additional surcharge needed per day as the worst case scenario is that more nutrients are needed' /
        u_calories 350,
        u_protein  10,
        u_carbs    0,
        u_fat_min  10,
*       Only the minimum amount of fat needed to get increased   
        u_fat_max  0,
        u_calcium  200,
        u_vit_b2   300,
        u_min_amount 0 /
    b(j) 'Updated parameter for daily nutrient needs equivalent to the right-hand side of the constraints';

* Initialize b(j) with b_initial(j) and apply the absolute surcharge    
b(j) = b_initial(j) + uncertainty_surcharge_b_absolut(j);
Display b;


Parameter 
    c_initial(i) /
        apple 0.22,
        cornflake 0.18,
        carrots 0.07,
        potatoes 0.14,
        cheese 0.55,
        milk 0.1,
        chocolate 0.54,
        spinach 0.28,
        steak 3.2 /
    uncertainty_surcharge_c_absolut(i) 'Amount of additional surcharge per 100g' /
        u_apple 0.06,
        u_potatoes 0.04,
        u_cheese 0.1,
        u_spinach 0.1/
    uncertainty_surcharge_c_relative(i) 'Percentage of additional surcharge per 100g' /
        u_cornflake 0.15,
        u_carrots 0.2,
        u_milk 0.25,
        u_chocolate 0.4,
        u_steak 0.4/
    c(i) 'Final coefficients for objective function';

* Initialize c(i) with c_initial(i)
c(i) = c_initial(i);
* Apply absolute surcharge
c(uncertainty_surcharge_c_absolut_items) = c(uncertainty_surcharge_c_absolut_items) + uncertainty_surcharge_c_absolut(uncertainty_surcharge_c_absolut_items);
* Apply relative surcharge
c(uncertainty_surcharge_c_relative_items) = c(uncertainty_surcharge_c_relative_items) * (1 + uncertainty_surcharge_c_relative(uncertainty_surcharge_c_relative_items));
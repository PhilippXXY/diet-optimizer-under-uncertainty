$title Task 3a - Optimization under Uncertainty
$ontext
$offtext

* Sets for foods (i) and nutrients (j)
Set
    i  / apple, cornflake, carrots, potatoes, cheese, milk, chocolate, spinach, steak /
    uncertainty_surcharge_absolut_items(i) 'Items to apply sum increases' / apple, potatoes, cheese, spinach /
    uncertainty_surcharge_relative_items(i) 'Items to apply percentage increases' / cornflake, carrots, milk, chocolate, steak/
    j  / calories, protein, carbs, fat_min, fat_max, calcium, vit_b2, min_amount /;

* Table for nutritional values of each food (left-hand side coefficients)
Table A(i,j) Nutritional values per 100g
             calories   protein   carbs   fat_min   fat_max   calcium   vit_b2   min_amount
    apple       52       0.35      18      0.4       0.4       7         30        1
    cornflake 355       7        307      0.6       0.6       13        60        0
    carrots     26       1          7      0.2       0.2       41        53        1
    potatoes    71       2        24.5     0.11      0.11      6         47        0
    cheese     354       25      -177     28.3      28.3      800       300        0
    milk        64       3.5     -12       3.5       3.5      120       170        0
    chocolate  536       9       -52      31.5      31.5      214       370        0
    spinach     17       2.5      -6.5     0.3       0.3      126       230        1
    steak      121       21      -60.5     4         4         3        130        0;

* Parameters for right-hand side constraints (nutritional requirements) and objective function coefficients
Parameter
    b(j) /
        calories 2400,
        protein  56,
        carbs    0,
        fat_min  50,
        fat_max  70,
        calcium  500,
        vit_b2   1100,
        min_amount 4 /
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
    uncertainty_surcharge_absolut(i) 'Amount of additional surcharge per 100g' /
        apple 0.06,
        potatoes 0.04,
        cheese 0.1,
        spinach 0.1/
    uncertainty_surcharge_relative(i) 'Percentage of additional surcharge per 100g' /
        cornflake 0.15,
        carrots 0.2,
        milk 0.25,
        chocolate 0.4,
        steak 0.4/
    c(i) 'Final coefficients for objective function';

* Initialize c(i) with c_initial(i)
c(i) = c_initial(i);
* Apply absolute surcharge
c(uncertainty_surcharge_absolut_items) = c(uncertainty_surcharge_absolut_items) + uncertainty_surcharge_absolut(uncertainty_surcharge_absolut_items);
* Apply relative surcharge
c(uncertainty_surcharge_relative_items) = c(uncertainty_surcharge_relative_items) * (1 + uncertainty_surcharge_relative(uncertainty_surcharge_relative_items));
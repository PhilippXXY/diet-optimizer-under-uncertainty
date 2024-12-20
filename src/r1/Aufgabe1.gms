$title Task 1 - Optimization under Uncertainty
$ontext
Detailed description of the model:
- Objective: Minimize the cost of a diet that meets specific nutritional constraints.
- Variables: Quantities of various foods to be included in the diet.
- Constraints: Caloric, protein, carbohydrate, fat, calcium, and vitamin B2 requirements.

Inputs:
- Price per 100g for each food.
- Nutritional values per 100g for each food item.
$offtext

* Sets for foods (i) and nutrients (j)
Set
    i  / apple, cornflake, carrots, potatoes, cheese, milk, chocolate, spinach, steak /
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
    c(i) /
        apple 0.22,
        cornflake 0.18,
        carrots 0.07,
        potatoes 0.14,
        cheese 0.55,
        milk 0.1,
        chocolate 0.54,
        spinach 0.28,
        steak 3.2 /;

* Define variables
Positive Variable x(i);
Free Variable z;

* Universal upper bounds and specific constraints
x.up(i) = 5;
x.up("cornflake") = 3;
x.up("milk") = 2;
x.up("chocolate") = 3;
x.lo("steak") = 1;

* Define equations
Equations
    eq1 objective_function,
    eq2_min(j) minimum_nutritional_restrictions
    eq2_max(j) maximum_nutritional_restrictions;

* Objective function
eq1 .. z =e= sum(i, c(i) * x(i));

* Constraints with a minimum nutritional requirement (greater than or equal to) 
eq2_min(j)$(ord(j) ne 5) .. 
    sum(i, A(i,j) * x(i)) =g= b(j);

* Constraints with a maximum nutritional requirement (less than or equal to) in this case for fat
eq2_max(j)$(ord(j) eq 5) .. 
    sum(i, A(i,j) * x(i)) =l= b(j);

* Model definition
Model problem /all/;

* Solve the model
Solve problem using lp minimizing z;

* Display results
Display x.l, z.l;

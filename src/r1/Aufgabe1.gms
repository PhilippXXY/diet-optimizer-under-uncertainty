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

* Declaration of all positive Variables
Positive variables x_1_apple, x_2_cornflakes, x_3_carrots, x_4_potatoes, x_5_cheese, x_6_milk, x_7_chocolate, x_8_spinach, x_9_steak;
* Setting their universal upper Bound
x_1_apple.up = 5;
x_2_cornflakes.up = 5;
x_3_carrots.up =5;
x_4_potatoes.up = 5;
x_5_cheese.up =5;
x_6_milk.up =5;
x_7_chocolate.up = 5;
x_8_spinach.up = 5;
x_9_steak.up = 5;
* Setting individual bounds
x_2_cornflakes.up = 3;
x_6_milk.up = 2;
x_7_chocolate.up = 3;
x_9_steak.lo = 1;

* Free variable for the target function
Free variable z;

* Declaration of the equations
Equations
eq_1 target_function,
eq_2 calorie_restriction,
eq_3 protein_restriction,    
eq_4 carbohydrates_restriction,
eq_5 min_fat_restriction,
eq_6 max_fat_restriction,
eq_7 calcium_restriction,
eq_8 vitamin_b2_restriction,
eq_9 min_amount_restriction;

* Target Function with the Price in Euro per 100g
eq_1 .. z =e= 0.22*x_1_apple + 0.18*x_2_cornflakes + 0.07*x_3_carrots + 0.14*x_4_potatoes + 0.55*x_5_cheese + 0.1*x_6_milk + 0.54*x_7_chocolate + 0.28*x_8_spinach + 3.2*x_9_steak;
* Minimum Amount of Calories in kcal
eq_2 .. 52*x_1_apple + 355*x_2_cornflakes + 26*x_3_carrots + 71*x_4_potatoes + 354*x_5_cheese + 64*x_6_milk + 536*x_7_chocolate + 17*x_8_spinach + 121*x_9_steak =g= 2400;
* Minimum Amount of Protein in g
eq_3 .. 0.35*x_1_apple + 7*x_2_cornflakes + 1*x_3_carrots + 2*x_4_potatoes + 25*x_5_cheese + 3.5*x_6_milk + 9*x_7_chocolate + 2.5*x_8_spinach + 21*x_9_steak =g= 56;
* Carbohydrates cover 50% of the calorie requirement
eq_4 .. 18*x_1_apple + 307*x_2_cornflakes + 7*x_3_carrots + 24.5*x_4_potatoes - 177*x_5_cheese - 12*x_6_milk - 52*x_7_chocolate - 6.5*x_8_spinach - 60.5*x_9_steak =g= 0;
* Minimum Amount of Fat in g
eq_5 .. 0.4*x_1_apple + 0.6*x_2_cornflakes + 0.2*x_3_carrots + 0.11*x_4_potatoes + 28.3*x_5_cheese + 3.5*x_6_milk + 31.5*x_7_chocolate + 0.3*x_8_spinach + 4*x_9_steak =g= 50;
* Maximum Amount of Fat in g
eq_6 .. 0.4*x_1_apple + 0.6*x_2_cornflakes + 0.2*x_3_carrots + 0.11*x_4_potatoes + 28.3*x_5_cheese + 3.5*x_6_milk + 31.5*x_7_chocolate + 0.3*x_8_spinach + 4*x_9_steak =l= 70;
* Minimum Amount of Calcium in mg
eq_7 .. 7*x_1_apple + 13*x_2_cornflakes + 41*x_3_carrots + 6*x_4_potatoes + 800*x_5_cheese + 120*x_6_milk + 214*x_7_chocolate + 126*x_8_spinach + 3*x_9_steak =g= 500;
* Minimum Amount of Vitamin B2 in µg
eq_8 .. 30*x_1_apple + 60*x_2_cornflakes + 53*x_3_carrots + 47*x_4_potatoes + 300*x_5_cheese + 170*x_6_milk + 370*x_7_chocolate + 230*x_8_spinach + 130*x_9_steak =g= 1100;
* Minimum healthy Amount
eq_9 .. 1*x_1_apple + 1*x_3_carrots + x_8_spinach =g= 4;

* Define all declared Equations in the Model
Model problem /all/;

* Solve the Model using the Linear Programming Method and minimize the Target Function
Solve problem using lp minimizing z;

* Print the Results
Display x_1_apple.l, x_2_cornflakes.l, x_3_carrots.l, x_4_potatoes.l, x_5_cheese.l, x_6_milk.l, x_7_chocolate.l, x_8_spinach.l, x_9_steak.l, z.l;
$title Task 3b - Optimization under Uncertainty (Non-Linear Approach)

$ontext
Detailed description of the model:
- Objective: Create a robust counterpart model for the given linear program, as uncertainty is present.
- Uncertainty: The uncertainty is present in the objective function as well as the constraints. It arrives as a ellipsoidal uncertainty set.
- Approach: By defining the uncertainty as an ellipsoidal set, the uncertainties can be modeled as quadratic terms in the objective function and constraints.
$offtext

* Sets for foods (i) and nutrients (j)
Set
    i / x1*x9 /
    j / a1*a8/;

* Parameters for the linear part of the objective function
Parameter c(i) 
    /x1 0.22,
    x2 0.18,
    x3 0.07,
    x4 0.14,
    x5 0.55,
    x6 0.16,
    x7 0.54,
    x8 0.28,
    x9 3.2 /;

* Parameters for the quadratic terms in objective function
Parameter q_obj(i) 
    /x1 0.0036,
    x2 0.000729,
    x3 0.000196,
    x4 0.0016,
    x5 0.01,
    x6 0.0016,
    x7 0.046656,
    x8 0.01,
    x9 1.6384 /;

* Table with coefficients for constraints
Table A(j,i)
              x1       x2       x3       x4       x5       x6       x7       x8       x9
a1        -52.00  -355.00   -26.00   -71.00  -354.00   -64.00  -536.00   -17.00  -121.00
a2         -0.35    -7.00    -1.00    -2.00   -25.00    -3.50    -9.00    -2.50   -21.00
a3        -18.00  -307.00    -7.00   -24.50   177.00    12.00    52.00     6.50    60.50
a4         -0.40    -0.60    -0.20    -0.11   -28.30    -3.50   -31.50    -0.30    -4.00
a5          0.40     0.60     0.20     0.11    28.30     3.50    31.50     0.30     4.00
a6         -7.00   -13.00   -41.00    -6.00  -800.00  -120.00  -214.00  -126.00    -3.00
a7        -30.00   -60.00   -53.00   -47.00  -300.00  -170.00  -370.00  -230.00  -130.00
a8         -1.00     0.00    -1.00     0.00     0.00     0.00     0.00    -1.00     0.00;

* Parameters for the quadratic terms in constraints
Table q(j,i)
              x1       x2       x3         x4         x5       x6       x7       x8       x9
a1          0.00     0.00     0.00       0.00       0.00     0.00     0.00     0.00     0.00
a2        0.0049     0.49     0.04       0.01     3.1329   0.1225     0.81   0.0625   9.9225
a3          0.00     0.00     0.00       0.00       0.00     0.00     0.00     0.00     0.00
a4          0.64   0.0144   0.0016 0.00000484   0.001225   0.1225   9.9225 0.002025     1.44
a5          0.64   0.0144   0.0016 0.00000484   0.001225   0.1225   9.9225 0.002025     1.44
a6          1.96    42.25    67.24     0.0144    6400.00   576.00   457.96   158.76     0.36
a7         20.25   144.00   112.36     0.2209     225.00    72.25  1369.00  2116.00   380.25
a8          0.00     0.00     0.00       0.00       0.00     0.00     0.00     0.00     0.00;

* Constants for square root terms
Parameter k(j) /
    a1 122500,
    a2 100,
    a3 0,
    a4 100,
    a5 0,
    a6 40000,
    a7 90000,
    a8 0
/;

* Right hand side values
Parameter b(j) /
    a1 -2400,
    a2 -56,
    a3 0,
    a4 -50,
    a5 70,
    a6 -500,
    a7 -1100,
    a8 -4
/;

* Define variables
Positive Variable x;
Free Variable z;

* Set Upper bounds
x.up(i) = 5;
x.up('x2') = 3;
x.up('x6') = 2;
x.up('x7') = 3;
* Set Lower bounds
x.lo('x9') = 1;

* Define the Objective Function and Constraints
Equations
    eq1 objective_function
    eq2(j) constraints;

* Add uncertainty values as parameters to x squared and calculate the square root of the sum 
eq1.. z =e= sum(i, c(i)*x(i)) + sqrt(sum(i, q_obj(i)*x(i)*x(i)));
* Add the uncertainty values of the x constraints and the right-hand side values and calculate the square root of the sum
eq2(j).. sum(i, A(j,i)*x(i)) + sqrt(sum(i, q(j,i)*x(i)*x(i)) + k(j)) =l= b(j);

* Model of the robust counterpart
Model problem /all/;
* As the model is non-linear, we need to use a non-linear solver
Solve problem using nlp minimizing z;
* Display the results
Display x.l, z.l;

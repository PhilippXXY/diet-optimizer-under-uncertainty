$ontext
Detailed description of the model:
- Objective: Create a robust counterpart model for the given linear program, as uncertainty is present.
- Uncertainty: The uncertainty is present in the objective function as well as the constraints.
- LP Equivalence: The robust counterpart model is equivalent to the original LP model when the uncertainty is zero.
$offtext

* Sets for the model, where i represents the food items with additional variables for the robust counterpart model and j represents the nutritional requirements
Sets
    i / x1*x9, w01*w09, w110, w21*w29, w210, w41*w49, w410, w51*w59, w510, w61*w69, w610, w71*w79, w710 /
    j / a1 * a8 /;

* Changed every constraint into standard form and added additional variables for the robust counterpart
Table A(i, j)                
         a1     a2     a3     a4     a5     a6     a7   a8
x1    -52.0  -0.35  -18.0  -0.40   0.40   -7.0  -30.0 -1.0
x2   -355.0  -7.00 -307.0  -0.60   0.60  -13.0  -60.0  0.0
x3    -26.0  -1.00   -7.0  -0.20   0.20  -41.0  -53.0 -1.0
x4    -71.0  -2.00  -24.5  -0.11   0.11   -6.0  -47.0  0.0
x5   -354.0 -25.00  177.0 -28.30  28.30 -800.0 -300.0  0.0
x6    -64.0  -3.50   12.0  -3.50   3.50 -120.0 -170.0  0.0
x7   -536.0  -9.00   52.0 -31.50  31.50 -214.0 -370.0  0.0
x8    -17.0  -2.50    6.5  -0.30   0.30 -126.0 -230.0 -1.0
x9   -121.0 -21.00   60.5  -4.00   4.00   -3.0 -130.0  0.0
w110    1.0   0.00    0.0   0.00   0.00    0.0    0.0  0.0
w21     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w22     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w23     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w24     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w25     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w26     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w27     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w28     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w29     0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w210    0.0   1.00    0.0   0.00   0.00    0.0    0.0  0.0
w41     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w42     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w43     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w44     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w45     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w46     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w47     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w48     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w49     0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w410    0.0   0.00    0.0   1.00   0.00    0.0    0.0  0.0
w51     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w52     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w53     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w54     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w55     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w56     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w57     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w58     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w59     0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w510    0.0   0.00    0.0   0.00   1.00    0.0    0.0  0.0
w61     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w62     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w63     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w64     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w65     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w66     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w67     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w68     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w69     0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w610    0.0   0.00    0.0   0.00   0.00    1.0    0.0  0.0
w71     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w72     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w73     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w74     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w75     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w76     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w77     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w78     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w79     0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0
w710    0.0   0.00    0.0   0.00   0.00    0.0    1.0  0.0;

* Right-hand side values for the constraints transformed into standard form
Parameter 
b(j)
    / a1 -2400
      a2 -56
      a3 -0
      a4 -50
      a5 70
      a6 -500
      a7 -1100
      a8 4 /;

* Coefficients for the objective function
Parameter 
c(i)
    /x1 0.22
     x2 0.18
     x3 0.07
     x4 0.14
     x5 0.55
     x6 0.1
     x7 0.54
     x8 0.28
     x9 3.2 /;

* Uncertainty values for the objective function
Parameter wc(i)
    /w01 1
     w02 1
     w03 1
     w04 1
     w05 1
     w06 1
     w07 1
     w08 1
     w09 1    
     /;

* Variables for the model
Positive Variable x(i);
Free Variable z;

* Constraints as in the original model
x.up(i) = 5;
x.up('x2') = 3;
x.up('x6') = 2;
x.up('x7') = 3;
* Adjusted to standard form
x.lo('x9') = 1;

* Uncertainty values for the constraints of the objective function
x.lo('w01') = -0.06 * x.l('x1');
x.up('w01') = 0.06 * x.l('x1');
x.lo('w02') = 0.027 * x.l('x2');
x.up('w02') = 0.027 * x.l('x2');
x.lo('w03') = -0.014 * x.l('x3');
x.up('w03') = 0.014 * x.l('x3');
x.lo('w04') = -0.04 * x.l('x4');
x.up('w04') = 0.04 * x.l('x4');
x.lo('w05') = -0.1 * x.l('x5');
x.up('w05') = 0.1 * x.l('x5');
x.lo('w06') = -0.04 * x.l('x6');
x.up('w06') = 0.04 * x.l('x6');
x.lo('w07') = -0.216 * x.l('x7');
x.up('w07') = 0.216 * x.l('x7');
x.lo('w08') = -0.1 * x.l('x8');
x.up('w08') = 0.1 * x.l('x8');
x.lo('w09') = -1.28 * x.l('x9');
x.up('w09') = 1.28 * x.l('x9');

* Uncertainty values for the constraints of the restrictions
x.lo('w110') = -350;
x.up('w110') = 350;

x.lo('w21') = -0.07 * x.l('x1');
x.up('w21') = 0.07 * x.l('x1');
x.lo('w22') = -0.7 * x.l('x2');
x.up('w22') = 0.7 * x.l('x2');
x.lo('w23') = -0.2 * x.l('x3');
x.up('w23') = 0.2 * x.l('x3');
x.lo('w24') = -0.1 * x.l('x4');
x.up('w24') = 0.1 * x.l('x4');
x.lo('w25') = -1.77 * x.l('x5');
x.up('w25') = 1.77 * x.l('x5');
x.lo('w26') = -0.35 * x.l('x6');
x.up('w26') = 0.35 * x.l('x6');
x.lo('w27') = -0.9 * x.l('x7');
x.up('w27') = 0.9 * x.l('x7');
x.lo('w28') = -0.25 * x.l('x8');
x.up('w28') = 0.25 * x.l('x8');
x.lo('w29') = -3.15 * x.l('x9');
x.up('w29') = 3.15 * x.l('x9');
x.lo('w210') = -10;
x.up('w210') = 10;

x.lo('w41') = -0.8 * x.l('x1');
x.up('w41') = 0.8 * x.l('x1');
x.lo('w42') = -0.12 * x.l('x2');
x.up('w42') = 0.12 * x.l('x2');
x.lo('w43') = -0.04 * x.l('x3');
x.up('w43') = 0.04 * x.l('x3');
x.lo('w44') = -0.0022 * x.l('x4');
x.up('w44') = 0.0022 * x.l('x4');
x.lo('w45') = -0.035 * x.l('x5');
x.up('w45') = 0.035 * x.l('x5');
x.lo('w46') = -0.35 * x.l('x6');
x.up('w46') = 0.35 * x.l('x6');
x.lo('w47') = -3.15 * x.l('x7');
x.up('w47') = 3.15 * x.l('x7');
x.lo('w48') = -0.045 * x.l('x8');
x.up('w48') = 0.045 * x.l('x8');
x.lo('w49') = -1.2 * x.l('x9');
x.up('w49') = 1.2 * x.l('x9');
x.lo('w410') = -10;
x.up('w410') = 10;

x.lo('w51') = -0.8 * x.l('x1');
x.up('w51') = 0.8 * x.l('x1');
x.lo('w52') = -0.12 * x.l('x2');
x.up('w52') = 0.12 * x.l('x2');
x.lo('w53') = -0.04 * x.l('x3');
x.up('w53') = 0.04 * x.l('x3');
x.lo('w54') = -0.0022 * x.l('x4');
x.up('w54') = 0.0022 * x.l('x4');
x.lo('w55') = -0.035 * x.l('x5');
x.up('w55') = 0.035 * x.l('x5');
x.lo('w56') = -0.35 * x.l('x6');
x.up('w56') = 0.35 * x.l('x6');
x.lo('w57') = -3.15 * x.l('x7');
x.up('w57') = 3.15 * x.l('x7');
x.lo('w58') = -0.045 * x.l('x8');
x.up('w58') = 0.045 * x.l('x8');
x.lo('w59') = -1.2 * x.l('x9');
x.up('w59') = 1.2 * x.l('x9');
x.lo('w510') = 0;
x.up('w510') = 0;

x.lo('w61') = -1.4 * x.l('x1');
x.up('w61') = 1.4 * x.l('x1');
x.lo('w62') = -6.5 * x.l('x2');
x.up('w62') = 6.5 * x.l('x2');
x.lo('w63') = -8.2 * x.l('x3');
x.up('w63') = 8.2 * x.l('x3');
x.lo('w64') = -0.12 * x.l('x4');
x.up('w64') = 0.12 * x.l('x4');
x.lo('w65') = -80 * x.l('x5');
x.up('w65') = 80 * x.l('x5');
x.lo('w66') = -24 * x.l('x6');
x.up('w66') = 24 * x.l('x6');
x.lo('w67') = -21.4 * x.l('x7');
x.up('w67') = 21.4 * x.l('x7');
x.lo('w68') = -12.6 * x.l('x8');
x.up('w68') = 12.6 * x.l('x8');
x.lo('w69') = -0.6 * x.l('x9');
x.up('w69') = 0.6 * x.l('x9');
x.lo('w610') = -200;
x.up('w610') = 200;

x.lo('w71') = -4.5 * x.l('x1');
x.up('w71') = 4.5 * x.l('x1');
x.lo('w72') = -12 * x.l('x2');
x.up('w72') = 12 * x.l('x2');
x.lo('w73') = -10.6 * x.l('x3');
x.up('w73') = 10.6 * x.l('x3');
x.lo('w74') = -0.47 * x.l('x4');
x.up('w74') = 0.47 * x.l('x4');
x.lo('w75') = -15 * x.l('x5');
x.up('w75') = 15 * x.l('x5');
x.lo('w76') = -8.5 * x.l('x6');
x.up('w76') = 8.5 * x.l('x6');
x.lo('w77') = -37 * x.l('x7');
x.up('w77') = 37 * x.l('x7');
x.lo('w78') = -46 * x.l('x8');
x.up('w78') = 46 * x.l('x8');
x.lo('w79') = -19.5 * x.l('x9');
x.up('w79') = 19.5 * x.l('x9');
x.lo('w710') = -300;
x.up('w710') = 300;

* Equations for the model
Equations
    eq1 objective_function,
    eq2(j) nutritional_requirements;

* Objective function
eq1.. z =e= sum(i, c(i) * x(i) + wc(i));
* Constraints for the nutritional requirements
eq2(j).. sum(i, A(i, j) * x(i)) =l= b(j);

* Model for the robust counterpart
Model problem /all/;
* Solve the model using the lp solver
Solve problem using lp minimizing z;
* Display the results
Display x.l, z.l;




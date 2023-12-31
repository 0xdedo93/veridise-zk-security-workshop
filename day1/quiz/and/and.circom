pragma circom 2.0.0;

template Multiplier2(){
   //Declaration of signals
   signal input in1;
   signal input in2;
   signal output out;

   //Statements.
   out <== in1 * in2;
}

template binaryCheck () {
   //Declaration of signals.
   signal input in;
   signal output out;

   //Statements.
   in * (in-1) === 0;
   out <== in;
}

template And2(){
   //Declaration of signals and components.
   signal input in1;
   signal input in2;

   signal output out;

   component mult = Multiplier2();
   component binCheck[2];

   //Statements.
   binCheck[0] = binaryCheck();
   binCheck[0].in <== in1; // in1 = 0/1
   binCheck[1] = binaryCheck();
   binCheck[1].in <== in2; // in2 = 0/1
   
   mult.in1 <== binCheck[0].out; // 1/0
   mult.in2 <== binCheck[1].out; // 1/0
   out <== mult.out; // 1/0
}

component main = And2();


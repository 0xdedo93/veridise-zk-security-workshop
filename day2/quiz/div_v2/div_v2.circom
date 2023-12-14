// Borrowed from circomlib: Checks if input signal in equals to zero.
// It sets signal out to 1 is in is zero and to 0 otherwise.
template IsZero() {
    signal input in;
    signal output out;

    signal inv;

    inv <-- in !=0 ? 1 / in : 0;

    out <== -in*inv +1;
    in*out === 0;
}

template div() {
    signal input x1;
    signal input x2;
    signal output o;

    component isZero = IsZero();

    isZero.in <== x2;
    // this prevents division by zero, assert error here if dividing by 0
    isZero.out === 0;

    o <-- x1 / x2; 
    // it would throw error here if we remove previous check isZero.out === 0;
    o * x2 === x1;
}

component main = div();


// 4/2 : 2
// 4/1 : 4
// 4/0 : Error: Assert Failed. Error in template div_1 line: 23
// still failing, see README.md
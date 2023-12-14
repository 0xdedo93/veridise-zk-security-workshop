template div() {
    signal input x1;
    signal input x2;
    signal output o;  
    o <-- x1 / x2;  
    // this prevents division by zero, assert error here if dividing by 0
    o * x2 === x1;
}

component main = div();

// 4/2 : 2
// 4/1 : 4
// 4/0 : Error: Assert Failed. Error in template div_0 line: 6
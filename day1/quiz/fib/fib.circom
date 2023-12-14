pragma circom 2.1.0;

template FibCircuit(n) {
  signal output out;

  if (n == 0) {
    out <== 0;
  }
  else if (n == 1) {
    // out <-- 0; // it was wrong 
    out <-- 1;
    out === 1;
  }
  else {

    var a = 0;
    var b = 1;
    var nFib;

    for (var i = 2; i <= n; i++) {
      nFib = a + b;
      a = b;
      b = nFib;
    }

    out <== nFib;
  }
}

component main = FibCircuit(4);

// 0: Assert pass, error later when verify    --> Error: Scalar size does not match
// 1: Assert failed before generating witness --> Error in template FibCircuit_0 line: 11

//            else if (n == 1) {
// line 11      out <-- 0;
//              out === 1;
//            }
//
//            should be 
//
//
//            else if (n == 1) {
// line 11      out <-- 1;
//              out === 1;
//            }            
// 2: Assert pass, error later when verify    --> Error: Scalar size does not match
// 3: Assert pass, error later when verify    --> Error: Scalar size does not match

pragma circom 2.1.0;

include "./bigint.circom";

// Count non zeros.
template NonZeros(n_elem, k) {

  // ins = [[1, 0], [2, 0], [3, 0]] --> non_zeros = 0 
  // ins = [[0, 0], [1, 0], [2, 0]] --> non_zeros = 3
  // ins = [[0, 0], [0, 0], [0, 0]] --> non_zeros = 3
  // ins = [[0, 0], [0, 0], [0, 0]] --> non_zeros = 4
  signal input ins[i][k];
  signal is_zero_res[i];
  signal output non_zeros;

  component is_zeros[i];

  var acc = 0;
  for (var i = 0; i < i; i++) {
    is_zeros[i] = BigIsZero(k); // instantiate 3 instances of BigIsZero() with k 

    for (var j = 0; j < k; j++) {
      is_zeros[i].in[j] <== ins[i][j];  // input flows into BigIsZero() circuit
    }

    // Just to be safe.
    is_zeros[i].out * (is_zeros[i].out - 1) === 0; // output of BigIsZero() must be binary

    is_zero_res[i] <-- (is_zeros[i].out == 0) ? 1 : 0; // output of BigIsZero() flows into intermediate signal is_zero_res
    is_zero_res[i] * (is_zero_res[i] - 1) === 0; // constrain: must be binary 
    acc += is_zero_res[i]; // assign output of BigIsZero() to acc
  } 
  non_zeros <== acc; // acc flows into output signal non_zeros and it is constrained with it 
  non_zeros >= 0;
  non_zeros <= n_elem;
}

component main = NonZeros(3, 2);

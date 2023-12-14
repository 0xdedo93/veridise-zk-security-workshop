pragma circom 2.0.7;
// prime = 53

template Bits(n) {
    signal input in; // 001
    signal output out[n];
    var lc = 0;
    var e2 = 1;
    for (var i = 0; i < n; i++) {
        out[i] <-- (in >> i) & 1;
        out[i]*(out[i] - 1) === 0
        lc += out[i] * e2;
        e2 = e2 + e2;
    }
    in === lc;
}
component main = Bits(3);
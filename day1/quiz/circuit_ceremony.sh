CIRCUIT_NAME=$1

cd ${CIRCUIT_NAME}/${CIRCUIT_NAME}_js/

# gen witness
node generate_witness.js ${CIRCUIT_NAME}.wasm ${CIRCUIT_NAME}_input.json ${CIRCUIT_NAME}_witness.wtns

# snarkjs ceremony phase1
snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v
snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

# snarkjs ceremony phase2
snarkjs groth16 setup ../${CIRCUIT_NAME}.r1cs pot12_final.ptau ${CIRCUIT_NAME}_0000.zkey
snarkjs zkey contribute ${CIRCUIT_NAME}_0000.zkey ${CIRCUIT_NAME}_0001.zkey --name="1st Contributor Name" -v
snarkjs zkey export verificationkey ${CIRCUIT_NAME}_0001.zkey ${CIRCUIT_NAME}_verification_key.json

echo "[+] Ceremony done, now run ./circuit_verifier.sh"

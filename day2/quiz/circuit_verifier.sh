CIRCUIT_NAME=$1

cd ${CIRCUIT_NAME}/${CIRCUIT_NAME}_js/

# generate proof
snarkjs groth16 prove ${CIRCUIT_NAME}_0001.zkey ${CIRCUIT_NAME}_witness.wtns ${CIRCUIT_NAME}_proof.json ${CIRCUIT_NAME}_public.json

# verify proof
snarkjs groth16 verify ${CIRCUIT_NAME}_verification_key.json ${CIRCUIT_NAME}_public.json ${CIRCUIT_NAME}_proof.json
CIRCUIT_NAME=$1

cd ${CIRCUIT_NAME}

# compile
circom ${CIRCUIT_NAME}.circom --r1cs --wasm --sym --c

echo "{}" > ${CIRCUIT_NAME}_js/${CIRCUIT_NAME}_input.json

echo "[+] Compile done, now change ${CIRCUIT_NAME}_input.json and run ./circuit_ceremony.sh"
CIRCUIT_NAME=$1

cd ${CIRCUIT_NAME}/

snarkjs r1cs info ${CIRCUIT_NAME}.r1cs
snarkjs r1cs print ${CIRCUIT_NAME}.r1cs ${CIRCUIT_NAME}.sym

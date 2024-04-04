PRIME=21888242871839275222246405745257275088548364400416034343698204186575808495617 # 254 bit
# PRIME=57896044618658097711785492504343953926634992332820282019728792003956566065153 # 256 bit
SCRIPT_DIR=$(dirname "$0")
T=1
# MEASURE_COMMUNICATION="-- --batch-size 100"

# Without preprocessing.
for PROG in ciminion gmimc hades_mimc hydra mimc rescue
do
(
    printf "\n$PROG\n"
    cd "$SCRIPT_DIR" \
    && ./compile.py -O -P $PRIME $PROG $T \
    && ./Scripts/mal-shamir-offline.sh $PROG \
    && ./Scripts/mal-shamir.sh -F $PROG
) 2>&1 | tee "log/eval_$PROG.log"
done

# With preprocessing.
for PROG in ciminion gmimc hades_mimc hydra mimc rescue
do
(
    cd "$SCRIPT_DIR" \
    && ./Scripts/compile-run.py -O -P $PRIME -E mal-shamir $PROG $T $MEASURE_COMMUNICATION
) 2>&1 | tee "log/eval_${PROG}_pre.log"
done
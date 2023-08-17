PRIME=21888242871839275222246405745257275088548364400416034343698204186575808495617
SCRIPT_DIR=$(dirname "$0")

# Without preprocessing.
for PROG in ciminion gmimc hades_mimc hydra mimc rescue
do
(
    cd "$SCRIPT_DIR" \
    && ./compile.py -O -P $PRIME $PROG 2 \
    && ./Scripts/mal-shamir-offline.sh $PROG \
    && ./Scripts/mal-shamir.sh -F $PROG
) 2>&1 | tee "log/eval_$PROG.log"
done

# With preprocessing.
for PROG in ciminion gmimc hades_mimc hydra mimc rescue
do
(
    cd "$SCRIPT_DIR" \
    && ./Scripts/compile-run.py -O -P $PRIME -E mal-shamir $PROG 2
) 2>&1 | tee "log/eval_${PROG}_pre.log"
done
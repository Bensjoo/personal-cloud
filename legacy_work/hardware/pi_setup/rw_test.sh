echo "# ----------  R/W test --------- #"
echo "testing write speeds"
dd if=/dev/zero of=~/test.tmp bs=500K count=1024

echo "\n\n"
echo "testing read speeds"
dd if=~/test.tmp of=/dev/null bs=500K count=1024

echo "# -------- END R/W test -------- #"
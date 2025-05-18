PROJECTNAME=TEST
BOARD_FREQ=12
FPGA_PACKAGE=sg48
yosys -q -DICE_BREAKER -DNEGATIVE_RESET -DBOARD_FREQ=$BOARD_FREQ -DCPU_FREQ=20 -p "synth_ice40 -abc9 -device u -dsp -top $PROJECTNAME -json $PROJECTNAME.json" test.v
nextpnr-ice40 --force --json $PROJECTNAME.json --pcf icebreaker.pcf --asc $PROJECTNAME.asc --freq $BOARD_FREQ --up5k --package $FPGA_PACKAGE --pcf-allow-unconstrained
icetime -p icebreaker.pcf -P $FPGA_PACKAGE -r $PROJECTNAME.timings -d up5k -t $PROJECTNAME.asc
icepack $PROJECTNAME.asc $PROJECTNAME.bin 
iceprog $PROJECTNAME.bin
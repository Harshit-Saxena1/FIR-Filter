# FIR-Filter
Finite Impulse Response (FIR) Filter along with its testbench designed using Verilog HDL
This project implements a Finite Impulse Response (FIR) filter using Verilog. The FIR filter is designed with four taps, each having a coefficient value of '6'b100000'. The module takes a 16-bit input signal and performs a weighted sum of the current and past three input samples using a series of delay registers and multipliers. The filter operates synchronously with a clock signal and produces a 16-bit filtered output.

The FIR filter module instantiates a set of D Flip-Flops to implement the delay line, ensuring that previous samples are stored and used in computation. The multiplication with filter coefficients is performed using Verilog’s arithmetic operators, and the results are summed to generate the final filtered output.

A corresponding testbench is included to verify the functionality of the FIR filter. It initializes a clock with a 20ns period and reads input data from a file named 'signalinfo.data'. The testbench iterates through a memory array containing 32 stored samples, feeding them into the FIR filter sequentially on every positive clock edge. The filtered output is observed and stored for analysis. Waveform generation is enabled using '$dumpfile' and '$dumpvars' to assist in debugging.

Reset functionality is incorporated to ensure proper initialization. A brief reset pulse is applied at the start of the simulation to clear registers before processing input samples. The testbench ensures a continuous stream of input data, looping back to the first sample after reaching the end of the stored dataset.

This implementation is useful for signal processing applications that require filtering of digital signals in hardware, such as noise reduction or feature extraction.

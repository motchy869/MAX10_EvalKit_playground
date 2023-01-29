The following Altera Development Kit has been identified with an issue described below.

Altera part number:  EK-10M08E144ES/P
Serial numbers affected:  0 – 1,000

Issue:
The OP AMP devices on these boards (board designators U3 and U4: part number - LM2902DR2; produced by ON Semiconductor) have an output limit of approximately 1.95 to 2.0 Volts. The maximum allowable input to the 10M08 FPGA ADC IP is 2.5V. 

Fix:
If your application requires the full voltage range of 0 - 2.5V, we recommend these devices be replaced.  Altera has identified the following device: Microchip MCP6244-E/SL as pin-for-pin replacement which will provide the full 0 - 2.5V output range.




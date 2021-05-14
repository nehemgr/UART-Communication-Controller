# UART-Communication-Controller
This project is a simulation of the UART controller where 4 bits of data are transmitted between two transmitting and receiving processors, implemented using Verilog. The user can change the data being transmitted from the testbench and also test the effects of introducing parity error and break error.

## Running the Project
Make sure you have Vivado 2019.1 or above installed on your system. Open the UART_Controller.xpr file and run the simulation.
* To change the data being transmitted, edit **Line 16** in **UART_testbech.v** with the required data.
* To introduce a break error (a zero is transmitted for the Stop Bit), uncomment **Line 25** in **Processor_TX.v**.
* To introduce a parity bit error, uncomment **Line 24** in **Processor_TX.v**.

## Project Demo
![alt text](<https://github.com/nehemgr/UART-Communication-Controller/blob/main/Files/Correct.JPG>)

## Results
The frequency deviation between the host and receiver were progressively increased and the observations are tabulated below.

![alt text](<https://github.com/nehemgr/UART-Communication-Controller/blob/main/Files/Result.JPG>)

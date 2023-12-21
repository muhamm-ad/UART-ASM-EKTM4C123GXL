# UART Communication in Assembly with `EK-TM4C123GXL`

This project involves programming `UART` (Universal Asynchronous Receiver/Transmitter) communication in assembly language, interfacing with a computer using the `EK-TM4C123GXL` development board. The primary objective is to create a loop of communication that receives and sends back a word via `UART`.

It includes code for setting up `UART` communication on the [`EK-TM4C123GXL`](<https://www.ti.com/tool/EK-TM4C123GXL?utm_source=google&utm_medium=cpc&utm_campaign=epd-null-null-44700045336317881_prodfolderdynamic-cpc-pf-google-wwe_int&utm_content=prodfolddynamic&ds_k=DYNAMIC+SEARCH+ADS&DCM=yes&gad_source=1&gclid=CjwKCAiAgeeqBhBAEiwAoDDhn89vVeOLIxNI2qSjdsr0GKkB-iJgJ9ALPvzrPMFoXhpFbyaHh1NP3hoCj5QQAvD_BwE&gclsrc=aw.ds>) board. It involves configuring the system control and `GPIO` for `UART` functionality, managing `UART0` and `GPIOA` for communication, and handling data transmission and reception with appropriate buffer checks.

## How to Run the Code

1. **Setup the Development Environment:** Ensure that you have the Keil µVision IDE installed for ARM development. This software is used for writing, compiling, and debugging the assembly code.

2. **Load the Code:** Open the provided assembly file in the Keil IDE.

3. **Connect the `EK-TM4C123GXL` Board:** Connect your `EK-TM4C123GXL` development board to your computer.

4. **Compile and Upload:** Compile the code in the Keil IDE and upload it to the `EK-TM4C123GXL` board. The IDE should handle the process of compiling and transferring the binary to the board.

5. **Run and Test:** Once uploaded, the program will start running. You can test the UART communication by sending data from your computer and observing the echoed response.

## Device Architecture and ARM Instructions

The [`EK-TM4C123GXL`](<https://www.ti.com/tool/EK-TM4C123GXL?utm_source=google&utm_medium=cpc&utm_campaign=epd-null-null-44700045336317881_prodfolderdynamic-cpc-pf-google-wwe_int&utm_content=prodfolddynamic&ds_k=DYNAMIC+SEARCH+ADS&DCM=yes&gad_source=1&gclid=CjwKCAiAgeeqBhBAEiwAoDDhn89vVeOLIxNI2qSjdsr0GKkB-iJgJ9ALPvzrPMFoXhpFbyaHh1NP3hoCj5QQAvD_BwE&gclsrc=aw.ds>) development board is based on `ARM Cortex-M4` architecture. This project utilizes specific ARM instructions compatible with this architecture. For a detailed understanding of these instructions, refer to the ARM instruction set documentation [ARM Instruction Set Documentation](https://developer.arm.com/documentation/ddi0439/b/Programmers-Model/Instruction-set-summary/Cortex-M4-instructions?lang=en).

## References

1. **[EK-TM4C123GXL Documentation:](https://www.ti.com/lit/ds/spms376e/spms376e.pdf?ts=1703108436329&ref_url=https%253A%252F%252Fwww.ti.com%252Ftool%252FEK-TM4C123GXL%253Futm_source%253Dgoogle%2526utm_medium%253Dcpc%2526utm_campaign%253Depd-null-null-44700045336317881_prodfolderdynamic-cpc-pf-google-wwe_int%2526utm_content%253Dprodfolddynamic%2526ds_k%253DDYNAMIC%2BSEARCH%2BADS%2526DCM%253Dyes%2526gad_source%253D1%2526gclid%253DCjwKCAiAgeeqBhBAEiwAoDDhn89vVeOLIxNI2qSjdsr0GKkB-iJgJ9ALPvzrPMFoXhpFbyaHh1NP3hoCj5QQAvD_BwE%2526gclsrc%253Daw.ds)** For understanding the specifics of the development board and its peripherals.

2. **[ARM Instruction Set:](<https://developer.arm.com/documentation/ddi0439/b/Programmers-Model/Instruction-set-summary/Cortex-M4-instructions?lang=en>)** Comprehensive reference for the ARM instructions used in this project. [ARM Instruction Set Documentation].

3. **[Keil µVision IDE:](<https://www.keil.com/>)** The integrated development environment used for this project.

## Authors

* [muhamm-ad · GitHub](https://github.com/muhamm-ad)

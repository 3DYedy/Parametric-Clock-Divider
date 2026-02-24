# Parametric-Clock-Divider

## 1. Project Overview
This project implements a synchronous frequency divider in **SystemVerilog**, designed to produce a stable square wave with a **50% duty cycle**. 

-

## 2. Design Architecture (RTL)
The design follows a modular hierarchy integrated into a single `TOP` module for streamlined simulation.

### Key Components:
* **Counter:** A 30-bit synchronous counter that tracks clock cycles.
* **Comparator:** A digital logic block that triggers an "Enable" signal when the counter reaches the `LIMIT` value.
* **Toggle Flip-Flop:** A synchronous memory element that inverts the output state to create the final frequency.

### Reference Schematic
<img width="982" height="398" alt="image" src="https://github.com/user-attachments/assets/98301d88-701f-426d-9aff-797d2abcee1a" />

-

## 3. Technical Enhancements & Optimization

* **Clock Synchronization:** The Toggle-FF is triggered by `posedge clk` rather than the comparator output. 
* **Enable Logic:** The signal from the comparator acts as a synchronous **Enable** for the T-FF, ensuring the output state changes only at the precise clock edge.
* **Active-High OR Reset:** Implemented an OR-gate logic to combine the external manual reset with the internal auto-reset from the comparator.

-

## 4. Verification & Waveform Analysis

### Simulation Results:
* **Input Clock:** 100MHz (10ns period).
* **Target Limit:** Set to `9` to compensate for the 1-cycle synchronous delay.
* **Observed Result:** A precise **100ns** High-time and **100ns** Low-time, resulting in a successful 5MHz output (division by 20).

<img width="845" height="135" alt="image" src="https://github.com/user-attachments/assets/6c4675db-82b8-4d79-b3c0-aeec3e4ef608" />



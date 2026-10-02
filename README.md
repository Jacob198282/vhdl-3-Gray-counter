# N-bit Gray counter

N-bit Gray counter is a project written in Vivado using VHDL language. It is created to work with Basys3 board. You can check information about this board [here](https://digilent.com/reference/programmable-logic/basys-3/start).

## How it works
Ports of this project are as below:
```vhdl
entity gray_count is
    Port ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end gray_count;
```
`clk_i` is connected to BTNC (middle) button on the board and acts as a clock of the design

`rst_i` is connected to BTNR (right) button on the board and acts as asynchronous reset

`led_o` is output of the Gray counter and is connected to diodes on the board:
+ LD0 diode - 0 bit of Gray counter (`led_o(0)`),
+ LD1 diode - 1 bit of Gray counter (`led_o(1)`),
+ LD2 diode - 2 bit of Gray counter (`led_o(2)`).

By clicking on the mechanical button a clock signal is generated. Counter is counting on every rising edge of the clock signal.

## Video presentation

## Installation and implementation
Installation guide is based on [adiuvoengineering.com](https://www.adiuvoengineering.com/post/microzed-chronicles-working-with-vivado-and-git) guide.

1. Clone the repository.
2. Open the project (xpr file) using Vivado.
3. The project should load within couple of minutes.
4. Run Synthesis [TODO - photo].
5. After successful synthesis Run Implementation [TODO - photo].
6. After successful implementation Generate Bitstream [TODO - photo].
7. Make sure that jumper on the Basys3 board is switched to power from USB. [TODO - photo] Plug in Basys3 board to the computer.
8. Open Hardware Manager and load the project to the board.

## Requirements
1. Computer with Windows or Linux (I was using Windows).
2. Vivado 2022.2 or newer (project was made using this version of Vivado). Keep in mind that version 2024 had some trouble with Basys3 boards.
3. Basys3 board.
4. MicroUSB cable that can transmit data.

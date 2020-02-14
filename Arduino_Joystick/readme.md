

## Instructions

### Arduino IDE

1. Download and install the [Arduino IDE](https://www.arduino.cc/en/Main/Software)
2. Double check that the right Arduino settings are selected. Under **Tools**:
    * Board should say "Arduino Nano"
    * Processor should say "ATmega328P (Old Bootloader)"
    * Port (pick one that makes sense for your computer)
3. Try to program your Arduino with:
    * Examples > 01.Basic > Blink
4. If you got a message that says **Done Uploading**, your Arduino should be programmed. Make sure the LED on the board is blinking at 1 second intervals. 
4. If you are having problems, you might need to update the CH340 serial driver. [Instructions here](https://learn.sparkfun.com/tutorials/how-to-install-ch340-drivers/all#drivers-if-you-need-them).
5. Once you are sure your Arduino is programmable move on to the next step.

### Build Your Joystick

1. It's time to solder the header pins to the Arduino board. Place the headers in the breadboard and use the breadboard itself to align the pins to Arduino. Solder them.  
2. Wire up switch like this:

```
              5V        NANO    
            ───┬──   ┌─────────┐
               │     │         │
               │     │         │
               │     │         │
     SWITCH    │     │         │
    ┌───────┐  │     │         │
    │  .─.  ├──┘     │         │
    │ (   ) │        │         │
    │  `─'  ├──┬─────┤ D2      │
    └───────┘  │     │         │
               ╱     │         │
               ╲     │         │
          10K  ╱     │         │
               ╲     │         │
               │     │         │
             ──┴──   └─────────┘
              ───               
               ─                
```


7. Run **A_Button** sketch to make sure the switch was wired correctly. You can see the switch working on the Arduino serial monitor. 

8. Now wire the joystick module:

    | Arduino  | Joystick |
    |----------|----------|
    |  Pin A3  |   VRX    |
    |  Pin A2  |   VRY    |
    |  Pin D3  |    SW    |

9. Run **A_JoystickModule**  to make sure the joystick was wired correctly. You can look at the serial monitor for changing values.
10. If you ever unsure if you are having a problem with your code or with the electronics, you can return to this basic Helper apps to test your hardware.
11. Once everything has been wired, run A_Joystick and P_Joystick to play the game using either the joystick or the keyboard.

## Add a Second Player 

A rotary encoder might be a better interface for the 1D game example. To use it, follow these steps:

1. Wire the Rotary Encoder:

    | Arduino  | Encoder |
    |----------|---------|
    |  Pin A0  |    DT   |
    |  Pin A1  |   CLK   |
    |  Pin D4  |    SW   |

2. Install the RotaryEncoder library by Matthias Hertel, under:
    * Sketch > Include Library > Manage Libraries
3. Run **A_RotatyEncoderModule** under Helper
4. Verify in the serial monitor that the rotary encoder works as expected.
5. Now, modify the 1D game to read the encoder input for controlling the second player.

## Next Steps

Here are some things to try:

1. How about adding some acceleration to the player movement?
2. How about making the player movement **modal** and only enabled when a button is pressed.
3. How do different input modalities change the user experience?



## Materials List

In case you are wondering, these are the materials we are using in class:

- [Arduino Nano](https://www.amazon.com/gp/product/B07GPPK4DK/ref=ox_sc_act_image_1?smid=A11W5SUD02WAA6&psc=1)
- [Breadboard](https://www.amazon.com/gp/product/B0819VF8T3/ref=ppx_yo_dt_b_asin_title_o00_s03?ie=UTF8&psc=1)
- [USB Cables](https://www.amazon.com/gp/product/B07J9WTJFQ/ref=ppx_yo_dt_b_asin_title_o00_s03?ie=UTF8&psc=1)
- [Double sided tape](https://www.amazon.com/gp/product/B0007P5G8Y/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
- [Resistor 10K](https://www.amazon.com/gp/product/B0185FIOTA/ref=ppx_yo_dt_b_asin_title_o00_s01?ie=UTF8&psc=1)
- [Switches](https://www.amazon.com/gp/product/B07NWDHH41/ref=ppx_yo_dt_b_asin_title_o00_s02?ie=UTF8&psc=1)
- [Joystick Breakout Module](https://www.amazon.com/gp/product/B01N59MK0U/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
- [Rotary Encoder Module](https://www.amazon.com/gp/product/B06XQTHDRR/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
- [LEDs](https://www.amazon.com/gp/product/B0739RYXVC/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
- [Resistor 330 Ohms](https://www.amazon.com/gp/product/B0185FID32/ref=ppx_yo_dt_b_asin_title_o00_s01?ie=UTF8&psc=1)
- [Wires](https://www.amazon.com/gp/product/B081H2JQRV/ref=ppx_yo_dt_b_asin_title_o00_s01?ie=UTF8&psc=1)



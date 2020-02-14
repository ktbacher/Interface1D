/*


  Based on this code:
  http://www.arduino.cc/en/Tutorial/SerialCallResponse
*/

#include <RotaryEncoder.h>

#define buttonPin 2   // button switch is connected to pin 2
#define joyXPin A0    // joystick X axis is connected to pin A2
#define joyYPin A1    // joystick Y axis is connected to pin A3

RotaryEncoder encoder(A3, A4);

int button = 0;
int joyX = 0;
int joyY = 0;
int pos = 0;

int inByte = 0;         // incoming serial byte



void setup() {
  
  Serial.begin(57600);      // start serial port at 57600 bps:
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  pinMode(buttonPin, INPUT);   // button is on digital pin 2
  
  establishContact();  // send a byte to establish contact until receiver responds
}



void loop() {
 
  // if we get a valid byte response from Processing, then we read analog ins:
  if (Serial.available() > 0) {
    
    inByte = Serial.read();          // get incoming byte:

    joyX = analogRead(joyXPin) / 4;  // read axis X, divide by 4 to make the range 0-255
    delay(10);                      // delay 10ms to let the ADC recover
    joyY = analogRead(joyYPin) / 4;  // read  axis Y, divide by 4 to make the range 0-255

    button = map(digitalRead(2), 0, 1, 0, 255);   // now read the button, map it to 0 or 255 to make things simpler


    encoder.tick();
    pos = encoder.getPosition();
    
    // Then send all this data to Processing
    Serial.write(joyX);
    Serial.write(joyY);
    Serial.write(button);
    Serial.write(pos+125);
  }
}



void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
}


// This is used to aggregrate visual information from all objects before we display them. 
// First we populate the buffer and then we show it.
// This is particularly helpful once you start outputting your game to an LED strip, of if you want to have two separate 'screens'

class DisplayBuffer { 

  int displaySize;
  color[] displayBuffer;
  color initColor = color(0, 0, 0);    // just starts empty

  // Constructor sets initial size and frame for buffer
  DisplayBuffer (int _size) { 

    displaySize = _size;
    displayBuffer = new color[displaySize];

    for(int i = 0; i < displaySize; i++) {    // initialize display with black
      displayBuffer[i] = initColor; 
    }

  } 

  // Color a specific pixel in the buffer
  void setPixel(int  _index, color _c) {
    displayBuffer[_index]  = _c;
  }


  // Color all pixels in the buffer
  void setAllPixels(color _c) {
     
    for(int i = 0; i < displaySize; i++) { 
      display.setPixel(i, _c); 
    }
  }

  // Now write it to screen
  void show() { 

    for(int i = 0; i < displaySize; i++) {
      fill(displayBuffer[i]);
      rect(i*displayPixelSize, 0, displayPixelSize, displayPixelSize);
    }
  } 

  // Let's empty everything before we start adding things to it again
  void clear() {

    for(int i = 0; i < displaySize; i++) {    
      displayBuffer[i] = initColor; 
    }
  }

} 

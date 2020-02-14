
# 1D Interface

A 1D Interface is a graphical user interface made from a single row of pixels and where it's NOT possible to display symbolic content (e.g. text, icons, etc).

 Its simplicity provides a great platform for learning some of the fundamental ideas behind interface design. 

# Concepts

### Feedback

Similar to objects in the physical world, every user action causes a corresponding reaction or response from the interface. The opposite (e.g. the user presses a button and nothing happens) leads to confusing and the impression that something is broken. 

### Spatial Mapping

Users naturally create a physical map in their mind of where interface elements are located (e.g. *the button on the left top corner closes the window*, or *the trash can is at the bottom right*). Once you've established spatial relationships, breaking them can confuse a user. However, they don't need to be simple. In the 1D game, the space is a continuous circle and the screen 'loops back': exiting on the right makes you re-enter on the left, and vice-versa.

### Relationships
Establish relationships between elements using forms and colors consistenly. For example, when the purple player wins, the screen is filled with the color purple. 


### States
A clear state machine helps users create a clear mental model of what your software is doing. Feedback becomes predictable which makes an interface easier to use and  creates a better experience.



# Instructions

1. If you haven't yet, download and install Processing.
2. Download this game.
3. Install the **gifAnimation** library by following the *Manual Install* instructions [here](https://github.com/processing/processing/wiki/How-to-Install-a-Contributed-Library)
4. Run it. 
5. Instructions:
    * Keyboard keys **A** and **D** move Purple Player left and right.
    * Keys **J** and **L** move Green Player. 
    * First player to catch the Yellow Target 3 times wins.  
    * Winning color takes over the screen.
    * Press **R** for re-starting the game. 


# Interface Architecture

1D Interface separates:
1. The interface structure (state machine, event listener, etc) from...
2. The game structure (playing, score keeping, etc) from... 
3. The particularies of the hardware you are using (keyboard vs. joystick, display vs. LED strip). 

This makes it easier to prototype an interaction using your computer and then slowly adding to it a custom joystick and custom display.

## Logic

Every element in the game is an Object which encapsulates core data and provides some internal functionalities. Here are the main ones:

**Player** 
Object that moves when user performs an action on keyboard. It keeps track of its own score and position.

**Target**
Shows up in random places and waits to be caught by Player. When Player occupies the same pixel as the Target, it gains a point.

**Score**
Keeps track of the winner.

**Controller**
Most important object. Acts as the connection between all the other objects and contains the state machine where the game logic lives. Keyboard events live in Controller.pde. 

**DisplayBuffer**
It's where we construct the image that shows up on screen. We build a frame at a time and then display it.

## Input
Keyboard input is under Controller.pde

```java 
void keyPressed() {

    int keyIndex = -1;

    if (key == 'A' || key == 'a') {
        playerOne.move(-1);
    }

    if (key == 'D' || key == 'd') {
        playerOne.move(1);
    }


    if (key == 'J' || key == 'j') {
        playerTwo.move(-1);
    }

    if (key == 'L' || key == 'l') {
        playerTwo.move(1);
    }

    if (key == 'R' || key == 'r') {
        gameState = "PLAY";
    }

}
```

## Output

Performed by DisplayBuffer.pde

Frames are created, manipulated and stored in the array:

```java
color[] displayBuffer;
```

And this method is the only piece of code that writes to the screen:

```java
  void show() { 

    for(int i = 0; i < displaySize; i++) {
      fill(displayBuffer[i]);
      rect(i*displayPixelSize, 0, displayPixelSize, displayPixelSize);
    }
  } 
```

## State Machine

Breaking your game logic into several states and connecting them into a state machine makes your code maintanable, testable, and scalable.

The state machine for the 1D Interface looks like this:


```
                   ┌───────────────┐            
           ┌──────▶│     PLAY      │            
           │       └───────────────┘            
           │             │   ▲                  
           │             │   │                  
           │   Collision │   │ Score < Max Score
           │             ▼   │                  
           │       ┌───────────────┐            
 key = "R" │       │   COLLISION   │            
           │       └───────────────┘            
           │               │                    
           │               │ Score >= Max Score 
           │               │                    
           │               ▼                    
           │       ┌───────────────┐            
           └───────│     SCORE     │            
                   └───────────────┘            
```

It uses a switch statement to breakdown each individual state. The switch (and current state) is called every single a frame from the main **draw()** function.

```java
switch (gameState) {

    case "PLAY":
        // play logic happens here
        break;

    case "COLLISION":
        // logic for displaying a collision happens here
        break;

    case "SCORE":
        // score is tallied here
        break;
    
    default:
        // this never happens
        break;

}
```

To change states, we just need to update the gameState variable:
```java
gameState = "COLLISION";
```

## Animations

The collision animation is loaded from an animated GIF like this:

```java
animation = Gif.getPImages(this, "Animation.gif");
```


And is played by these two pieces of code:

```java
    // play  animation one frame at a time
    int frameToShow = nextFrame(animation.length);

    // loop through every pixel in frame and add to buffer
    for (int i = 0; i < animation[0].width; i++) {    
        
        display.setPixel(i,animation[frameToShow].pixels[i]);
    }  
```

```java
// Helper function to advance animation frames 
int nextFrame(int _animationSize) {
  if (currentFrame < _animationSize-1) {
    currentFrame++;
  } else {
    currentFrame = 0;
  }
  return currentFrame;
} 
```

# For Next Class...

You should spend some time trying a few things:

1. Change the color of a player
2. Make the display longer
3. Add more players or more targets
4. Create a new state

Now try creating your own game and behaviors. And post any questions to Piazza.





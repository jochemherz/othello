# Othello
Othello (also known as Reversi), built with [Processing for Android](https://android.processing.org/). This app rendition of the 2-player board game is perfect for killing time at a restaurant or in the waiting room... as long as you don't mind it being a little bit of an eyesore. :joy:

This app was made for Android devices, but it can also be easily configured to run on desktop computers.

### How To Play
The app doesn't contain any sort of rulebook or tutorial.
If you want to learn how Othello is played, check the official rules [here](https://www.worldothello.org/about/about-othello/othello-rules/official-rules/english).

---
## How To Install/Run
### Direct Installation
The easiest way to install the Othello app is to install the ***.apk*** file from the [**releases**](https://github.com/jochemherz/othello/releases) folder onto your Android device. On the device, find and click the ***.apk*** file to install (it might be under *Downloads* in the *My Files* app). 

### On Desktop
If you wish to **run the app on desktop**, here is a quick step-by-step: 
1. **Open the sketch** in the [Processing IDE](https://processing.org/download).
2. Under the *void setup()* section of the code, **comment out** (or delete) the first two statements.
3. **Add the line** `size(720, 900);` to set the size of the window.  
*Note:* This app was designed for Android's *portrait mode*. You can choose a different size, but doing so might cause layout issues.
4. The code should now look something like this:

```java
void setup(){
  //fullScreen();
  //orientation(PORTRAIT);
  size(720,900);
  font = createFont("PressStart2P-Regular.ttf", 48);
  textFont(font);
  ...
  }
```
5. Press the **Run** button. :smiley:

### Via the IDE
To run and install the app onto your **Android device via Processing's IDE** (for example, if you wish to modify some of the app's code), please follow these steps:
1. **Open the sketch** in the [Processing IDE](https://processing.org/download).
2. **Install/activate Android mode**  
There should be a tab which reads *Java*, under the X button which closes the window. Click on the tab and then select *Manage Modes...*  
You have opened the contribution manager. From here, select and install *Android mode for Processing 4*. Installing Android mode will also prompt you to locate or install the Android SDK.  
You can find more detailed installation instructions for Processing for Android [here](https://android.processing.org/install).
3. **Connect your Android device** Connect your Android device to the system (computer) running the Processing IDE and make sure USB debugging is enabled. This is done by going to the *About* section in your device's *Settings*,
and tapping the *Build number* 7 times. You will now have a new section called *Developer options* under *Settings*. From there, you can toggle on *USB debugging*. A notification asking to re-enable *USB debugging* 
might pop up every time you connect your Android Device to a computer.
4. Your Android device should now show up in the Processing IDE, under *Android* -> *Devices*.
5. Well done! You have now set up Android mode for Processing. Press the **Run** button to install and run the app on your device. Enjoy!

## License
This repository is licensed under a **Creative Commons Zero Universal v1 (CC0 1.0)**. Feel free to use anything in this repository as you please!

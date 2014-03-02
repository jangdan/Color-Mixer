/*Color Mixer
       by Leocarbon
  https://leocarbon.github.io
      realleocarbon@gmail.com

  Color Mixer is licensed under

  The MIT License (MIT)

  Copyright (c) 2012 ~ 2014 Leocarbon

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
  
  Color Mixer is open source!
  http://github.com/leocarbon/cm
  Use it, mod it, share it.
  Just leave the white text on the bottom right with the Creative Commons image.
  
  -----------------------------------------------------------------------------
  ui.pde
  
  Keyboard & mouse input and handling.
*/

void keyPressed(){  //If keys are pressed...
  if(key == ESC){   //Intercept the ESC key in the application
    key = 0;        //Don't quit even if ESC was pressed
  }
  
  keys[keyCode] = true; //Keys pressed are true
  
  //Reset
  if(checkKey(CONTROL) && checkKey('R')) reset(); //Reset to initial color
  if(checkKey(157)     && checkKey('R')) reset();
  
 //Scroll
  if(checkKey(CONTROL) && checkKey('S')) scroll();
  if(checkKey(157)     && checkKey('S')) scroll();
  
  if(checkKey(CONTROL) && checkKey('N')) randomColor();
  if(checkKey(157)     && checkKey('N')) randomColor();
}

void keyReleased(){ //If keys are released...
  keys[keyCode] = false; //Keys pressed are false
}

boolean checkKey(int k){
  if(keys.length >= k){
    return keys[k];  
  }
  return false;
}

/* Color Mixer
       by electricmango
  https://electricmango.github.io


  ui.pde
    Keyboard & mouse input and handling.
*/

import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;

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
  
  if(checkKey(CONTROL) && checkKey('C')) copytoClipboard("#" + hex(cp.getColorValue(),6));
  if(checkKey(157)     && checkKey('C')) copytoClipboard("#" + hex(cp.getColorValue(),6));
  
  if(checkKey(CONTROL) && checkKey('V')) hexcolor(pastefromClipboard());
  if(checkKey(157)     && checkKey('V')) hexcolor(pastefromClipboard());
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
public static void copytoClipboard(String iString) {
  StringSelection SS = new StringSelection(iString);
  Clipboard C = Toolkit.getDefaultToolkit().getSystemClipboard();
  C.setContents(SS, SS);
} public static String pastefromClipboard() {
  Clipboard C = Toolkit.getDefaultToolkit().getSystemClipboard();
  Transferable T = C.getContents(null);
  try {
    return (String)T.getTransferData(DataFlavor.stringFlavor);
  } catch (UnsupportedFlavorException UFE) {
  } catch (IOException IOE) {
  }
  return null;
}

#include "globalVar.h"
#include "ofMain.h"

#include <iostream>

BOOL isRetina,iphone5, isiPad;
float scaleWidth,scaleHeight, windowWidth,windowHeight;


enum iPhoneDeviceType {
	APPLE_DEVICE_IPHONE_RETINA,
	APPLE_DEVICE_IPHONE_NONRETINA,
	APPLE_DEVICE_IPAD_RETINA,
    APPLE_DEVICE_IPAD_NONRETINA,
    APPLE_DEVICE_IPHONE_5
};




globalVar::globalVar(){
    
    screenWidth=windowWidth; // FIX THIS SHIT 480
    screenHeight=windowHeight; //320
    // screenHeight=ofGetHeight();
    // screenWidth=ofGetWidth();
    
  marginRight=(float)screenWidth*(float)MARGINRIGHT;
  marginLeft=(float)screenWidth*(float)MARGINLEFT;
    marginTop=(float)screenHeight*(float)MARGINTOP;
  marginBottom=(float)screenHeight*(float)MARGINBOTTOM;
    
    if(isRetina){
    
     retinaScale=2;
    }else
    {
        retinaScale=1;
    }
    
    
    
    if (isRetina && isiPad){
        retinaScale =4;
     
    }
    else if (!isRetina && !isiPad){
        
        retinaScale =1;
        
    }
    else if (isRetina && !isiPad){
        
        retinaScale =2;
    
    }
    else if (!isRetina && isiPad){
        
        retinaScale =1.4;

    }else if (iphone5){
        
        retinaScale =2.36666;

        
    }
  
    

}


//--------------------------------------------------------------


void globalVar::setup(){
    
    

  
}

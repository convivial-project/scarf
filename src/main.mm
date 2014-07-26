#include "ofMain.h"
#include "ofApp.h"
#include "ofAppiOSWindow.h"

/*
int main(){
	ofAppiOSWindow * window = new ofAppiOSWindow();
    window->enableRendererES2();
    window->enableRetina();
    
	ofSetupOpenGL(window, 1024, 768, OF_FULLSCREEN);    // setup the GL context
	ofRunApp(new ofApp());                            // run app.
}
*/


#include "globalVar.h"

//========================================================================
/*
 int main( ){
 
 ofSetupOpenGL(1024,768, OF_FULLSCREEN);			// <-------- setup the GL context
 
 // this kicks off the running of my app
 // can be OF_WINDOW or OF_FULLSCREEN
 // pass in width and height too:
 ofRunApp( new testApp());
 
 }
 
 
 */

int main(){
    
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        if ([[UIScreen mainScreen] scale] > 1)
            isRetina = true;
    }
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)])
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            isiPad = true;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [UIScreen mainScreen].scale > 1)
    {
        isRetina = true;
        isiPad = true;
        
    }
    
    [pool release];
    
    if (isRetina && isiPad){
        windowWidth = 1536;
        windowHeight = 2048;
        scaleWidth =4.8;
        scaleHeight =4.2666;
    }
    else if (!isRetina && !isiPad){
        windowWidth = 320;
        windowHeight = 480;
        scaleWidth =1;
        scaleHeight =1;
    }
    else if (isRetina && !isiPad){
        windowWidth = 640;
        windowHeight = 960;
        scaleWidth =2;
        scaleHeight =2;
    }
    else if (!isRetina && isiPad){
        windowWidth = 768;
        windowHeight = 1024;
        scaleWidth =2.4;
        scaleHeight =2.13333;
    }
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        iphone5 = true;
        windowWidth = 640;
        windowHeight = 1136;
        scaleWidth =2;
        scaleHeight =2.36666;
        
    }else{iphone5=false;
        
    }
    
    cout<<windowWidth<<endl;
    
    ofAppiOSWindow * iOSWindow = new ofAppiOSWindow();

    
    
    iOSWindow->enableRetina();
    iOSWindow->enableRendererES2();
    //iOSWindow->enableAntiAliasing(4);
    ofSetupOpenGL(iOSWindow, windowWidth, windowHeight, OF_FULLSCREEN);
    ofRunApp(new ofApp());
}

#version 100

attribute vec4 position;
uniform mat4 modelViewProjectionMatrix;


uniform float time;

uniform float fluidity1;
uniform float fluidity2;
uniform int fluidity3;

uniform float colorBlendingGradientX;
uniform float colorBlendingGradientY;

uniform float addBlurSurface1;
uniform float addBlurSurface2;

uniform float addInnerSurface1;
uniform float addInnerSurface2;

uniform float moveContrast;

uniform float fillThreshold;


uniform float red;
uniform float green;
uniform float blue;

uniform int scaleWidth;
uniform int scaleHeight;

void main() {

    vec4 pos = modelViewProjectionMatrix * position;
    
    gl_Position = pos;
    
}

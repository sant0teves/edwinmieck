import oscP5.*;
OscP5 osc;
GestorSenial gestorAmp;
GestorSenial gestorPitch;
Serie s;
//-----------------------

float minAmp = 60;
float maxAmp = 90;

float minPitch = 45;
float maxPitch = 100;

float amorti = 0.9;

//--------------------
float amp = 0;
float pitch= 0;


void setup() {
  size(1000, 1000);
  noStroke();
  colorMode(HSB, 100);
  osc = new OscP5(this, 12345);
  s = new Serie();
  gestorAmp = new GestorSenial(minAmp, maxAmp, amorti);
  gestorPitch = new GestorSenial(minPitch, maxPitch, amorti);
}

void draw() {
  gestorAmp.actualizar(amp);
  gestorPitch.actualizar(pitch);
  translate(width/2, height/2);
  s.dibujar();
  
}

void oscEvent(OscMessage m) {
  if (m.addrPattern().equals("/amp")) {
    amp = m.get(0).floatValue();
    println("a: " + amp);
  }
  if (m.addrPattern().equals("/pitch")) {
    pitch = m.get(0).floatValue();
    println("p: " + pitch);
  }
}

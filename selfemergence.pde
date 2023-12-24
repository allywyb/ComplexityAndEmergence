int npts=200;
int inc=2;
int xOffset=20;
int yOffset=25;

void setup(){
size (800,1080);
background(200,200,60);
}

void draw(){
  frameRate(npts/2.5);
 // background(255);
 float centerX=width*noise(frameCount*0.01)/2+inc;
 float centerY=height*noise(frameCount*0.01+500)/2+inc;
 if(centerX>width-200&&centerY>height-200){
inc=0;}


 
  translate(centerX,centerY);
  //colorMode(HSB);
    stroke(20+20*noise(200+inc),120+30*noise(400+inc),60+20*noise(400+inc),160);
    noFill();

beginShape();
for (int i=0;i<npts;i++){
  strokeWeight(2*noise(inc+300));
  float angle=TWO_PI*i/npts;
  PVector p= new PVector(cos(angle),sin(angle));
  float radius=noise (xOffset+p.x*i*0.01,yOffset+p.y*i*0.01);
  p.mult(radius);
  vertex(50*p.x+5*inc*cos(angle),50*p.y+5*inc*sin(angle));
 //line(50*p.x+50*cos(angle),50*p.y+50*sin(angle),-50*p.x-50*cos(angle),-50*p.y-50*sin(angle));
  if(50*p.x+5*inc*cos(angle)>npts){
inc=0;
npts+=5;

endShape();
background(200,200,60);
}
}
endShape();
inc+=1;
xOffset+=0.06;
yOffset+=0.06;

if(centerX>width){
centerX=0;}
if(centerY>height){
centerY=0;}
}

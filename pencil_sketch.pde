int x=0,y=0;
int p;
PImage img;color white=#FFFFFF;
int j=0,k=0;
String pnt[];

int depth_factor=5; 

void setup(){
 p=0;
img=loadImage("w.jpg");
size(1024,768); 
pnt=new String[img.width*img.height];
background(255);
  img.loadPixels();
  img.filter(GRAY);
  img.filter(INVERT); 
  for (int x = 0; x < img.width-1; x++) {
  for (int y = 0; y < img.height-1; y++) {

      int index = x + y * img.width;

      color c = img.pixels[index];
      color c1= img.pixels[index+1];
      float b = brightness(c);
      float b1= brightness(c1);
      if (abs(b-b1)>  depth_factor)   //it doesnt have to be pixel perfect..for my requirement it has to look like a handdrawn sketch ,which it does
      { 
       pnt[k]=Integer.toString(x)+","+Integer.toString(y);k++;      //yes i know,not the best way to do it
      }
    } 
  }

}
void draw(){
 if(p<k){
  smooth();
  stroke(5,5,5);
  strokeWeight(1);
 
 frameRate(200);
  String xx=pnt[p].substring(0,pnt[p].indexOf(","));
  String yy=pnt[p].substring(pnt[p].indexOf(",")+1,pnt[p].length());p++;
  point(Integer.parseInt(xx),Integer.parseInt(yy));
}}

/*void draw(){        //use this for instant result
 
  smooth();
  stroke(5,5,5);
  strokeWeight(1);
 
 frameRate(200);
 for(int p=0;p<k;p++){
  String xx=pnt[p].substring(0,pnt[p].indexOf(","));
  String yy=pnt[p].substring(pnt[p].indexOf(",")+1,pnt[p].length());
  point(Integer.parseInt(xx),Integer.parseInt(yy));}
}
*/

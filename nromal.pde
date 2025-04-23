 // HashMap <Integer,DataBucket> distribution = new HashMap<>();
ArrayList<DataBucket> dataBucketPool = new ArrayList<DataBucket>();
int minBucket = 1000;
int maxBucket = 00;
int maxAmount = 1;
int rectWidth = 2;
boolean displayGraph = true;
void settings() {
 size(1024,720); 
}
void setup(){
   
}
void keyPressed() {
 if(key == 'd') {
   displayGraph = !displayGraph; 
 }
}
void draw(){
  if(displayGraph) {
 background(255); 
  
 text(maxAmount,40,35);
 text("min :" + minBucket + " --- " + maxBucket,20,100);
  }
 int numberoftrue = 0;
 for(int i = 0;i<1000; i++){ 
   if(chanceOf(50)) {
    numberoftrue++; 
   }
   
 }
 
 boolean found = false;
 for(DataBucket part : dataBucketPool) {
  if(part.getValue() == numberoftrue) {
    part.addPoint(1);
    found = true;
  }
  if(part.value < minBucket) {
   minBucket = part.value;
  }
  if(part.value > maxBucket) {
   maxBucket = part.value;
  }
  if(part.dataAmount > maxAmount) {
    maxAmount = part.dataAmount;
  }
  if(displayGraph) {
  part.show();
  }
 }
 if(!found) {
   DataBucket a = new DataBucket(numberoftrue);
   dataBucketPool.add(a);
   a.addPoint(1);   
   //println(numberoftrue);
 }
 if(minBucket < maxBucket && maxBucket - minBucket > 0) {
 rectWidth = (width-20)/(maxBucket-minBucket);
 //println(width/(maxBucket-minBucket));
 }
 //println(minBucket + ""+ maxBucket);
// for(DataBucket part: 
// distribution.put(numberoftrue,
 
}
boolean chanceOf(float percentage){
  if(random(100) < percentage) {
    return true;
  }
  return false;
}
/*
class Distribution {
  
  //ArrayList <DataBucket> distribution = new ArrayList <DataBucket>();
  Distribution() {
    
  }
  
  
  void show() {
    
    
  }
  
  
}
*/
class DataBucket {
  int value;
  int dataAmount;
  int lastPointId;
  int yvalue = 20;
  DataBucket(int vvalue) {
   value = vvalue; 
  }
  void addPoint(int id) {
    lastPointId = id;
    dataAmount++;
  }
  void show() {
    fill(255,0,0);
   rect(value * rectWidth - minBucket*rectWidth , height-10, rectWidth, -dataAmount * (height-30)/(maxAmount));
    fill(0);
  }
  int getValue() {
    
    return value;
  }
  
  
}
float binompdf(float trials,float p,float x) {
  if(trials<x) {
   return 1; 
  }
  int combinations = (factorial(int(trials)))/(factorial(int(x))*factorial(int(trials)-int(x)));

  
  return combinations*pow(p,x)*pow(1-p,trials-x);
}
int factorial(int x) {
  
 if(x==1) { return 1; }
 
 return x * factorial(x-1);
}

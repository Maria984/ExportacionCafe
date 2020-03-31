import controlP5.*;
PImage mapImage;
PFont letraFuente;
PFont letraFuente2;
PImage circulo;
PImage colombia;
PImage vietnam;
PImage brasil;

ControlP5 cp5;

boolean toggleValue = false;
boolean toggleValue2 = false;

Table table;
//Table table2;

int valSlider;
//int valSlider2;

int rowCount;
//int rowCount2;

String[] tiempo;
//String[] tiempo2;

int [] empleo;
//int [] empleo2;
int [] brasild;
float [] barra_brasild;

int []vietnamd;
float [] barra_vietnamd;

int maxDatoPro;
//int maxDatoPro2;

int minDatoPro;

float[] barra_empleo;
//float[] barra_empleo2;

//Círculo ruido
float resolution = 260; // how many points in the circle
float rad = 150;
float x = 1;
float y = 1;

float t = 0; // time passed
float tChange = .02; // how quick time flies

float nVal; // noise value
float nInt = 1; // noise intensity
float nAmp = 1; // noise amplitude

float r = 1;
float g = 1;
float b = 1;

PImage fnd;
boolean filled = false;
//Círculo ruido

//-------------------------------------------------------------------//



void setup(){

size(1366,768);

fnd = loadImage("fnd.png");
circulo = loadImage("circulo.png");
colombia = loadImage("colombia.png");
vietnam = loadImage("vietnam.png");
brasil = loadImage("brasil.png");

letraFuente = loadFont("AlegreyaSans-Bold-60.vlw");
letraFuente2 = loadFont("AlegreyaSans-Medium-60.vlw");
Table table = loadTable("datosInternetCompleto1.csv", "header");
//Table table2 = loadTable("datosInternetCompleto2.csv", "header");

rowCount= table.getRowCount();
//rowCount2 = table2.getRowCount();

println(rowCount + " filas en la tabla");
//println(rowCount2 + " filas en la tabla");

cp5= new ControlP5(this);

gui();

//gui2();

gui3();
gui4();

tiempo = new String [rowCount];
//tiempo2 = new String [rowCount2];



empleo = new int[rowCount];
//empleo2 = new int[rowCount2];

brasild = new int [rowCount];
barra_brasild = new float [rowCount];

vietnamd = new int [rowCount];
barra_vietnamd = new float [rowCount];

barra_empleo = new float [rowCount];
//barra_empleo2 = new float [rowCount2];



//empleo = new float [rowCount];

for (int i =0; i<rowCount; i++)
{
  TableRow row = table.getRow(i);
  
  tiempo[i] = row.getString("tiempo");
   
 
  empleo[i] = row.getInt("empleo");
  
  brasild[i]= row.getInt("brasil");
  
  vietnamd[i]= row.getInt("vietnam");
  
  
 // empleo[i] = row.getFloat("empleo");
 
   
    
    if(empleo[i] > maxDatoPro) 
    {
      maxDatoPro =  empleo[i];     
    }
    
    if(empleo[i] < minDatoPro) 
    {
      minDatoPro =  empleo[i];     
    }
    
}/*
for (int i =0; i<rowCount2; i++)
{
  TableRow row2 = table2.getRow(i);
  
  tiempo2[i] = row2.getString("tiempo");
   
 
  empleo2[i] = row2.getInt("empleo");
  
  
 // empleo[i] = row.getFloat("empleo");
 
   
    
    if(empleo2[i] > maxDatoPro2) 
    {
      maxDatoPro2 =  empleo2[i];
     
    }
    
}*/
//Círculo ruido
noiseDetail(8);
//Círculo ruido
}

//-------------------------------------------------------------------//

void draw()
{

  //background (#fff2e3);
  image(fnd,0,0);
  textFont(letraFuente,30);
 
  
  //Círculo ruido
  pushMatrix();
  translate(width/2, 290);
  

  if (filled) {
    noStroke();
    fill(0);
  } 
  else {
    noFill();
    stroke(#754a2a);
    strokeWeight(1);
  }
  nInt = map(barra_empleo[valSlider], 0, 40, 0.1, 30); // map mouseX to noise intensity
  nAmp = map(barra_empleo[valSlider], 0, 40, 0.0, 1.0); // map mouseY to noise amplitude
  
  r = map(barra_empleo[valSlider], 1, 40, 221, 117);
  g = map(barra_empleo[valSlider], 1, 40, 203, 74);
  b = map(barra_empleo[valSlider], 1, 40, 165, 42);
  
  fill(r,g,b);

  beginShape();
  for (float a=0; a<=TWO_PI; a+=TWO_PI/resolution) {

    nVal = map(noise( cos(a)*nInt+1, sin(a)*nInt+1, t ), 0.0, 1.0, nAmp, 1.0); // map noise value to match the amplitude

    x = cos(a)*rad *nVal;
    y = sin(a)*rad *nVal;

    //    x = map(a, 0,TWO_PI, 0,width);
    //    y = sin(a)*rad *nVal +height/2;

//    vertex(prevX, prevY);
    vertex(x, y);

    //    line(x,y,x,height);

//    prevX = x;
//    prevY = y;
    
    }
  endShape(CLOSE);

  t += tChange;
  popMatrix();
  //Círculo ruido
  //Círculo ruido2
  /*
  pushMatrix();
  translate(width/4+670, 300);
  

  if (filled) {
    noStroke();
    fill(0);
  } 
  else {
    noFill();
    stroke(0);
    strokeWeight(1);
  }
  nInt = map(barra_empleo2[valSlider2], 0, 40, 0.1, 30); // map mouseX to noise intensity
  nAmp = map(barra_empleo2[valSlider2], 0, 40, 0.0, 1.0); // map mouseY to noise amplitude
  
  //relleno = map(barra_empleo[valSlider], 1, 30, 0, 255);
  //fill(relleno);

  beginShape();
  for (float a=0; a<=TWO_PI; a+=TWO_PI/resolution) {

    nVal = map(noise( cos(a)*nInt+1, sin(a)*nInt+1, t ), 0.0, 1.0, nAmp, 1.0); // map noise value to match the amplitude

    x = cos(a)*rad *nVal;
    y = sin(a)*rad *nVal;

    //    x = map(a, 0,TWO_PI, 0,width);
    //    y = sin(a)*rad *nVal +height/2;

//    vertex(prevX, prevY);
    vertex(x, y);

    //    line(x,y,x,height);

//    prevX = x;
//    prevY = y;
    
    }
  endShape(CLOSE);

  t += tChange;
  popMatrix();*/
  //Círculo ruido2
  
  
   fill(#754a2a);
  text("EXPORTACIÓN DE CAFÉ EN COLOMBIA",450,90);
  //text("Área de cultivo Boyacá",840,110);
  textFont(letraFuente2,20);
  text("Bultos de 60 kg",620,485);
  text("Puesto 1",172,540);
  text("Puesto 2",1130,540);
  drawPorcentaje();
  //drawPorcentaje2();
  drawButton();
  drawButton2();
  
  //fill(#ac8b56);
  //rect(523,558,320,168);
  image(colombia,523,558,320,168);
  
 /* if (empleo[valSlider]==12067){
    text("12067",0,200);
  }*/
  
  image(circulo,513,120,340,350);
  


}

//------------------------------------------------------------------//

void gui(){

//slider
    //"valSlider" es el nombre del controlador 
    cp5.addSlider("valSlider")
     .setPosition(408,500)
     .setWidth(550)
     //se asigna en una variable las divisiones 0-13 dependiendo el numero de filas
     .setRange(0,rowCount-1)
     //Donde empieza el controlador 10= empieza en la division 10
     .setValue(0)
     //se asigna el numero de las divisiones que va a tener el slider de 0 -13 segun el rowCount
     .setNumberOfTickMarks(rowCount)
     //flexible y fix son formas de visualisar
     .setSliderMode(Slider.FLEXIBLE)
     ;
     // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
}

/*void gui2(){

//slider
    //"valSlider" es el nombre del controlador 
    cp5.addSlider("valSlider2")
     .setPosition(701,500)
     .setWidth(550)
     //se asigna en una variable las divisiones 0-13 dependiendo el numero de filas
     .setRange(0,rowCount2-1)
     //Donde empieza el controlador 10= empieza en la division 10
     .setValue(0)
     //se asigna el numero de las divisiones que va a tener el slider de 0 -13 segun el rowCount
     .setNumberOfTickMarks(rowCount2)
     //flexible y fix son formas de visualisar
     .setSliderMode(Slider.FLEXIBLE)
     ;
     // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
}*/
void gui3(){
  cp5.addToggle("toggleValue")
  .setPosition(174,500)
  .setSize(60,15)
  ;
}

void gui4(){
  cp5.addToggle("toggleValue2")
  .setPosition(1132,500)
  .setSize(60,15)
  ;
}
//-------------------------------------------------------------------------------//


void drawPorcentaje()
{

  textFont(letraFuente2,13);
  fill(0);
  
  for (int i =0; i< rowCount; i++)
  {
  
    float x = map(i, 0, rowCount-1, 408, 958);
    
    
    pushMatrix();
    translate(x,520);
    rotate(PI/2);
    text(tiempo[i], 0, 0);
    popMatrix();
    
  
  }
  
   //tercero
   textFont(letraFuente2,46);    
    
    
        //cuarto
    fill(#3d210e);
    text(empleo[valSlider],638,302);
    
   
    
   
    
    
        //tercero    
    
    for(int i = 0; i < rowCount; i++)
    {
      
      
      //cuarto      
      barra_empleo[i] = map(empleo[i], 5218, maxDatoPro, 0, 40); 
      
      barra_brasild[i] = map(brasild[i], 5218, maxDatoPro, 0, 40);
      
      barra_vietnamd[i] = map(vietnamd[i], 5218, maxDatoPro, 0, 40);
 
    }
    
}
    
    
    
    
    
  /*  void drawPorcentaje2()
{

  textSize(13);
  fill(0);
  
  for (int i =0; i< rowCount2; i++)
  {
  
    float x = map(i, 0, rowCount2-1, 701, 1251);
    
    pushMatrix();
    translate(x,520);
    rotate(PI/2);
    text(tiempo2[i], 0, 0);
    popMatrix();
    
  
  }
  
   //tercero
   textSize(46);    
    
    
        //cuarto
    fill(255,0,0);
    text(empleo2[valSlider2],971,312);
    
   
    
    
        //tercero    
    
    for(int i = 0; i < rowCount2; i++)
    {
      
      
      //cuarto      
      barra_empleo2[i] = map(empleo2[i], 0, maxDatoPro2, 0, 40);     
 
    }
    
    
    //Aca poner la gráfica
    
   /* fill(#6aa842);
    ellipse(282,203,barra_empleo[valSlider],barra_empleo[valSlider]);
    
}*/
void drawButton()
{
  if (toggleValue==false)
    {
      
    }
    
    if(toggleValue==true) 
    {      
      //fill(255,0,0);
      //rect(54,140,300,330);
      textFont(letraFuente,57); 
      fill(#754a2a);
      text(brasild[valSlider],210,369);
      image(brasil,54,140,300,330);
    }
  }
  void drawButton2()
{
  if (toggleValue2==false)
    {
      
    }
    
    if(toggleValue2==true) 
    {     
      //fill(255,0,0);
      //rect(1012,140,300,330);
      textFont(letraFuente,57); 
      fill(#754a2a);
      text(vietnamd[valSlider],1020,361);
      image(vietnam,1012,140,300,330);
    }
  }
    
    

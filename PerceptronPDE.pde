int cantPuntos =1000;
Punto[] Puntos = new Punto[cantPuntos];
float[] XPuntos = new float[cantPuntos];
float[] YPuntos = new float[cantPuntos];
Neurona Cerebro;
float m =.5;
float b =0;
float Tam;

void setup(){
  size(600,600);
  for(int i = 0; i<Puntos.length; i++)
    Puntos[i] = new Punto(random(0,width)-width/2,
                          random(0, height)-height/2);
     Tam = width;
     Cerebro = new Neurona(2,.01);
}

void draw(){
  background(200);
  strokeWeight(0);
  line(width*.5,0,width*.5,height); 
  line(0,height*.5,width,height*.5);
  line(width/2-width/m,0,width/2+width/m,height);
  
  for(int i = 0 ; i<Puntos.length ; i++){
    XPuntos[i]= random(0, width)-width/2;
    Puntos[i].x =XPuntos[i];
    YPuntos[i]= random(0, width)-width/2;
    Puntos[i].y = YPuntos[i];
    Puntos[i].Tipo = int(Cerebro.Clasificar( Puntos[i].x/Tam, Puntos[i].y/Tam));
    Cerebro.Entrenamiento(XPuntos[i],YPuntos[i],YPuntos[i]<m*XPuntos[i]+b ? 1 : -1);
    Puntos[i].Pintar();
  }
  delay(100);
  if(frameCount==10){
    noLoop();
  }
}

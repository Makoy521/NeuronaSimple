class Neurona{
  float[] Pesos;
  float Alfa;
  
  Neurona(int n, float Tasa){
    Pesos = new float[n+1];
    for(int i=0; i<3;i++){
      Pesos[i]=random(10);
    }
    Alfa=   Tasa;
  }
  
  float Clasificar(float x, float y){
    float Suma = 0;
    for(int i =0; i<3;i++){
      if(i==0){
        Suma+=x*Pesos[i];
      }else if(i==1){
        Suma+=y*Pesos[i];
      }else{
       Suma+=Pesos[i];
      }
    }
    return f(Suma);
  }
  
  float f(float Suma){
    float ret = 1/(1+exp(Suma));
    return ret;
  }
  
  void Entrenamiento(float x, float y, int Correcto){
    float Eval= Clasificar(x,y);
    float Error = Correcto -Eval;
    Pesos[0] = Pesos[0] + Alfa*Error*x;
    Pesos[1] = Pesos[1] + Alfa*Error*y;
    Pesos[2] = Pesos[2] + Alfa*Error;
  }



}

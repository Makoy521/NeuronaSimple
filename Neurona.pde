class Neurona{
  float[] Pesos;
  float Alfa;
  
  Neurona(int n, float Tasa){
    Pesos = new float[n+1];
    Pesos[0] = random(10);
    Pesos[1] = random(10);
    Pesos[2] = random(10);
    Alfa=   Tasa;
  }
  
  float Clasificar(float x, float y){
    float Suma = 0;
    Suma += x*Pesos[0] + y*Pesos[1] + Pesos[2];
    return f(Suma);
  }
  
  float f(float Suma){
    return 1/(1+exp(-Suma));
  }
  
  void Entrenamiento(float x, float y, int Correcto){
    float Eval= Clasificar(x,y);
    float Error = Correcto -Eval;
    Pesos[0] = Pesos[0] + Alfa*Error*x;
    Pesos[1] = Pesos[1] + Alfa*Error*y;
    Pesos[2] = Pesos[2] + Alfa*Error;
  }



}

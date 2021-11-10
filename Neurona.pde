class Neurona{
  float[] Pesos;
  float Alfa;
  int N;
  
  Neurona(int n, float Tasa){
    Pesos = new float[n+1];
    for(int i=0; i<n;i++){
      Pesos[i]=random(10);
    }
    Alfa=Tasa;
    N=n;
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
    return 1/(1+exp(Suma));
  }
  
  void Entrenamiento(float x, float y, int Correcto){
    float Eval= Clasificar(x,y);
    float Error = Correcto -Eval;
    for(int i =0; i<N;i++){
      if(i==0){
        Pesos[i] = Pesos[i] + Alfa*Error*x;
      }else if(i==1){
        Pesos[i] = Pesos[i] + Alfa*Error*y;
      }else{
        Pesos[i] = Pesos[i] + Alfa*Error;
      }
    }
  }
}

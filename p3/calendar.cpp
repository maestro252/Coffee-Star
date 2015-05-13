#include <iostream>
using namespace std;

int dayofweek(int y, int m, int d){
  static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
  y -= m < 3;
  return (y + y/4 - y/100 + y/400 + t[m-1] + d) % 7;
}

int main(){
  cout << "Ingrese el año" << endl;
  int y; cin >> y;
  cout << "Ingrese el mes" << endl;
  int m; cin >> m;
  cout << "Ingrese el dia" << endl;
  int d; cin >> d;

  if((m < 1 || m > 12) || (d < 1 || d > 31)){
    cout << "la fecha ingresada no es válida" << endl;
  }else{
    int w = dayofweek(y, m, d);
    switch(w){
      case 0:
        cout << "Domingo" << endl; break;
      case 1:
        cout << "Lunes" << endl; break;
      case 2:
        cout << "Martes" << endl; break;
      case 3:
        cout << "Miercoles" << endl; break;
      case 4:
        cout << "Jueves" << endl; break;
      case 5:
        cout << "Viernes" << endl; break;
      case 6:
        cout << "Sabado" << endl; break;
      default:
        break;
    }
  }
  return 0;
}

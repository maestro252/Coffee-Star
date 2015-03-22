#include <iostream>
#include <string>
using namespace std;

string formato(float num){
  num *= 100;
  int number = (num + 0.5);
  cout << "number: " << number << endl;
  int c1, c2;
  c1 = (number % 100) / 10;
  c2 = number % 10;
  cout << "c1: " << c1 << " c2: " << c2 << endl;
	if (c1 == 0 && c2 == 0){
		number /= 100;
    return to_string(number) + ".00";
	}else{
    number /= 100;
		return to_string(number) + "." +  to_string(c1) + to_string(c2);
	}
}

int main(){
  float x;
  cin >> x;
  string out = formato(x);
  cout << out << endl;
}

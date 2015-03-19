// CoffeeStar.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <fstream>

using namespace std;

float numSalarios(float salario)
{
	float div = 2.5;
	__asm {
		MOVSS XMM0, dword ptr[salario];
		ADDSS XMM0, dword ptr[salario];
		DIVSS XMM0, dword ptr[div];
		MOVSS dword ptr[salario], XMM0;
	}
	return salario;
}

int main()
{
	ifstream in("in.txt");
	string line;
	stringstream ss;
	vector<string> names;
	vector<string> ids;
	vector<long> salaries;
	while(getline(in, line))
	{
			for(int i = 0; i < line.length() - 1; ++i){
				if(line[i] == ';') {
					ids.push_back(line.substr(0, i));
					line = line.substr(i+1, line.length() - 1);
					break;
				}
			}


			for(int j = 0; j < line.length() - 1; ++j)
			{
				if(line[j] == ';'){
					names.push_back(line.substr(0, j));
					line = line.substr(j + 1, line.length() - 1);
					break;
				}
			}
			string salaryS = line.substr(0, line.length()-1);
			stringstream s(salaryS);
			long salary;
			s >> salary;
			salaries.push_back(salary);
	}

	for(int i = 0; i < names.size(); ++i){
		cout << "Cedula: " << ids[i] << " Nombre: " << names[i] << " salario: ";
		cout << salaries[i] << endl;
	}
	ofstream out("out.txt");
	if (out.is_open())
	{
		float number = roundf(3.141592 * 100) / 100;
		out << number << endl;
		out << "This is another line.\n";
		out.close();
	}
	float number = numSalarios(5.5);
	cout << number << endl;
	cin >> number;
	return 0;
}

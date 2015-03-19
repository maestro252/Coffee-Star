// CoffeeStar.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <fstream>

using namespace std;

float totalASEmpl, totalASEmpr, totalAPEmpl, totalAPEmpr, totalSueldo, totalFSP, totalRetFuente;
float zero = 0;
string output = "";

float numSalarios(float salario)
{
	float SLMVM = 644350.0;
	float nSalarios;
	__asm {
		MOVSS XMM0, dword ptr[salario];
		DIVSS XMM0, dword ptr[SLMVM];
		MOVSS dword ptr[nSalarios], XMM0;
	}
	return nSalarios;
}

void initTotales() {
	__asm {
		MOVSS XMM0, dword ptr[zero];
		MOVSS dword ptr[totalASEmpl], XMM0;
		MOVSS dword ptr[totalASEmpr], XMM0;
		MOVSS dword ptr[totalAPEmpl], XMM0;
		MOVSS dword ptr[totalAPEmpr], XMM0;
		MOVSS dword ptr[totalSueldo], XMM0;
		MOVSS dword ptr[totalFSP], XMM0;
		MOVSS dword ptr[totalRetFuente], XMM0;
	}
}

float aporteSaludEmpl(float salario)
{
	float ase = 0.04;
	float res;
	__asm {
		MOVSS XMM0, dword ptr[salario];
		MULSS XMM0, dword ptr[ase];
		MOVSS dword ptr[res], XMM0;
		MOVSS XMM0, dword ptr[totalASEmpl];
		ADDSS XMM0, dword ptr[res];
		MOVSS dword ptr[totalASEmpl], XMM0;
	}
	return res;
}

float aporteSaludEmpr(float salario)
{
	float ase = 0.045;
	float res;
	__asm {
		MOVSS XMM0, dword ptr[salario];
		MULSS XMM0, dword ptr[ase];
		MOVSS dword ptr[res], XMM0;
		MOVSS XMM0, dword ptr[totalASEmpr];
		ADDSS XMM0, dword ptr[res];
		MOVSS dword ptr[totalASEmpr], XMM0;
	}
	return res;
}

float aportePensionEmpl(float salario)
{
	float ase = 0.04;
	float res;
	__asm {
		MOVSS XMM0, dword ptr[salario];
		MULSS XMM0, dword ptr[ase];
		MOVSS dword ptr[res], XMM0;
		MOVSS XMM0, dword ptr[totalAPEmpl];
		ADDSS XMM0, dword ptr[res];
		MOVSS dword ptr[totalAPEmpl], XMM0;
	}
	return res;
}

float aportePensionEmpr(float salario)
{
	float ase = 0.08;
	float res;
	__asm {
		MOVSS XMM0, dword ptr[salario];
		MULSS XMM0, dword ptr[ase];
		MOVSS dword ptr[res], XMM0;
		MOVSS XMM0, dword ptr[totalAPEmpr];
		ADDSS XMM0, dword ptr[res];
		MOVSS dword ptr[totalAPEmpr], XMM0;
	}
	return res;
}

float ILG(float salario, float ase, float ape, float fsp)
{
	float res;
	__asm {
		MOVSS XMM0, dword ptr[salario];
		SUBSS XMM0, dword ptr[ase];
		SUBSS XMM0, dword ptr[ape];
		SUBSS XMM0, dword ptr[fsp];
		MOVSS dword ptr[res], XMM0;
	}
	return res;
}

float BaseG (float ILG)
{
	float div = 0.25;
	float res;
	__asm {
		MOVSS XMM0, dword ptr[ILG];
		MULSS XMM0, dword ptr[div];
		MOVSS dword ptr[res], XMM0;
	}
	return res;
}

float BaseGUVT(float baseG)
{
	float UVT = 28279.0;
	float res;
	__asm {
		MOVSS XMM0, dword ptr[baseG];
		DIVSS XMM0, dword ptr[UVT];
		MOVSS dword ptr[res], XMM0;
	}
	return res;
}

int main()
{
	initTotales();
	ifstream in("in.txt");
	string line;
	stringstream ss;
	vector<string> names;
	vector<string> ids;
	vector<float> salaries;
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
			float salaryF = salary;
			salaries.push_back(salaryF);
	}
	ofstream out("out.txt");
	if (out.is_open())
	{
		for (int i = 0; i < names.size(); ++i){
			//Cedula
			out << ids[i] << ";";
			//Nombre
			out << names[i] << ";";
			//Salario base
			out << salaries[i] << ";";
			//Sueldo empleado en SLMVM
			//Aporte a salud empleado
			float ase = aporteSaludEmpl(salaries[i]);
			ase = roundf(ase * 100) / 100;
			out << ase << ";";
			//Aporte a salud empleador
			float aser = aporteSaludEmpr(salaries[i]);
			aser = roundf(aser * 100) / 100;
			out << aser << ";";
			//Aporte a pension empleado
			float ape = aportePensionEmpl(salaries[i]);
			ape = roundf(ape * 100) / 100;
			out << ape << ";";
			//Aporte a pension empleador
			float aper = aportePensionEmpr(salaries[i]);
			aper = roundf(aper * 100) / 100;
			out << aper << ";";
			//Aporte FSP
			//ILG
			//Base Gravable
			//Base Gravable en UVTs
			//Tarifa de retencion
			//Retencion en la fuente
			//Subsidio de transporte
			//Total a pagar a empleado
			
			out << endl;
		}
		//double salario = salaries[0] * 0.5;
		//double number = roundf(salario * 100) / 100;
		//out << number*2.0 << endl;
		out.close();
	}
	cout << "Total Aporte a Salud Empleados: " << totalASEmpl << endl;
	cout << "Total Aporte a Salud Empleador: " << totalASEmpr << endl;
	cout << "Total Aporte a Pension Empleados: " << totalAPEmpl << endl;
	cout << "Total Aporte a Pension Empleador: " << totalAPEmpr << endl;
	cout << "Total Aporte a FSP: " << totalFSP << endl;
	cout << "Total Retencion en la fuente: " << totalRetFuente << endl;
	cout << "Total sueldos a pagar: " << totalSueldo << endl;
	//float number = numSalarios(5.5);
	///cout << number << endl;
	//float salario = salaries[0]*0.5f;
	//cout << salario*2 << endl;
	return 0;
}

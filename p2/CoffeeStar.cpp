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

string formato(float num){
	num *= 100;
  int number = (num + 0.5);
  int c1, c2;
  c1 = (number % 100) / 10;
  c2 = number % 10;
	if (c1 == 0 && c2 == 0){
		number /= 100;
    return to_string(number) + ".00";
	}else{
    number /= 100;
		return to_string(number) + "." +  to_string(c1) + to_string(c2);
	}
}

void initTotales() {
	__asm {
		FLDZ;
		FST dword ptr[totalASEmpl];
		FST dword ptr[totalASEmpr];
		FST dword ptr[totalAPEmpl];
		FST dword ptr[totalAPEmpr];
		FST dword ptr[totalSueldo];
		FST dword ptr[totalFSP];
		FSTP dword ptr[totalRetFuente];
	}
}

float numSalarios(float salario)
{
	float SLMVM = 644350.0;
	float nSalarios;
	__asm {
		FLD dword ptr[salario];
		FLD dword ptr[SLMVM];
		FDIV;
		FSTP dword ptr[nSalarios];
	}
	return nSalarios;
}

float aporteSaludEmpl(float salario)
{
	float ase = 0.04;
	float res;
	__asm {
		FLD dword ptr[salario];
		FLD dword ptr[ase];
		FMUL;
		FST dword ptr[res];
		FLD dword ptr[totalASEmpl];
		FADD;
		FSTP dword ptr[totalASEmpl];
	}
	return res;
}

float aporteSaludEmpr(float salario)
{
	float ase = 0.045;
	float res;
	__asm {
		FLD dword ptr[salario];
		FLD dword ptr[ase];
		FMUL;
		FST dword ptr[res];
		FLD dword ptr[totalASEmpr];
		FADD;
		FSTP dword ptr[totalASEmpr];
	}
	return res;
}

float aportePensionEmpl(float salario)
{
	float ase = 0.04;
	float res;
	__asm {
		FLD dword ptr[salario];
		FLD dword ptr[ase];
		FMUL;
		FST dword ptr[res];
		FLD dword ptr[totalAPEmpl];
		FADD;
		FSTP dword ptr[totalAPEmpl];
	}
	return res;
}

float aportePensionEmpr(float salario)
{
	float ase = 0.08;
	float res;
	__asm {
		FLD dword ptr[salario];
		FLD dword ptr[ase];
		FMUL;
		FST dword ptr[res];
		FLD dword ptr[totalAPEmpr];
		FADD;
		FSTP dword ptr[totalAPEmpr];
	}
	return res;
}

float ILG(float salario, float ase, float ape, float fsp)
{
	float res;
	__asm {
		FLD dword ptr[salario];
		FLD dword ptr[ase];
		FSUB;
		FLD dword ptr[ape];
		FSUB;
		FLD dword ptr[fsp];
		FSUB;
		FSTP dword ptr[res];
	}
	return res;
}

float BaseG (float ILG)
{
	float div = 0.75;
	float res;
	__asm {
		FLD dword ptr[ILG];
		FLD dword ptr[div];
		FMUL;
		FSTP dword ptr[res];
	}
	return res;
}

float BaseGUVT(float baseG)
{
	float UVT = 28279.0;
	float res;
	__asm {
		FLD dword ptr[baseG];
		FLD dword ptr[UVT];
		FDIV;
		FSTP dword ptr[res];
	}
	return res;
}

float FSP(float salario)
{
	float nSueldos = numSalarios(salario);
	float rang4 = 4.0;
	float rang16 = 16.0;
	float rang17 = 17.0;
	float rang18 = 18.0;
	float rang19 = 19.0;
	float rang20 = 20.0;
	float porc1 = 0.01;
	float porc12 = 0.012;
	float porc14 = 0.014;
	float porc16 = 0.016;
	float porc18 = 0.018;
	float porc2 = 0.02;
	float garbage;
	float res;
	__asm {
		FLD dword ptr[nSueldos];
		FLD dword ptr[rang4];
		FCOMIP ST(0), ST(1);
		JBE rango1;
		FLDZ;
		FMUL;
		FST dword ptr[res];
		JMP total;
	rango1:
		FLD dword ptr[rang16];
		FCOMIP ST(0), ST(1);
		JBE rango2;
		FSTP dword ptr[garbage];
		FLD dword ptr[salario];
		FLD dword ptr[porc1];
		FMUL;
		FST dword ptr[res];
		JMP total;
	rango2:
		FLD dword ptr[rang17];
		FCOMIP ST(0), ST(1);
		JBE rango3;
		FSTP dword ptr[garbage];
		FLD dword ptr[salario];
		FLD dword ptr[porc12];
		FMUL;
		FST dword ptr[res];
		JMP total;
	rango3:
		FLD dword ptr[rang18];
		FCOMIP ST(0), ST(1);
		JBE rango4;
		FSTP dword ptr[garbage];
		FLD dword ptr[salario];
		FLD dword ptr[porc14];
		FMUL;
		FST dword ptr[res];
		JMP total;
	rango4:
		FLD dword ptr[rang19];
		FCOMIP ST(0), ST(1);
		JBE rango5;
		FSTP dword ptr[garbage];
		FLD dword ptr[salario];
		FLD dword ptr[porc16];
		FMUL;
		FST dword ptr[res];
		JMP total;
	rango5:
		FLD dword ptr[rang20];
		FCOMIP ST(0), ST(1);
		JBE rango6;
		FSTP dword ptr[garbage];
		FLD dword ptr[salario];
		FLD dword ptr[porc18];
		FMUL;
		FST dword ptr[res];
		JMP total;
	rango6:
		FSTP dword ptr[garbage];
		FLD dword ptr[salario];
		FLD dword ptr[porc2];
		FMUL;
		FST dword ptr[res];
		JMP total;
	total:
		FLD dword ptr[totalFSP];
		FADD;
		FSTP dword ptr[totalFSP];
	}
	return res;
}

float tarifaRet(float baseGravableUVT)
{
	float rang95 = 95.0;
	float rang150 = 150.0;
	float rang360 = 360.0;
	float porc19 = 19.0;
	float porc28 = 28.0;
	float porc33 = 33.0;
	float garbage;
	float res;
	__asm {
		FLD dword ptr[baseGravableUVT];
		FLD dword ptr[rang95];
		FCOMIP ST(0), ST(1);
		JBE rango19;
		FSTP dword ptr[garbage];
		FLDZ;
		JMP total;
	rango19:
		FLD dword ptr[rang150];
		FCOMIP ST(0), ST(1);
		JBE rango28;
		FSTP dword ptr[garbage];
		FLD dword ptr[porc19];
		JMP total;
	rango28:
		FLD dword ptr[rang360];
		FCOMIP ST(0), ST(1);
		JBE rango33;
		FSTP dword ptr[garbage];
		FLD dword ptr[porc28];
		JMP total;
	rango33:
		FSTP dword ptr[garbage];
		FLD dword ptr[porc33];
		JMP total;
	total:
		FSTP dword ptr[res];
	}
	return res;
}

float SubsidioTrans(float salario)
{
	float nSueldos = numSalarios(salario);
	float rang2 = 2.0;
	float subTrans = 74000.0;
	float garbage;
	float res;
	__asm {
		FLD dword ptr[nSueldos];
		FLD dword ptr[rang2];
		FCOMIP ST(0), ST(1);
		JAE pagasub;
		FSTP dword ptr[garbage];
		FLDZ;
		JMP retornar;
	pagasub:
		FSTP dword ptr[garbage];
		FLD dword ptr[subTrans];
		JMP retornar;
	retornar:
		FSTP dword ptr[res];
	}
	return res;
}

float RetFuente(float baseGravableUVT, float tarifa)
{
	float div100 = 100.0;
	float UVT = 28279.0;
	float UVT95 = 95.0;
	float UVT150 = 150.0;
	float UVT360 = 360.0;
	float UVT10 = 10.0;
	float UVT69 = 69.0;
	float porcentaje;
	float garbage;
	float res;
	__asm {
		FLD dword ptr[baseGravableUVT];
		FLD dword ptr[UVT95];
		FCOMIP ST(0), ST(1);
		JBE rango19;
		FSTP dword ptr[garbage];
		FLD dword ptr[tarifa];
		FLD dword ptr[div100];
		FDIV;
		FSTP dword ptr[porcentaje];
		FLDZ;
		JMP total;
	rango19:
		FLD dword ptr[UVT150];
		FCOMIP ST(0), ST(1);
		JBE rango28;
		FSTP dword ptr[garbage];
		FLD dword ptr[tarifa];
		FLD dword ptr[div100];
		FDIV;
		FSTP dword ptr[porcentaje];
		FLD dword ptr[baseGravableUVT];
		FLD dword ptr[UVT95];
		FSUB;
		FLD dword ptr[porcentaje];
		FMUL;
		JMP total;
	rango28:
		FLD dword ptr[UVT360];
		FCOMIP ST(0), ST(1);
		JBE rango33;
		FSTP dword ptr[garbage];
		FLD dword ptr[tarifa];
		FLD dword ptr[div100];
		FDIV;
		FSTP dword ptr[porcentaje];
		FLD dword ptr[baseGravableUVT];
		FLD dword ptr[UVT150];
		FSUB;
		FLD dword ptr[porcentaje];
		FMUL;
		FLD dword ptr[UVT10];
		FADD;
		JMP total;
	rango33:
		FSTP dword ptr[garbage];
		FLD dword ptr[tarifa];
		FLD dword ptr[div100];
		FDIV;
		FSTP dword ptr[porcentaje];
		FLD dword ptr[baseGravableUVT];
		FLD dword ptr[UVT360];
		FSUB;
		FLD dword ptr[porcentaje];
		FMUL;
		FLD dword ptr[UVT69];
		FADD;
		JMP total;
	total:
		FLD dword ptr[UVT];
		FMUL;
		FST dword ptr[res];
		FLD dword ptr[totalRetFuente];
		FADD;
		FSTP dword ptr[totalRetFuente];
	}
	return res;
}

float SueldoPagar(float ilg, float retFuente, float subTrans)
{
	float res;
	__asm {
		FLD dword ptr[ilg];
		FLD dword ptr[subTrans];
		FADD;
		FLD dword ptr[retFuente];
		FSUB;
		FST dword ptr[res];
		FLD dword ptr[totalSueldo];
		FADD;
		FSTP dword ptr[totalSueldo];
	}
	return res;
}


int main()
{
	initTotales();
	ifstream in("in.txt");
	string line;
	vector<string> names;
	vector<string> ids;
	vector<string> salary;
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
			salary.push_back(salaryS);
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
			out << salary[i] << ";";
			//Sueldo empleado en SLMVM
			float nSalarios = numSalarios(salaries[i]);
			out << formato(nSalarios) << ";";
			//Aporte a salud empleado
			float ase = aporteSaludEmpl(salaries[i]);
			out << formato(ase) << ";";
			//Aporte a salud empleador
			float aser = aporteSaludEmpr(salaries[i]);
			out << formato(aser) << ";";
			//Aporte a pension empleado
			float ape = aportePensionEmpl(salaries[i]);
			out << formato(ape) << ";";
			//Aporte a pension empleador
			float aper = aportePensionEmpr(salaries[i]);
			out << formato(aper) << ";";
			//Aporte FSP
			float fsp = FSP(salaries[i]);
			out << formato(fsp) << ";";
			//ILG
			float ilg = ILG(salaries[i],ase,ape, fsp);
			out << formato(ilg) << ";";
			//Base Gravable
			float bg = BaseG(ilg);
			out << formato(bg) << ";";
			//Base Gravable en UVTs
			float bgUVT = BaseGUVT(bg);
			out << formato(bgUVT) << ";";
			//Tarifa de retencion
			float tarifaRetencion = tarifaRet(bgUVT);
			out << formato(tarifaRetencion) << ";";
			//Retencion en la fuente
			float ret = RetFuente(bgUVT, tarifaRetencion);
			out << formato(ret) << ";";
			//Subsidio de transporte
			float subTrans = SubsidioTrans(salaries[i]);
			out << formato(subTrans) << ";";
			//Total a pagar a empleado
			float sueldo = SueldoPagar(ilg, ret, subTrans);
			out << formato(sueldo) << ";";
			out << endl;
		}
		out.close();
	}
	printf("Total Aporte a Salud Empleados: %.2f \n", totalASEmpl);
	printf("Total Aporte a Salud Empleador: %.2f \n", totalASEmpr);
	printf("Total Aporte a Pension Empleados: %.2f \n", totalAPEmpl);
	printf("Total Aporte a Pension Empleador: %.2f \n", totalAPEmpr);
	printf("Total Aporte a FSP: %.2f \n", totalFSP);
	printf("Total Retencion en la fuente: %.2f \n", totalRetFuente);
	printf("Total sueldos a pagar: %.2f \n", totalSueldo);
	return 0;
}
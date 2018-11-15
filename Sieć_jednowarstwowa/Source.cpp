#include "stdafx.h"
#include "DeltaRule.h"
#include "Adaline.h"

int main()
{
	//Perceptron.h nie jest uzywana (sluzy tylko do zalaczania bibliotek i trzymania define)
	double learningRate = 0.1; //wspolczynnik uczenia

	cout << "Learning Rate: " << learningRate << endl;

	//Adaline
	Adaline adaline(learningRate);
	adaline.learn();
	adaline.test();

	//DeltaRule
	DeltaRule deltaRule(learningRate);
	deltaRule.learn();
	deltaRule.test();

	system("PAUSE");
	return 0;
}

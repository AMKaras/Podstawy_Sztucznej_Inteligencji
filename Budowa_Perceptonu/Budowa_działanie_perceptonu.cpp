#include "stdafx.h"
#include <iostream>
#include <time.h>
#include <random>

using namespace std;

static int MaxIteration = 5000;
static double LearningRate = 0.0001;
static int NumInstances = 4;
static int threshold = 0;

static int Percepton(int threshold, double weights[], double x, double y) {
	double sum = x * weights[0] + y * weights[1] + weights[2];
	return sum >= threshold ? 1 : 0;
}
double fRand(double fMin, double fMax)
{
	double f = (double)rand() / RAND_MAX;
	return fMin + f * (fMax - fMin);
}

int main()
{
	srand((unsigned)time(NULL));
	int numInstances = 4;
	int* x = new int[numInstances];
	int* y = new int[numInstances];
	int* result = new int[numInstances];

	x[0] = 0; y[0] = 0; result[0] = 0;
	x[1] = 1; y[1] = 0; result[1] = 0;
	x[2] = 0; y[2] = 1; result[2] = 0;
	x[3] = 1; y[3] = 1; result[3] = 1;

	double* weights = new double[3];

	weights[0] = fRand(-0.5,0.5);
	weights[1] = fRand(-0.5,0.5);
	weights[2] = fRand(-0.5,0.5);

	double localError, globalError;
	int p, iteration, perceptonResult;
	int ifLearnd = 0;
	iteration = 0;
	do {
		iteration++;
		globalError = 0;
		//Perception learning
		for (p = 0; p < numInstances; p++) {
			perceptonResult = Percepton(threshold, weights, x[p], y[p]);
			localError = result[p] - perceptonResult;
			weights[0] += LearningRate * localError * x[p];
			weights[1] += LearningRate * localError * y[p];
			weights[2] += LearningRate * localError;
			globalError += (localError*localError);
		}
		//Checking if perception is learned 
		if (ifLearnd == 0 && globalError == 0) {
			ifLearnd = 1;
			cout << "\n ----------------------PERCEPTRON LEARNED--------------------------------";
			iteration = MaxIteration - 5;
		}
		cout << "\nIteration: " << iteration << " RMSE = " << sqrt((globalError / numInstances));/*Root Mean Squared Error*/
		int x1 = (int)rand() % 2;
		int y1 = (int)rand() % 2;
		perceptonResult = Percepton(threshold, weights, x1, y1);
		cout << "\n\nRandom Point:\n" << "x = "<< x1 << " y = " << y1<<"\nResult = "<< perceptonResult <<"\n\n";
	}while (iteration < MaxIteration);

	cout<<"\n\nDecision boundary equation:";
	cout<< weights[0] << "*x +" <<  weights[1] << "*y + " << weights[2] << " = 0\n";
	system("PAUSE");
}

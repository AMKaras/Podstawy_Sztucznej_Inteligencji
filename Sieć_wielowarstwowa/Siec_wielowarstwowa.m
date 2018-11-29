close all; clear all; clc;

input = [-2 -1.6 -1.2 -0.8 -0.4 0 0.4 0.8 1.2 1.6 2];
output = [1.6633e+03 1.6880e+03 1.6867e+03 1.7764e+03 1.7800e+03 0.0 1.9495e+03 1.9825e+03 2.1477e+03 2.1791e+03 2.3262e+03];

test = zeros(1);

net = feedforwardnet(2); %tworzenie sieci z 2 warstwami ukrytymi
net.trainFcn = 'traingd'; %algorytm wstecznej propagacji
net.trainParam.lr = 0.5; %wsp. uczenia 0.5 0.1 0.01
net.trainParam.mc = 0.5; %bezwladnosc 0 0.5 1
net = train(net, input, output);
result = zeros(size(net));

for i = 1:11
    test(i) = rastriginFunction(input(i)); %wygenerowanie prawid³owych wyników dzia³ania funkcji RastrignTest3D
    result(i) = sim(net, input(i)) %test dzia³ania sieci
end 


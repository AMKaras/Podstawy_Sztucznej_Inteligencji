close all; clear all; clc;

data = iris_dataset;

plot(data(1,:),data(2,:),'g.', data(3,:),data(4,:),'b.');
hold on; grid on;

dimensions = [8 8]; 
coverSteps = 100;
initNeighbor = 0;
%topologyFcn = 'gridtop';
topologyFcn = 'hextop';
distanceFcn = 'dist';

net = selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);
net.trainFcn = 'trainbu';
net.trainParam.epochs = 500;
net.trainParam.lr=0.75;

[net,tr] = train(net,data);
y = net(data);
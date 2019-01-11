minmax=[0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;
    0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;
    0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;
    0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;
    0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;
    0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;
    0 1;0 1;0 1;0 1];

numerOfOutput=64;
net=newff(minmax,numerOfOutput,{'tansig'},'trainlm','learnh');

input=[ 0 0 0 0;
    0 0 0 0;
    1 1 1 1;
    1 1 1 1;
    1 1 1 1;
    1 1 1 1;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    1 1 1 1;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    1 1 1 1;
    0 0 0 0;
    1 1 1 1;
    0 0 0 0;
    1 1 1 1;
    0 0 0 0;
    0 0 0 0;
    1 1 1 1;
    0 0 0 0;
    1 1 1 1;
    1 1 1 1;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    1 1 1 1;
    1 1 1 1;  
    0 0 0 0;
    1 0 1 0;
    0 1 1 1;
    0 1 1 1;
    1 0 1 0;
    0 0 0 0;
    1 1 1 1;
    1 1 1 1;  
    0 0 0 0;
    0 0 0 1;
    1 1 1 0;
    1 1 1 0;
    0 0 0 1;
    0 0 0 0;
    1 1 1 1;
    0 0 0 0;
    1 1 1 1;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    1 1 1 1;
    0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    1 1 1 1;
    1 1 1 1;
    1 1 1 1;
    1 1 1 1;
    0 0 0 0;
    0 0 0 0;
    ];

output =[ 1 0 0 0 % smile
          0 1 0 0 % shock
          0 0 1 0 % happy
          0 0 0 1 % sad
        ];

lp.dr = 0;
lp.lr =1;

Heb=learnh([],input,[],[],output,[],[],[],[],[],lp,[]);
heb=Heb';

net.trainParam.epochs = 100;
net.trainParam.goal = 0.1;
net=train(net,input,heb);

smile=[ 0 0 1 1 1 1 0 0;
        0 1 0 0 0 0 1 0;
        1 0 1 0 0 1 0 1;
        1 0 0 0 0 0 0 1;
        1 0 1 0 0 1 0 1;
        1 0 0 1 1 0 0 1;
        0 1 0 0 0 0 1 0;
        0 0 1 1 1 1 0 0];
shock=[ 0 0 1 1 1 1 0 0;
        0 1 0 0 0 0 1 0;
        1 0 1 0 0 1 0 1;
        1 0 0 0 0 0 0 1;
        1 0 0 1 1 0 0 1;
        1 0 0 1 1 0 0 1;
        0 1 0 0 0 0 1 0;
        0 0 1 1 1 1 0 0];
happy=[ 0 0 1 1 1 1 0 0;
        0 1 0 0 0 0 1 0;
        1 0 1 0 0 1 0 1;
        1 0 0 0 0 0 0 1;
        1 0 1 1 1 1 0 1;
        1 0 0 1 1 0 0 1;
        0 1 0 0 0 0 1 0;
        0 0 1 1 1 1 0 0];
  sad=[ 0 0 1 1 1 1 0 0;
        0 1 0 0 0 0 1 0;
        1 0 1 0 0 1 0 1;
        1 0 0 0 0 0 0 1;
        1 0 0 1 1 0 0 1;
        1 0 1 0 0 1 0 1;
        0 1 0 0 0 0 1 0;
        0 0 1 1 1 1 0 0];

testSmile = sim(net, smile);disp('Smile ='),disp(testSmile(1));
testShock = sim(net, shock);disp('Shock ='),disp(testShock(1));
testHappy = sim(net, happy);disp('Happy ='),disp(testHappy(1));
testSad = sim(net, sad);    disp('Sad ='),  disp(testSad(1));
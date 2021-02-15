program Battle3;
uses graph, crt, math;

var b,c,d,e: integer;
s: string;
a: real;

//infa армий
//0 - воины
//1 - мораль
//2 - умения командира в faz1
//3 - умения командира в faz2
p1: array[0..10] of real;
p2: array[0..10] of real;

//распределение отрядов
p1o: array[1..20] of integer;
p2o: array[1..20] of integer;

//сохранение начальных значений
p1str:array[0..1] of real;
p2str:array[0..1] of real;
//число прошедших дней
days: integer;

//знач. кубика
kub1, kub2: integer;
//итоговый урон
u1, u2: real;
//урон морали
u1p, u2p: real;

procedure show;
begin
clearbuffer;

  setfillstyle(1, black);
  setcolor(rgb(0, 155, 255));
  setlinestyle(0, 0, 7);
  line(220, 0, 220, 540);
  line(620, 0, 620, 540);
  line(1000, 0, 1000, 540);
  
  line(0, 90, 1000, 90);
  line(0, 180, 1000, 180);
  line(0, 280, 1000, 280);
  line(0, 380, 1000, 380);
  line(0, 540, 1000, 540);
  
settextjustify(lefttext, toptext);
settextstyle(5, 0, 4);
setcolor(white);
  
  s:=kub1 + ' : ' + kub2;
  outtextXY(10, 600, s);

  outtextXY(10, 50+100, 'Воины');
  outtextXY(10, 50+200, 'Потери');
  outtextXY(10, 50+300, 'Мораль');
  outtextXY(10, 50+400, 'Потери');
  outtextXY(10, 50+450, 'морали');
  
  settextjustify(centertext, toptext);
  outtextXY(10+400, 50, 'Первое войско');
  outtextXY(10+800, 50, 'Второе войско');
  
  str(int(p1[0]), s);
  outtextXY(10+400, 50+100, s);
  str(int(p2[0]), s);
  outtextXY(10+800, 50+100, s);
  
  str(int(u2), s);
  s:='-' + s;
  outtextXY(10+400, 50+200, s);
  str(int(u1), s);
  s:='-' + s;
  outtextXY(10+800, 50+200, s);
  
  str(round(p1[1]*100)/100, s);
  outtextXY(10+400, 50+300, s);
  str(round(p2[1]*100)/100, s);
  outtextXY(10+800, 50+300, s);
  
  str(round(u2p*100)/100, s);
  outtextXY(10+400, 50+400+35, s);
  str(round(u1p*100)/100, s);
  outtextXY(10+800, 50+400+35, s);
  
  drawbuffer;
end;

procedure dofaz;
begin
  if p1[0]>=20000 then
    for b:=1 to 20 do
    p1o[b]:=1000
  else begin
    c:=ceil(p1[0]/1000);
    if c*1000>p1[0] then
      d:=int(p1[0])-(c-1)*1000;
    for b:=trunc(11-c/2) to trunc(10+c/2-1) do
      p1o[b]:=1000;
      p1o[trunc(10+c/2)]:=d;
  end;
  
  if p2[0]>=20000 then
    for b:=1 to 20 do
    p2o[b]:=1000
  else begin
    c:=ceil(p2[0]/1000);
    if c*1000>p2[0] then
      d:=int(p2[0])-(c-1)*1000;
    for b:=trunc(11-c/2) to trunc(10+c/2-1) do
      p2o[b]:=1000;
      p2o[trunc(10+c/2)]:=d;
  end;
  
end;

procedure faz1;
begin
  kub1:=random(10);
  kub2:=random(10);
  
  if p1[2]>p2[2] then
  kub1:=int(kub1+(p1[2]-p2[2]));
  if p2[2]>p1[2] then
  kub2:=int(kub2+(p2[2]-p1[2]));
  
  for e:=1 to 3 do
  if (p1[1]>0) and (p2[1]>0) then
  begin
  if p1[0]<=20000 then
  u1:=(kub1*5+15)*(p1[0]/1000)
  else u1:=(kub1*5+15)*(19+(p1[0]-((ceil(p1[0]/1000)-1)*1000))/1000);
  
  if p2[0]<=20000 then
  u2:=(kub2*5+15)*(p2[0]/1000)
  else u2:=(kub2*5+15)*(19+(p2[0]-((ceil(p2[0]/1000)-1)*1000))/1000);
  
  
  if p2[0]<=20000 then
  u1p:=u1*2.5/(500*p2[0]/1000)
  else u1p:=u1*2.5/(500*(19+(p2[0]-((ceil(p2[0]/1000)-1)*1000))/1000));
  
  if p1[0]<=20000 then
  u2p:=u2*2.5/(500*p1[0]/1000)
  else u2p:=u2*2.5/(500*(19+(p1[0]-((ceil(p1[0]/1000)-1)*1000))/1000));
  
  
  p1[0]:=round(p1[0]-u2);
  p2[0]:=round(p2[0]-u1);
  
  p1[1]:=p1[1]-u2p;
  p2[1]:=p2[1]-u1p;
  
  days:=days+1;
  show;
  readln();
  end;
end;

procedure faz2;
begin
  kub1:=random(10);
  kub2:=random(10);
  
  if p1[3]>p2[3] then
  kub1:=int(kub1+(p1[3]-p2[3]));
  if p2[3]>p1[3] then
  kub2:=int(kub2+(p2[3]-p1[3]));
  
  for e:=1 to 3 do
  if (p1[1]>0) and (p2[1]>0) then
  begin
  if p1[0]<=20000 then
  u1:=(kub1*5+15)*(p1[0]/1000)
  else u1:=(kub1*5+15)*(19+(p1[0]-((ceil(p1[0]/1000)-1)*1000))/1000);
  
  if p2[0]<=20000 then
  u2:=(kub2*5+15)*(p2[0]/1000)
  else u2:=(kub2*5+15)*(19+(p2[0]-((ceil(p2[0]/1000)-1)*1000))/1000);
  
  
  if p2[0]<=20000 then
  u1p:=u1*2.5/(500*p2[0]/1000)
  else u1p:=u1*2.5/(500*(19+(p2[0]-((ceil(p2[0]/1000)-1)*1000))/1000));
  
  if p1[0]<=20000 then
  u2p:=u2*2.5/(500*p1[0]/1000)
  else u2p:=u2*2.5/(500*(19+(p1[0]-((ceil(p1[0]/1000)-1)*1000))/1000));
  
  
  p1[0]:=round(p1[0]-u2);
  p2[0]:=round(p2[0]-u1);
  
  p1[1]:=p1[1]-u2p;
  p2[1]:=p2[1]-u1p;
  
  days:=days+1;
  show;
  readln();
  end;
end;

procedure ended;
begin
  clearbuffer;
  
  settextjustify(lefttext, toptext);
  
  str(int(p1str[0]-p1[0]), s);
  s:=int(p1str[0]) + ' - ' + s + ' = ' + int(p1[0]);
  outtextXY(10+50, 50+100, s);
  
  str(int(p2str[0]-p2[0]), s);
  s:=int(p2str[0]) + ' - ' + s + ' = ' + int(p2[0]);
  outtextXY(10+50, 50+200, s);
  
  str(days, s);
  outtextXY(10+50, 50+0, s);
  
  drawbuffer;
end;

procedure init;
begin
  //число воинов
  p1[0]:=10000;
  p2[0]:=10000;
  
  p1str[0]:=p1[0];
  p2str[0]:=p2[0];
  
  //боевой дух
  p1[1]:=2.6;
  p2[1]:=2.6;
  
  p1str[1]:=p1[1];
  p2str[1]:=p2[1];
  
  //командиры
  p1[2]:=3;
  p1[3]:=2;
  
  p2[2]:=1;
  p2[3]:=4;
  
  
end;

begin
initgraph(0, 0, '');
setbufferenable(true);
  init;
  show;
  
  //dofaz;
  
  readln();
  repeat
  if (p1[1]>0) and (p2[1]>0) then
  faz1;
  if (p1[1]>0) and (p2[1]>0) then
  faz2;
  until (p1[1]<=0) or (p2[1]<=0);
  
  ended;
  
  readln;
end.

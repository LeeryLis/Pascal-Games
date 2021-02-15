//////////////////////////
//Written by LeeryLis   //
//////////////////////////

{AI BATTLE!!!}

{It is the COMPLET version! At the moment you can play comfortably!

LET'S PLAY!!!}

{This program was writen by CrazyGrass
It's a famous game Sea Battle

In this version AI is able to choose random cells to attack and finish off the wrecked ships

You can restart and exit game. You can also see the score which is the result of all the games played

This version has "dodraw" procedure which fixes the "graph"

Crazy Grass wrote this program from 5 to 24 August 2019}
program SB_AI_Tactics;

uses graph,crt;

type map = record
p1: array[0..11] of array[0..11] of integer;
p2: array[0..11] of array[0..11] of integer;
e1: array[0..11] of array[0..11] of integer;
e2: array[0..11] of array[0..11] of integer;
es1: array of integer;
es2: array of integer;
es3: array of integer;
es4: array of integer;
end;

//корабль. длина, направление и кол-во
ship = record
d: integer;
n: char;
k: array[1..4] of integer = (4,3,2,1);
x: integer;
y: integer;
end;

var a,b,x,y,kl,r,l1,l2,l3,z1,rand1,rand2,rand3, rand4, z2, z3, z4, z5, z6, z7:integer;
s,s1: string;
key, key2: char;
x1,y1:char;

//переменная отмены при расстановке
otm: integer;

//количество "неподбитых" клеток кораблей
ostE: integer = 20;
ostP: integer = 20;

//для рисовки кораблика
klr,ox,oy: integer;

//контроль победы
restart: integer;

//выбранный язык
lng: string = 'en';

//координаты во время игры
ha,hb: integer;

//подсчёт побед
winscountP: integer;
winscountE: integer;

m: map;
sh: ship;

//генератор цвета
generator: android_graphics_Color;
color: integer;

//ЛОГИКА ИИ ВО ВРЕМЯ БОЯ
//"ПРИВЯЗКА" ВО ВРЕМЯ ПОПАДАНИЯ
lastx: integer;
lasty: integer;
//ВЫБОР НАПРАВЛЕНИЯ "АТАКИ"
//ГОРИЗОНТАЛЬ
gorz: integer;
//ВЕРТИКАЛЬ
vert: integer;

//массивы для "запоминания" клеток
//процедура "ubil"/"zap"
zax: array[0..10] of integer;
zay: array[0..10] of integer;

//ОТРИСОВКА КОРАБЛИКА
procedure drawship;
begin
  color:=generator.rgb(230,50,50);
  setFillStyle(1, color);
  setColor(color);
  
  bar(2*klr+ox, 2*klr+oy, 2*klr+klr+ox, 2*klr+klr+oy);
  
  bar(3*klr+ox, 1*klr+oy, 3*klr+ox+klr*4, 1*klr+oy+klr*2);
  
  color:=generator.rgb(100,70,60);
  setFillStyle(1, color);
  setColor(color);
  
  bar(6*klr+ox, 0*klr+oy, 6*klr+ox+klr*1, 0*klr+oy+klr*1);
  
  bar(6*klr+ox, 3*klr+oy, 6*klr+ox+klr*1, 3*klr+oy+klr*10);
  
  bar(13*klr+ox, 6*klr+oy, 13*klr+ox+klr*1, 6*klr+oy+klr*7);
  
  bar(1*klr+ox, 14*klr+oy, 1*klr+ox+klr*17, 14*klr+oy+klr*1);
  
  bar(2*klr+ox, 15*klr+oy, 2*klr+ox+klr*15, 15*klr+oy+klr*2);
  
  bar(3*klr+ox, 16*klr+oy, 3*klr+ox+klr*12, 16*klr+oy+klr*2);
  
  color:=generator.rgb(0,0,0);
  setFillStyle(1, color);
  setColor(color);
  
  bar(4*klr+ox, 15*klr+oy, 4*klr+ox+klr*1, 15*klr+oy+klr*1);
  
  bar(7*klr+ox, 15*klr+oy, 7*klr+ox+klr*1, 15*klr+oy+klr*1);
  
  bar(10*klr+ox, 15*klr+oy, 10*klr+ox+klr*1, 15*klr+oy+klr*1);
  
  bar(13*klr+ox, 15*klr+oy, 13*klr+ox+klr*1, 15*klr+oy+klr*1);
  
  color:=generator.rgb(80,50,40);
  setFillStyle(1, color);
  setColor(color);
  
  bar(0*klr+ox, 13*klr+oy, 0*klr+ox+klr*21, 13*klr+oy+klr*1);
  
  color:=generator.rgb(150,150,150);
  setFillStyle(1, color);
  setColor(color);
  
  bar(7*klr+ox, 3*klr+oy, 7*klr+ox+klr*1, 3*klr+oy+klr*2);
  
  bar(8*klr+ox, 4*klr+oy, 8*klr+ox+klr*1, 4*klr+oy+klr*2);
  
  bar(9*klr+ox, 5*klr+oy, 9*klr+ox+klr*1, 5*klr+oy+klr*3);
  
  bar(10*klr+ox, 7*klr+oy, 10*klr+ox+klr*1, 7*klr+oy+klr*4);
  
  bar(9*klr+ox, 10*klr+oy, 9*klr+ox+klr*1, 10*klr+oy+klr*2);
  
  bar(8*klr+ox, 11*klr+oy, 8*klr+ox+klr*1, 11*klr+oy+klr*2);
  
  bar(14*klr+ox, 7*klr+oy, 14*klr+ox+klr*1, 7*klr+oy+klr*2);
  
  bar(15*klr+ox, 8*klr+oy, 15*klr+ox+klr*1, 8*klr+oy+klr*2);
  
  bar(16*klr+ox, 9*klr+oy, 16*klr+ox+klr*1, 9*klr+oy+klr*3);
  
  bar(15*klr+ox, 12*klr+oy, 15*klr+ox+klr*1, 12*klr+oy+klr*1);
  
  color:=generator.rgb(80,50,40);
  setFillStyle(1, color);
  setColor(color);
  
  bar(0*klr+ox, 14*klr+oy, 0*klr+ox+klr*1, 14*klr+oy+klr*1);
  
  bar(1*klr+ox, 15*klr+oy, 1*klr+ox+klr*1, 15*klr+oy+klr*1);
  
  bar(2*klr+ox, 16*klr+oy, 2*klr+ox+klr*1, 16*klr+oy+klr*1);
  
  bar(3*klr+ox, 17*klr+oy, 3*klr+ox+klr*12, 17*klr+oy+klr*1);
  
  bar(18*klr+ox, 14*klr+oy, 18*klr+ox+klr*1, 14*klr+oy+klr*1);
  
  bar(17*klr+ox, 15*klr+oy, 17*klr+ox+klr*1, 15*klr+oy+klr*1);
  
  bar(15*klr+ox, 16*klr+oy, 15*klr+ox+klr*2, 16*klr+oy+klr*1);
end;

//ОЧИСТКА ЭКРАНА
procedure blbar;
begin
  setFillStyle(1, black);
  setColor(black);
  bar(0,0, 1500,1500);
end;

//ДОРИСОВКА ИЗ-ЗА КОСЯКОВ ДВИЖКА
procedure dodraw;
begin
  delay(50);
  setFillStyle(1, black);
  setColor(black);
  bar(1000,1000, 1001,1001);
end;
//генерация кораблей в "резерве"
//1
procedure ship1;
begin
    setFillStyle(1, color);
    setColor(color);
          
    sector(50+int(kl/2)+x*kl,50+int(kl/2)+kl*10+50,0,360,14,14);
    
end;

//2
procedure ship2;
begin
    setFillStyle(1, color);
    setColor(color);
          
    sector(50+int(kl/2)+x*(kl+50),50+int(kl/2)+kl*10+100,90,180,14,14);
    
    bar(50+int(kl/2)+x*(kl+50),50+int(kl/2)+kl*10+100-14, 50+int(kl/2)+x*(kl+50)+14,50+int(kl/2)+kl*10+100+14);
    
    bar(50+int(kl/2)+x*(kl+50)+kl-14,50+int(kl/2)+kl*10+100-14, 50+int(kl/2)+x*(kl+50)+kl,50+int(kl/2)+kl*10+100+14);
    
    sector(50+int(kl/2)+x*(kl+50)+kl,50+int(kl/2)+kl*10+100,270,180,14,14);
end;

//3
procedure ship3;
begin
    setFillStyle(1, color);
    setColor(color);
          
    sector(50+int(kl/2)+x*(kl+100),50+int(kl/2)+kl*10+150,90,180,14,14);
    
    bar(50+int(kl/2)+x*(kl+100),50+int(kl/2)+kl*10+150-14, 50+int(kl/2)+x*(kl+100)+14,50+int(kl/2)+kl*10+150+14);
    
    bar(50+int(kl/2)+x*(kl+100)+kl-14,50+int(kl/2)+kl*10+150-14, 50+int(kl/2)+x*(kl+100)+kl+14,50+int(kl/2)+kl*10+150+14);
    
    bar(50+int(kl/2)+x*(kl+100)+kl-14+kl,50+int(kl/2)+kl*10+150-14, 50+int(kl/2)+x*(kl+100)+kl+kl,50+int(kl/2)+kl*10+150+14);
    
    sector(50+int(kl/2)+x*(kl+100)+kl+kl,50+int(kl/2)+kl*10+150,270,180,14,14);
end;

//4
procedure ship4;
begin
    setFillStyle(1, color);
    setColor(color);
          
    sector(50+int(kl/2)+x*(kl+100),50+int(kl/2)+kl*10+200,90,180,14,14);
    
    bar(50+int(kl/2)+x*(kl+100),50+int(kl/2)+kl*10+200-14, 50+int(kl/2)+x*(kl+100)+14,50+int(kl/2)+kl*10+200+14);
    
    bar(50+int(kl/2)+x*(kl+100)+kl-14,50+int(kl/2)+kl*10+200-14, 50+int(kl/2)+x*(kl+100)+kl+14,50+int(kl/2)+kl*10+200+14);
    
    bar(50+int(kl/2)+x*(kl+100)+kl-14+kl,50+int(kl/2)+kl*10+200-14, 50+int(kl/2)+x*(kl+100)+kl+14+kl,50+int(kl/2)+kl*10+200+14);
    
    bar(50+int(kl/2)+x*(kl+100)+kl-14+kl+kl,50+int(kl/2)+kl*10+200-14, 50+int(kl/2)+x*(kl+100)+kl+kl+kl,50+int(kl/2)+kl*10+200+14);
    
    sector(50+int(kl/2)+x*(kl+100)+kl+kl+kl,50+int(kl/2)+kl*10+200,270,180,14,14);
end;
  
//ПРОВЕРКА НАЛИЧИЯ КОРАБЛЯ ДАННОЙ ДЛИННЫ
function prov1: boolean;
begin
case key of
  '1': if sh.k[1]>0 then begin
  prov1:=true;
  sh.d:=1;
  end;
  '2': if sh.k[2]>0 then begin
  prov1:=true;
  sh.d:=2;
  end;
  '3': if sh.k[3]>0 then begin
  prov1:=true;
  sh.d:=3;
  end;
  '4': if sh.k[4]>0 then begin
  prov1:=true;
  sh.d:=4;
  end;
  end;
key:=' ';
end;

//УСТАНОВКА НАПРАВЛЕНИЯ КОРАБЛЯ
procedure prov2;
begin
z6:=0;
if sh.d=1 then
     begin
       key:=' ';
       sh.n:=3;
     end
  else
  repeat
  begin
  z6:=0;
  repeat
  keypressed();
  until keypressed;
  key:=chr(readkey);
  //readln(key);
  case key of
  'г','1','п','о','a','d','h': sh.n:=1;
  'в','2','н','и','w','s','v': sh.n:=2;
  else z6:=1;
  end;
  end;
  until z6=0;
  r:=sh.n;
  key:=' ';
end;

//КООРДИНАТЫ
//X
procedure prov3;
begin
repeat
z6:=0;
  repeat
  z6:=0;
  repeat
  keypressed();
  until keypressed;
  key:=chr(readkey);
  //readln(key);
  case key of 
  '1','а','a': sh.x:=1;
  '2','б','b': sh.x:=2;
  '3','в','c': sh.x:=3;
  '4','г','d': sh.x:=4;
  '5','д','e': sh.x:=5;
  '6','е','f': sh.x:=6;
  '7','ж','g': sh.x:=7;
  '8','з','h': sh.x:=8;
  '9','и','i': sh.x:=9;
  '0','к','k': sh.x:=10;
  else z6:=1;
  end;
  until z6=0;
  
  if sh.n=3 then
    r:=sh.x;
    
  if sh.n=2 then
    r:=sh.x;
  
  if sh.n=1 then
    if (sh.x+sh.d-1)<=10 then
      r:=sh.x
    else r:=0;
until r>0;
key:=' ';
end;

//Y
procedure prov4;
begin
repeat
z6:=0;
  repeat
  z6:=0;
  repeat
  keypressed();
  until keypressed;
  key:=chr(readkey);
  //readln(key);
  case key of 
  '1': sh.y:=1;
  '2': sh.y:=2;
  '3': sh.y:=3;
  '4': sh.y:=4;
  '5': sh.y:=5;
  '6': sh.y:=6;
  '7': sh.y:=7;
  '8': sh.y:=8;
  '9': sh.y:=9;
  '0': sh.y:=10;
  else z6:=1;
  end;
  until z6=0;

  if sh.n=3 then
    r:=sh.y;
    
  if sh.n=1 then
    r:=sh.y;
  
  if sh.n=2 then
    if (sh.y+sh.d-1)<=10 then
      r:=sh.y
    else r:=0;
until r>0;
key:=' ';
end;

//Проверка занятости (X,Y)
function prov5: boolean;
begin
  if (sh.n=1) or (sh.n=3) then
  for l2:=-1 to 1 do
    for l1:=-1 to sh.d do
    l3:=l3+m.p1[sh.x+l1,sh.y+l2];
    
  if sh.n=2 then
  for l2:=-1 to sh.d do
    for l1:=-1 to 1 do
    l3:=l3+m.p1[sh.x+l1,sh.y+l2];
    
  if l3=0 then prov5:=false
  else prov5:=true;
  
  l3:=0;
end;

//"занять" клетки
procedure prov6;
begin
  if (sh.n=1) or (sh.n=3) then
    for l1:=0 to sh.d-1 do
    m.p1[sh.x+l1,sh.y]:=1;
    
  if sh.n=2 then
  for l2:=0 to sh.d-1 do
    m.p1[sh.x,sh.y+l2]:=1;

end;

//ЗАПОЛНЕНИЕ СОСЕДНИХ КЛЕТОК, ЕСЛИ "УБИЛ"
procedure zap;
begin
color:=generator.rgb(230, 230, 230);
setFillStyle(1, color);
setColor(color);
  
  //bar(ha*10, hb*10, ha*10+20, hb*10+20);
  if l3=0 then
  for l1:=0 to z1-1 do
  for z2:=-1 to 1 do
  for z3:=-1 to 1 do
  if (zax[l1]+z2>0) and (zax[l1]+z2<11) then
  if (zay[l1]+z3>0) and (zay[l1]+z3<11) then
    if m.e2[zax[l1]+z2, zay[l1]+z3]<>2 then
      begin
        m.e2[zax[l1]+z2, zay[l1]+z3]:=1;
        color:=generator.rgb(230, 230, 230);
        setFillStyle(1, color);
        setColor(color);
        
        sector(kl*10+((zax[l1]+z2)-1)*kl+int(kl/2)+100, ((zay[l1]+z3)-1)*kl+int(kl/2)+50, 0, 360, 6, 6);
      end;
  
end;

//ПРОВЕРКА "УБИЛ"
procedure ubil;
begin
l2:=0;
l3:=0;
z1:=0;

  for l1:=0 to 3 do
  if l2=0 then
    if (ha+l1)<11 then
      if m.e1[ha+l1, hb]=0 then l2:=1
      else 
      begin
           if m.e2[ha+l1, hb]=0 then 
             l3:=1;
             
           if m.e2[ha+l1, hb]=2 then 
           begin
             z1:=z1+1;
             zax[z1-1]:=ha+l1;
             zay[z1-1]:=hb;
           end
           else if m.e1[ha+l1, hb]=1 then
             l2:=1;
      end;
             
           
l2:=0;
  
  for l1:=0 downto -3 do
  if l2=0 then
    if (ha+l1)>0 then
      if m.e1[ha+l1, hb]=0 then l2:=1
      else 
      begin
           if m.e2[ha+l1, hb]=0 then 
             l3:=1;
             
           if m.e2[ha+l1, hb]=2 then 
           begin
             z1:=z1+1;
             zax[z1-1]:=ha+l1;
             zay[z1-1]:=hb;
           end
           else if m.e1[ha+l1, hb]=1 then
             l2:=1;
      end;

l2:=0;

  for l1:=0 to 3 do
  if l2=0 then
    if (hb+l1)<11 then
      if m.e1[ha, hb+l1]=0 then l2:=1
      else 
      begin
           if m.e2[ha, hb+l1]=0 then 
             l3:=1;
             
           if m.e2[ha, hb+l1]=2 then 
           begin
             z1:=z1+1;
             zax[z1-1]:=ha;
             zay[z1-1]:=hb+l1;
           end
           else if m.e1[ha, hb+l1]=1 then
             l2:=1;
      end;
      
l2:=0;

  for l1:=0 downto -3 do
  if l2=0 then
    if (hb+l1)>0 then
      if m.e1[ha, hb+l1]=0 then l2:=1
      else 
      begin
           if m.e2[ha, hb+l1]=0 then 
             l3:=1;
             
           if m.e2[ha, hb+l1]=2 then 
           begin
             z1:=z1+1;
             zax[z1-1]:=ha;
             zay[z1-1]:=hb+l1;
           end
           else if m.e1[ha, hb+l1]=1 then
             l2:=1;
      end;
  
  zap;
  dodraw;
  
end;

//ЗАПОЛНЕНИЕ КЛЕТОК РЯДОМ С "УБИТЫМ" ИИ
procedure zap2;
begin
color:=generator.rgb(230, 230, 230);
setFillStyle(1, color);
setColor(color);
  
  if l3=0 then
  for l1:=0 to z1-1 do
  for z2:=-1 to 1 do
  for z3:=-1 to 1 do
  if (zax[l1]+z2>0) and (zax[l1]+z2<11) then
  if (zay[l1]+z3>0) and (zay[l1]+z3<11) then
    if m.p2[zax[l1]+z2, zay[l1]+z3]<>2 then
      begin
        m.p2[zax[l1]+z2, zay[l1]+z3]:=1;
        color:=generator.rgb(230, 230, 230);
        setFillStyle(1, color);
        setColor(color);
        
        sector(((zax[l1]+z2)-1)*kl+int(kl/2)+50, ((zay[l1]+z3)-1)*kl+int(kl/2)+50, 0, 360, 6, 6);
        
        lastx:=0;
        lasty:=0;
      end;
  
end;

//ПРОВЕРКА "УБИЛ" ИИ
procedure ubil2;
begin
l1:=0;
l2:=0;
l3:=0;
z1:=0;

  for l1:=0 to 3 do
  if l2=0 then
    if (m.es1[rand1]+l1)<11 then
      if m.p1[m.es1[rand1]+l1, m.es2[rand1]]=0 then l2:=1
      else 
      begin
           if m.p2[m.es1[rand1]+l1, m.es2[rand1]]=0 then 
             l3:=1;
             
           if m.p2[m.es1[rand1]+l1, m.es2[rand1]]=2 then 
           begin
             z1:=z1+1;
             zax[z1-1]:=m.es1[rand1]+l1;
             zay[z1-1]:=m.es2[rand1];
           end
           else if m.p1[m.es1[rand1]+l1, m.es2[rand1]]=1 then
             l2:=1;
      end;
             
           
l2:=0;
  
  for l1:=0 downto -3 do
  if l2=0 then
    if (m.es1[rand1]+l1)>0 then
      if m.p1[m.es1[rand1]+l1, m.es2[rand1]]=0 then l2:=1
      else 
      begin
           if m.p2[m.es1[rand1]+l1, m.es2[rand1]]=0 then 
             l3:=1;
             
           if m.p2[m.es1[rand1]+l1, m.es2[rand1]]=2 then 
           begin
             z1:=z1+1;
             zax[z1-1]:=m.es1[rand1]+l1;
             zay[z1-1]:=m.es2[rand1];
           end
           else if m.p1[m.es1[rand1]+l1, m.es2[rand1]]=1 then
             l2:=1;
      end;

l2:=0;

  for l1:=0 to 3 do
  if l2=0 then
    if (m.es2[rand1]+l1)<11 then
      if m.p1[m.es1[rand1], m.es2[rand1]+l1]=0 then l2:=1
      else 
      begin
           if m.p2[m.es1[rand1], m.es2[rand1]+l1]=0 then 
             l3:=1;
             
           if m.p2[m.es1[rand1], m.es2[rand1]+l1]=2 then 
           begin
             z1:=z1+1;
             zax[z1-1]:=m.es1[rand1];
             zay[z1-1]:=m.es2[rand1]+l1;
           end
           else if m.p1[m.es1[rand1], m.es2[rand1]+l1]=1 then
             l2:=1;
      end;
      
l2:=0;

  for l1:=0 downto -3 do
  if l2=0 then
    if (m.es2[rand1]+l1)>0 then
      if m.p1[m.es1[rand1], m.es2[rand1]+l1]=0 then l2:=1
      else 
      begin
           if m.p2[m.es1[rand1], m.es2[rand1]+l1]=0 then 
             l3:=1;
             
           if m.p2[m.es1[rand1], m.es2[rand1]+l1]=2 then 
           begin
             z1:=z1+1;
             zax[z1-1]:=m.es1[rand1];
             zay[z1-1]:=m.es2[rand1]+l1;
           end
           else if m.p1[m.es1[rand1], m.es2[rand1]+l1]=1 then
             l2:=1;
      end;
  
  zap2;
  dodraw;
  
end;

//ИИ ПРОМАЗАЛ > РИСУЕМ ТОЧКУ
procedure promax;
begin
  color:=generator.rgb(230, 230, 230);
  setFillStyle(1, color);
  setColor(color);
  
  m.p2[m.es1[rand1], m.es2[rand1]]:=1;
  sector((m.es1[rand1]-1)*kl+int(kl/2)+50, (m.es2[rand1]-1)*kl+int(kl/2)+50, 0, 360, 6, 6);
  
end;

//ИИ ПОПАЛ > РИСУЕМ "КРЕСТИК"
procedure popal;
begin
  color:=generator.rgb(0, 0, 0);
  setFillStyle(1, color);
  setColor(color);
  
  SetLineStyle(SolidLn, 0, ThickWidth);
  
  line((m.es1[rand1]-1)*kl+50+5, (m.es2[rand1]-1)*kl+50+5, (m.es1[rand1]-1)*kl+kl+50-5, (m.es2[rand1]-1)*kl+kl+50-5);
        
  line((m.es1[rand1]-1)*kl+50+5, (m.es2[rand1]-1)*kl+kl+50-5, (m.es1[rand1]-1)*kl+kl+50-5, (m.es2[rand1]-1)*kl+50+5);
  
  //ПРОВЕРКА НА "УБИЛ"
  ubil2;
end;

procedure winE;
begin
  if ostE=0 then 
  begin
    readln();
    
    restart:=1;
    z4:=0;
    lastx:=0;
    lasty:=0;
  
    setFillStyle(1, black);
    setColor(black);
    bar(0,0, 1000,1000);
    
    settextstyle(defaultfont,horizdir,5);
    setcolor(white);
    setTextJustify(centertext, centertext);
    
    if lng='uk' then
    outtextXY(getmaxX div 2, 200, 'ШI виграв');
    
    if lng='en' then
    outtextXY(getmaxX div 2, 200, 'AI wins');
    
    if lng='ru' then
    outtextXY(getmaxX div 2, 200, 'ИИ выиграл');
    winscountE:=winscountE+1;
    dodraw;
    readln();
  end;
end;

procedure winP;
begin
  if ostP=0 then 
  begin
    readln();
    
    restart:=2;
    z6:=0;
    lastx:=0;
    lasty:=0;
  
    setFillStyle(1, black);
    setColor(black);
    bar(0,0, 1000,1000);
    
    settextstyle(defaultfont,horizdir,5);
    setcolor(white);
    setTextJustify(centertext, centertext);
    
    if lng='uk' then
    outtextXY(getmaxX div 2, 200, 'Гравець виграв');
    
    if lng='en' then
    outtextXY(getmaxX div 2, 200, 'Player wins');
    
    if lng='ru' then
    outtextXY(getmaxX div 2, 200, 'Игрок выиграл');
    winscountP:=winscountP+1;
    dodraw;
    readln();
  end;
end;





//НАЧАЛО КОДА ОСНОВНОЙ ПРОЦЕДУРЫ
procedure main_code;
begin
kl:=45;

blbar;

setFillStyle(1, black);
setColor(white);

SetLineStyle(0, 0, 0);
//отрисовка полей
//разметка 1
for y:=0 to 9 do
  for x:=0 to 9 do
  bar(x*kl+50,y*kl+50,x*kl+kl+50,y*kl+kl+50);

//разметка 2
for y:=0 to 9 do
  for x:=0 to 9 do
  bar((x*kl+50)+(kl*10+50),y*kl+50,(x*kl+kl+50)+kl*10+50,y*kl+kl+50);
  
//отрисовка чисел и (букв) чисел по краям
//числа 1
for x:=0 to 9 do
begin
  settextjustify(toptext,toptext);
  settextstyle(defaultfont,horizdir,3);
  
  if (lng='ru') or (lng='uk') then
  case x of
  0: s:='а';
  1: s:='б';
  2: s:='в';
  3: s:='г';
  4: s:='д';
  5: s:='е';
  6: s:='ж';
  7: s:='з';
  8: s:='и';
  9: s:='к';
  end;
  
  if lng='en' then
  case x of
  0: s:='a';
  1: s:='b';
  2: s:='c';
  3: s:='d';
  4: s:='e';
  5: s:='f';
  6: s:='g';
  7: s:='h';
  8: s:='i';
  9: s:='k';
  end;
  
  outtextxy(x*kl+50+kl-15,int(kl/2)+15,s);
end;

//числа 2
for x:=0 to 9 do
begin
  settextjustify(toptext,toptext);
  settextstyle(defaultfont,horizdir,3);
  
  if (lng='ru') or (lng='uk') then
  case x of
  0: s:='а';
  1: s:='б';
  2: s:='в';
  3: s:='г';
  4: s:='д';
  5: s:='е';
  6: s:='ж';
  7: s:='з';
  8: s:='и';
  9: s:='к';
  end;
  
  if lng='en' then
  case x of
  0: s:='a';
  1: s:='b';
  2: s:='c';
  3: s:='d';
  4: s:='e';
  5: s:='f';
  6: s:='g';
  7: s:='h';
  8: s:='i';
  9: s:='k';
  end;
  
  outtextxy(x*kl+50+kl*10+50+kl-15,int(kl/2)+15,s);
end;

//числа 3
for x:=0 to 9 do
begin
  settextjustify(centertext,centertext);
  settextstyle(defaultfont,horizdir,3);
  str(x+1,s);
  outtextxy(int(kl/2),x*kl+50+int(kl/2),s);
end;

//числа 4
for x:=0 to 9 do
begin
  settextjustify(centertext,centertext);
  settextstyle(defaultfont,horizdir,3);
  str(x+1,s);
  outtextxy(int(kl/2)+kl*10+50,x*kl+50+int(kl/2),s);
end;
  
r:=14;
  
//РАССТАНОВКА КОРАБЛЕЙ
color:=generator.rgb(255,255,255);
//отрисовка "резерва"
//1
for x:=0 to sh.k[1]-1 do
ship1;

//2
for x:=0 to sh.k[2]-1 do
ship2;
  
//3
for x:=0 to sh.k[3]-1 do
ship3;
  
//4
for x:=0 to sh.k[4]-1 do
ship4;

repeat
begin
//размер корабля
settextjustify(lefttext,toptext);
if lng='uk' then
s:='Розмір: ';

if lng='en' then
s:='Size: ';

if lng='ru' then
s:='Размер: ';
setFillStyle(1, white);
setColor(white);

outTextXY(kl*10+100,kl*10+100,s);

dodraw;

repeat
repeat
keypressed();
until keypressed;
key:=chr(readkey);
delay(100);
//readln(key);
until prov1;

if lng='uk' then
s:='Розмір: '+sh.d;

if lng='en' then
s:='Size: '+sh.d;

if lng='ru' then
s:='Размер: '+sh.d;

setFillStyle(1, black);
setColor(black);

bar(kl*10+50, kl*10+60, kl*10+50+300, kl*10+50+50);

setFillStyle(1, white);
setColor(white);

outTextXY(kl*10+100,kl*10+100,s);
key:=' ';
//направление
settextjustify(lefttext,toptext);
if lng='uk' then
s:='Напрямок: ';

if lng='en' then
s:='Direction: ';

if lng='ru' then
s:='Направление: ';
setFillStyle(1, white);
setColor(white);

outTextXY(kl*10+100,kl*10+150,s);

repeat
prov2;
until (r=1) or (r=2) or (r=3);

if lng='uk' then
case r of
1: s1:='гориз.';
2: s1:='верт.';
3: s1:='н.в.';
end;

if lng='en' then
case r of
1: s1:='horiz.';
2: s1:='vert.';
3: s1:='n.m.';
end;

if lng='ru' then
case r of
1: s1:='гориз.';
2: s1:='верт.';
3: s1:='н.в.';
end;

if lng='uk' then
s:='Напрямок: '+s1;

if lng='en' then
s:='Direction: '+s1;

if lng='ru' then
s:='Направление: '+s1;
sh.n:=r;

setFillStyle(1, black);
setColor(black);

bar(kl*10+50, kl*10+120, kl*10+50+400, kl*10+120+50);

setFillStyle(1, white);
setColor(white);

outTextXY(kl*10+100,kl*10+150,s);

//Координаты
repeat
//координата X
setFillStyle(1, black);
setColor(black);

bar(kl*10+50, kl*10+170, kl*10+50+350, kl*10+220+50);

settextjustify(lefttext,toptext);

repeat
prov3;
until sh.x>0;

sh.x:=r;

if (lng='ru') or (lng='uk') then
case r of
1: s:='а';
2: s:='б';
3: s:='в';
4: s:='г';
5: s:='д';
6: s:='е';
7: s:='ж';
8: s:='з';
9: s:='и';
10: s:='к';
end;

if lng='en' then
case r of
1: s:='a';
2: s:='b';
3: s:='c';
4: s:='d';
5: s:='e';
6: s:='f';
7: s:='g';
8: s:='h';
9: s:='i';
10: s:='k';
end;

setFillStyle(1, white);
setColor(white);

outTextXY(kl*10+100,kl*10+200,s);

//координата Y
settextjustify(lefttext,toptext);

repeat
prov4;
until sh.x>0;

sh.y:=r;
s:=s + r;

setFillStyle(1, black);
setColor(black);

bar(kl*10+50, kl*10+170, kl*10+50+350, kl*10+220+50);

setFillStyle(1, white);
setColor(white);

outTextXY(kl*10+100,kl*10+200,s);
until prov5=false;

//"занять" клетки
prov6;

//отрисовка корабля
//"зачёркивание"
sh.k[sh.d]:=sh.k[sh.d]-1;
color:=generator.rgb(0,0,0);
case sh.d of
1: begin
     x:=sh.k[1];
     ship1;
   end;

2: begin
     x:=sh.k[2];
     ship2;
   end;

3: begin
     x:=sh.k[3];
     ship3;
   end;

4: begin
     x:=sh.k[4];
     ship4;
   end;
end;

r:=sh.n;

setFillStyle(1, white);
setColor(white);

//ОБЫЧНАЯ ОТРИСОВКА КОРАБЛЕЙ
if (r=1) or (r=3) then
for l1:=0 to sh.d-1 do
bar((sh.x+l1-1)*kl+50+5, (sh.y-1)*kl+50+5, (sh.x+l1-1)*kl+kl+50-5, (sh.y-1)*kl+kl+50-5);

if r=2 then
for l1:=0 to sh.d-1 do
bar((sh.x-1)*kl+50+5, (sh.y+l1-1)*kl+50+5, (sh.x-1)*kl+kl+50-5, (sh.y+l1-1)*kl+kl+50-5);

dodraw;

repeat
keypressed();
until keypressed;
key:=chr(readkey);

case key of
'r','р': begin
//убрать" корабль
setFillStyle(1, black);
setColor(black);

if (r=1) or (r=3) then
for l1:=0 to sh.d-1 do
bar((sh.x+l1-1)*kl+50+5, (sh.y-1)*kl+50+5, (sh.x+l1-1)*kl+kl+50-5, (sh.y-1)*kl+kl+50-5);

if r=2 then
for l1:=0 to sh.d-1 do
bar((sh.x-1)*kl+50+5, (sh.y+l1-1)*kl+50+5, (sh.x-1)*kl+kl+50-5, (sh.y+l1-1)*kl+kl+50-5);

color:=generator.rgb(255,255,255);
case sh.d of
1: ship1;
2: ship2;
3: ship3;
4: ship4;
end;

sh.k[sh.d]:=sh.k[sh.d]+1;

begin
  if (sh.n=1) or (sh.n=3) then
    for l1:=0 to sh.d-1 do
    m.p1[sh.x+l1,sh.y]:=0;
    
  if sh.n=2 then
  for l2:=0 to sh.d-1 do
    m.p1[sh.x,sh.y+l2]:=0;

end;

end;

end;
//readln();
setFillStyle(1, black);
setColor(black);
bar(kl*10+50, kl*10+60, kl*10+50+450, kl*10+220+50);

r:=0;
sh.d:=0;
sh.n:=0;
sh.x:=0;
sh.y:=0;
key:='0';
s:='';
s1:='';
end;
until (sh.k[1]+sh.k[2]+sh.k[3]+sh.k[4])=0;
//КОНЕЦ РАССТАНОВКА КОРАБЛЕЙ ИГРОКА







//НАЧАЛО РАССТАНОВКА КОРАБЛЕЙ ИИ
sh.k[1]:=4;
sh.k[2]:=3;
sh.k[3]:=2;
sh.k[4]:=1;
l3:=0;

setlength(m.es1,105);
setlength(m.es2,105);
setlength(m.es3,105);
setlength(m.es4,105);

begin
  for z1:=4 downto 1 do
    for z2:=1 to sh.k[z1] do
    begin
      for b:=1 to 10 do
        for a:=1 to 10 do
        begin
        l3:=0;
          for l1:=-1 to 1 do
            for l2:=-1 to z1 do
            if (b+z1-1)<11 then
              if (0<(a+l1)) and ((a+l1)<11) then
                if (0<(b+l2)) and ((b+l2)<11) then
                if m.e1[l1+a, l2+b]>0 then l3:=100
                else l3:=l3
              else l3:=l3
              else l3:=l3
            else l3:=l3+1;
              
          if l3=0 then 
          begin
            m.es1[z3]:=a;
            m.es2[z3]:=b;
            z3:=z3+1;
          end;
          
          l3:=0;
          
          for l2:=-1 to 1 do
            for l1:=-1 to z1 do
            if (a+z1-1)<11 then
              if (0<(a+l1)) and ((a+l1)<11) then
                if (0<(b+l2)) and ((b+l2)<11) then
                if m.e1[l1+a, l2+b]>0 then l3:=100
                else l3:=l3
              else l3:=l3
              else l3:=l3
            else l3:=l3+1;
              
          if l3=0 then 
          begin
            m.es3[z4]:=a;
            m.es4[z4]:=b;
            z4:=z4+1;
          end;
          
          l3:=0;
        end;//for a:=1 to 10 do
    
      //ЗАПОЛНЕНИЕ МАССИВА
      //ВЫБОР ПОЗИЦИИ
      begin
        rand2:=random(2)+1;
        case rand2 of
        1: rand1:=random(z3);
        2: rand1:=random(z4);
        end;
      end;
      
      begin
        case rand2 of
        2: for x:=0 to z1-1 do
        m.e1[m.es3[rand1]+x, m.es4[rand1]]:=1;
        1: for y:=0 to z1-1 do
        m.e1[m.es1[rand1], m.es2[rand1]+y]:=1;
        end;
        z3:=0;
        z4:=0;
        
      end;
      
    
    end;//for z2:=1 to sh.k[z1] do
//КОНЕЦ РАССТАНОВКИ КОРАБЛЕЙ ИИ
  
  
end;
  
  l3:=0;
  
  setcolor(black);
  setfillstyle(1, black);
  bar(0, kl*10+52, kl*10+52, kl*10+52+500);
  
  
  //НАЧАЛО ИГРЫ (ХОДЫ)
while restart=0 do
begin
repeat
begin
//ХОД ИГРОКА
repeat
s:=' ';
setFillStyle(1, black);
setColor(black);
bar(kl*10+50, kl*10+60, kl*10+50+450, kl*10+220+50);

  settextjustify(lefttext,toptext);
  settextstyle(defaultfont,horizdir,3);
  setcolor(white);
  
  if lng='uk' then
  outtextxy(kl*10+100, kl*10+100, 'Ваш хід');
  
  if lng='en' then
  outtextxy(kl*10+100, kl*10+100, 'Your turn');
  
  if lng='ru' then
  outtextxy(kl*10+100, kl*10+100, 'Ваш ход');
    
    repeat
    z7:=0;
    repeat
    keypressed();
    until keypressed;
    key:=chr(readkey);
    //readln(key);
    case key of
    'а','1','a': ha:=1;
    'б','2','b': ha:=2;
    'в','3','c': ha:=3;
    'г','4','d': ha:=4;
    'д','5','e': ha:=5;
    'е','6','f': ha:=6;
    'ж','7','g': ha:=7;
    'з','8','h': ha:=8;
    'и','9','i': ha:=9;
    'к','0','k': ha:=10;
    else z7:=1;
    end;
    until z7=0;
    
    if (lng='ru') or (lng='uk') then
    case ha of
    1: s:='а';
    2: s:='б';
    3: s:='в';
    4: s:='г';
    5: s:='д';
    6: s:='е';
    7: s:='ж';
    8: s:='з';
    9: s:='и';
    10: s:='к';
    end;
    
    if lng='en' then
    case ha of
    1: s:='a';
    2: s:='b';
    3: s:='c';
    4: s:='d';
    5: s:='e';
    6: s:='f';
    7: s:='g';
    8: s:='h';
    9: s:='i';
    10: s:='k';
    end;
    
    setFillStyle(1, black);
    setColor(black);
    bar(kl*10+50, kl*10+60, kl*10+50+450, kl*10+220+50);
    
    setColor(white);
    outtextxy(kl*10+100, kl*10+100, s);
    
    repeat
    z7:=0;
    repeat
    keypressed();
    until keypressed;
    key:=chr(readkey);
    //readln(key);
    case key of
    '1': hb:=1;
    '2': hb:=2;
    '3': hb:=3;
    '4': hb:=4;
    '5': hb:=5;
    '6': hb:=6;
    '7': hb:=7;
    '8': hb:=8;
    '9': hb:=9;
    '0': hb:=10;
    else z7:=1;
    end;
    until z7=0;
    
    s:=s + int(hb);
    
    setFillStyle(1, black);
    setColor(black);
    bar(kl*10+50, kl*10+60, kl*10+50+450, kl*10+220+50);
    
    setcolor(white);
    
    outtextxy(kl*10+100, kl*10+100, s);
    
until m.e2[ha, hb]=0;
    
    setFillStyle(1, white);
    setColor(white);
    
    if m.e2[ha, hb]=0 then
    begin
      if m.e1[ha, hb]=0 then
      begin
        color:=generator.rgb(230, 230, 230);
        setFillStyle(1, color);
        setColor(color);
        
        m.e2[ha, hb]:=1;
        z6:=0;
        
        sector(kl*10+(ha-1)*kl+int(kl/2)+100, (hb-1)*kl+int(kl/2)+50, 0, 360, 6, 6);
      end;
      
      if m.e1[ha, hb]=1 then
      begin
        m.e2[ha, hb]:=2;
        z6:=1;
        
        SetLineStyle(SolidLn, 0, ThickWidth);
        
        color:=generator.rgb(255,255,255);
        setFillStyle(1, color);
        setColor(color);
        
        bar(kl*10+(ha-1)*kl+100+5, (hb-1)*kl+50+5, kl*10+(ha-1)*kl+kl+100-5, (hb-1)*kl+kl+50-5);
        
        color:=generator.rgb(0,0,0);
        setFillStyle(1, color);
        setColor(color);
        
        line(kl*10+(ha-1)*kl+100+5, (hb-1)*kl+50+5, kl*10+(ha-1)*kl+kl+100-5, (hb-1)*kl+kl+50-5);
        
        line(kl*10+(ha-1)*kl+100+5, (hb-1)*kl+kl+50-5, kl*10+(ha-1)*kl+kl+100-5, (hb-1)*kl+50+5);
        
        //проверка "убил/ранил"
        ostP:=ostP-1;
        ubil;
      end;
    end;
dodraw;
winP;
end;
until z6=0;
//КОНЕЦ ХОДА ИГРОКА




repeat
//ОБЫЧНЫЙ ХОД ИИ
if restart=0 then
if lastx=0 then
begin
z3:=0;
z4:=0;
rand1:=0;
rand2:=0;
setlength(m.es1, 105);
setlength(m.es2, 105);

//ПОИСК СВОБОДНЫХ КЛЕТОК
  for b:=1 to 10 do
    for a:=1 to 10 do
    if m.p2[a,b]=0 then
    //строчка для ИИ-читера
    //if m.p1[a,b]=1 then
    begin
      z3:=z3+1;
      m.es1[z3]:=a;
      m.es2[z3]:=b;
    end;
    
//ВЫБОР РАНДОМНОЙ СВОБОДНОЙ КЛЕТКИ
  rand1:=random(z3)+1;
  
  //ВИЗУАЛИЗАЦИЯ ВЫБОРА КЛЕТКИ
color:=generator.rgb(0, 0, 0);
setFillStyle(1, color);
setColor(color);

bar(0, kl*10+60, kl*10+50, kl*10+60+400);

settextjustify(lefttext,toptext);
settextstyle(defaultfont,horizdir,3);
color:=generator.rgb(255, 255, 255);
setFillStyle(1, color);
setColor(color);

if (lng='ru') or (lng='uk') then
case m.es1[rand1] of
1: s:='а';
2: s:='б';
3: s:='в';
4: s:='г';
5: s:='д';
6: s:='е';
7: s:='ж';
8: s:='з';
9: s:='и';
10: s:='к';
end;

if lng='en' then
case m.es1[rand1] of
1: s:='a';
2: s:='b';
3: s:='c';
4: s:='d';
5: s:='e';
6: s:='f';
7: s:='g';
8: s:='h';
9: s:='i';
10: s:='k';
end;

s:=s + '' + m.es2[rand1];

outtextxy(50, kl*10+100, s);
  
//РАБОТА С ВЫБРАННОЙ КЛЕТКОЙ
  //если пустая
  if m.p1[m.es1[rand1],m.es2[rand1]]=0 then
    //рисовать точку
  begin
    z4:=0;
    
    m.p2[m.es1[rand1], m.es2[rand1]]:=1;
    
    promax;
  end;
  if m.p1[m.es1[rand1],m.es2[rand1]]=1 then //рисовать "крестик"
  begin
    z4:=0;
    
    m.p2[m.es1[rand1], m.es2[rand1]]:=2;
    popal;
    
    ostE:=ostE-1;
    
    lastx:=m.es1[rand1];
    lasty:=m.es2[rand1];
    repeat
    keypressed();
    until keypressed;
    key:=chr(readkey);
    //readln();
  end;
  
  dodraw;
end;




//УМНЫЕ ХОДЫ ИИ
if restart=0 then
if lastx<>0 then
begin
z5:=0;
l2:=0;
gorz:=0;
vert:=0;

//ПРОВЕРКА "ПОДБИТЫХ" РЯДОМ
if lastx-1>0 then
  if (m.p2[lastx-1, lasty]=2) then vert:=1;

if lastx+1<11 then
  if (m.p2[lastx+1, lasty]=2) then vert:=1;

if lasty-1>0 then
  if (m.p2[lastx, lasty-1]=2) then gorz:=1;
  
if lasty+1<11 then
  if (m.p2[lastx, lasty+1]=2) then gorz:=1;
  
if (gorz=1) and (vert=1) then 
begin
  z4:=0;
  lastx:=0;
  lasty:=0;
end;
  
  //ЗАПИСЬ СВОБОДНЫХ КЛЕТОК ПО КРАЯМ
  if gorz=0 then
  begin
    
    for l1:=1 to 3 do
    if l2=0 then
      if lastx-l1>0 then
      begin
        if m.p2[lastx-l1, lasty]=0 then
        begin
          z5:=z5+1;
          zax[z5]:=lastx-l1;
          zay[z5]:=lasty;
          l2:=1;
        end;
        
        if m.p2[lastx-l1, lasty]=1 then
          l2:=1;
      end;
        
    
    l2:=0;
    
    
    for l1:=1 to 3 do
    if l2=0 then
      if lastx+l1<11 then
      begin
        if m.p2[lastx+l1, lasty]=0 then
        begin
          z5:=z5+1;
          zax[z5]:=lastx+l1;
          zay[z5]:=lasty;
          l2:=1;
        end;
        
        if m.p2[lastx+l1, lasty]=1 then
          l2:=1;
      end;
  end;
  
  l2:=0;
  
  if vert=0 then
  begin
    
    for l1:=1 to 3 do
    if l2=0 then
      if lasty-l1>0 then
      begin
        if m.p2[lastx, lasty-l1]=0 then
        begin
          z5:=z5+1;
          zax[z5]:=lastx;
          zay[z5]:=lasty-l1;
          l2:=1;
        end;
        
        if m.p2[lastx, lasty-l1]=1 then
          l2:=1;
      end;
    
    l2:=0;
    
    
    for l1:=1 to 3 do
    if l2=0 then
      if lasty+l1<11 then
      begin
        if m.p2[lastx, lasty+l1]=0 then
        begin
          z5:=z5+1;
          zax[z5]:=lastx;
          zay[z5]:=lasty+l1;
          l2:=1;
        end;
        
        if m.p2[lastx, lasty+l1]=1 then
          l2:=1;
      end;
  end;
  //КОНЕЦ ЗАПИСИ КЛЕТОК
  
  
  //ВЫБОР РАНДОМНОЙ КЛЕТКИ
    rand1:=random(z5)+1;
    
    rand1:=rand1;
    m.es1[rand1]:=zax[rand1];
    m.es2[rand1]:=zay[rand1];
    
    //ВИЗУАЛИЗАЦИЯ ВЫБОРА КЛЕТКИ
color:=generator.rgb(0, 0, 0);
setFillStyle(1, color);
setColor(color);

bar(0, kl*10+60, kl*10+50, kl*10+60+400);

settextjustify(lefttext,toptext);
settextstyle(defaultfont,horizdir,3);
color:=generator.rgb(255, 255, 255);
setFillStyle(1, color);
setColor(color);

if (lng='ru') or (lng='uk') then
case m.es1[rand1] of
1: s:='а';
2: s:='б';
3: s:='в';
4: s:='г';
5: s:='д';
6: s:='е';
7: s:='ж';
8: s:='з';
9: s:='и';
10: s:='к';
end;

if lng='en' then
case m.es1[rand1] of
1: s:='a';
2: s:='b';
3: s:='c';
4: s:='d';
5: s:='e';
6: s:='f';
7: s:='g';
8: s:='h';
9: s:='i';
10: s:='k';
end;

s:=s + '' + m.es2[rand1];

outtextxy(50, kl*10+100, s);

    if m.p1[zax[rand1], zay[rand1]]=1 then
      begin
        lastx:=zax[rand1];
        lasty:=zay[rand1];
        m.p2[zax[rand1], zay[rand1]]:=2;
        z4:=1;
        popal;
        
        ostE:=ostE-1;
        
        repeat
        keypressed();
        until keypressed;
        key:=chr(readkey);
        //readln();
      end
    else 
      begin
        z4:=0;
        m.p2[zax[rand1], zay[rand1]]:=1;
        promax;
      end;
  //КОНЕЦ ВЫБОРА РАНДОМНОЙ КЛЕТКИ
  
  dodraw;
  winE;
end;
until z4=0;
//КОНЕЦ ХОДА ИИ
    
  end;//while true do
end;



//ОСНОВНОЙ КОД
begin
initGraph(detect, 0, '');
lng:='ru';

//НАЧАЛЬНОЕ ПРЕДСТАВЛЕНИЕ
begin
  setTextJustify(centertext, centertext);
  setFillStyle(1, white);
  setColor(white);
  settextstyle(defaultfont,horizdir,4);
    
  outtextXY(getmaxX div 2, 200, 'Big Orange Giant company');
  
  delay(2000);
  
  blbar;
  
  setFillStyle(1, white);
  setColor(white);
  outtextXY(getmaxX div 2, 200, 'along with Crazy Grass developer');
  
  delay(2000);
  
  blbar;
  
  setFillStyle(1, white);
  setColor(white);
  outtextXY(getmaxX div 2, 200, 'present');
  
  delay(2000);
  
  blbar;
  
  settextstyle(defaultfont,horizdir,5);
  setFillStyle(1, white);
  setColor(white);
  outtextXY(getmaxX div 2, 200, 'Sea Battle: Rulers of the Seas');
  
  settextstyle(defaultfont,horizdir,4);
  outtextXY(getmaxX div 2, 260, 'with AI');
  
  klr:=25;
  ox:=100;
  oy:=300;
  drawship;
  dodraw;
  delay(4000);
end;

  repeat
  begin
    restart:=0;
    z3:=0;
    ostP:=20;
    ostE:=20;
    
    for y:=0 to 11 do
      for x:=0 to 11 do
      begin
        m.p1[x,y]:=0;
        m.p2[x,y]:=0;
        m.e1[x,y]:=0;
        m.e2[x,y]:=0;
      end;
    blbar;
    
    klr:=10;
    ox:=600;
    oy:=225;
    drawship;
    dodraw;

    setTextJustify(lefttext, centertext);
    setFillStyle(1, white);
    setColor(white);
    settextstyle(defaultfont,horizdir,5);
    
    if lng='uk' then
    outtextXY(25, 50, 'Головне меню');
    
    if lng='en' then
    outtextXY(25, 50, 'Main menu');
    
    if lng='ru' then
    outtextXY(25, 50, 'Главное меню');
    
    settextstyle(defaultfont,horizdir,4);
    
    if lng='uk' then
    begin
    outtextXY(25, 175, 'Почати гру (будь-яка кнопка, крім "w", "x" і "c")');
    
    outtextXY(25, 250, 'Рахунок (w)');
    
    outtextXY(25, 325, 'Вибір мови (c)');
    
    outtextXY(25, 400, 'вихід (x)');
    end;
    
    if lng='en' then
    begin
    outtextXY(25, 175, 'Start playing (any button except "c", "x" and "w")');
    
    outtextXY(25, 250, 'Score (w)');
    
    outtextXY(25, 325, 'Language selection (c)');
    
    outtextXY(25, 400, 'Exit (x)');
    end;
    
    if lng='ru' then
    begin
    outtextXY(25, 175, 'Начать игру (любая кнопка, кроме "c", "w"');
    outtextXY(25, 230, 'и "x")');
    
    outtextXY(25, 250+55, 'Счёт (w)');
    
    outtextXY(25, 325+55, 'Сменить язык (c)');
    
    outtextXY(25, 400+55, 'Выход (x)');
    end;
    
    dodraw;
    
    repeat
    keypressed();
    until keypressed;
    key:=chr(readkey);
    //readln(key);
    
    case key of
    'x': key:=key;
    'w': begin
      blbar;
      
      setTextJustify(centertext, centertext);
      setFillStyle(1, white);
      setColor(white);
      
      settextstyle(defaultfont,horizdir,5);
      if lng='uk' then
      s:='Рахунок';
      
      if lng='en' then
      s:='Score';
      
      if lng='ru' then
      s:='Счёт';
      outtextXY(25+475, 50, s);
      
      setTextJustify(centertext, centertext);
      
      settextstyle(defaultfont,horizdir,4);
      if lng='uk' then
      s:='Г : ШІ';
      
      if lng='en' then
      s:='P : AI';
      
      if lng='ru' then
      s:='И : Вр';
      outtextXY(100+400, 175, s);
      s:=winscountP + ' : ' + winscountE;
      outtextXY(90+400, 250, s);
      
      s:='';
      
      dodraw;
      
      repeat
      keypressed();
      until keypressed;
      //readln();
    end;
    'c': begin
      blbar;
      settextstyle(defaultfont,horizdir,5);
      setFillStyle(1, white);
      setColor(white);
      
      if lng='uk' then
      s:='Вибір мови';
      if lng='en' then
      s:='Language selection';
      if lng='ru' then
      s:='Выбор языка';
      outtextXY(25, 50, s);
      
      settextstyle(defaultfont,horizdir,4);
      setFillStyle(1, white);
      setColor(white);
      s:='Русский (r)';
      outtextXY(25, 150, s);
      
      s:='English (e)';
      outtextXY(25, 225, s);
      
      s:='Український (u)';
      outtextXY(25, 300, s);
      
      dodraw;
      repeat
      keypressed();
      until keypressed;
      key2:=chr(readkey);
      //readln(key2);
      
      case key2 of
      'r': lng:='ru';
      'e': lng:='en';
      'u': lng:='uk';
      end;
      
    end;
    else main_code;
    end;
    
  end;
  until key='x';
  
  blbar;
  
  settextstyle(defaultfont,horizdir,4);
  setTextJustify(centertext, centertext);
  setFillStyle(1, white);
  setColor(white);
  
  if lng='uk' then
  outtextXY(getmaxX div 2, 250, 'Бувай! Максвелл буде нудьгувати за Вас');
  
  if lng='en' then
  outtextXY(getmaxX div 2, 250, 'Bye! Maxwell will miss you');
  
  if lng='ru' then
  outtextXY(getmaxX div 2, 250, 'Пока! Максвелл будет скучать по Вам');
  dodraw;
  readln();
end.

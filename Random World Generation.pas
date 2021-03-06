//Идея ~10.04.19
//Первая реализация 14.04.19
//Смерть версии Gener_Scroll 30.09.19
//Продвижение версии Gener_World_Rand 30.09.19

program Gener_World_Rand;
uses crt, graph, dos;

var
x, y, a, b, c, c1, rx, ry, k: integer;

wrl: array of array of integer;

//для определения времени
h, n, s, z: integer;
h1, n1, s1, z1: integer;
h2, n2, s2, z2: integer;
h3, n3, s3, z3: integer;

//ключ клавиши
key: char;

//для текста
tx: string;

//диапазон значений
dia1: integer;
dia2: integer;

//размеры мира
wx, wy: integer;

//отступ по x, y
rox, roy: integer;

//число повторений усреднения
cp: integer;

//размер клетки
kl: integer;

//колво холмов
kh: integer;

//колво материковых точек
cm: integer;

//размер одного материка
rr: integer;

//размер острова
razm: integer;

//высота моря max
zsea: integer;

//для красивой отрисовки с наблюдением изменений
signal1: integer;

//УСТАНОВКА ЦВЕТОВ
//1 - ПО ВЫСОТАМ
procedure vis;
begin
      if (wrl[x, y]<=1) then
      begin
      setcolor(rgb(0, 0, 75));
      setfillstyle(1, rgb(0, 0, 75));
      end;
      
      if (wrl[x, y]>1) and (wrl[x, y]<20) then
      begin
      setcolor(rgb(0, 0, 150));
      setfillstyle(1, rgb(0, 0, 150));
      end;
      
      if (wrl[x, y]>=20) and (wrl[x, y]<zsea) then
      begin
      setcolor(rgb(0, 0, 250));
      setfillstyle(1, rgb(0, 0, 200));
      end;
      
      if (wrl[x, y]>=zsea) and (wrl[x, y]<65) then
      begin
      setcolor(rgb(106, 192, 0));
      setfillstyle(1, rgb(106, 192, 0));
      end;
      
      if (wrl[x, y]>=65) and (wrl[x, y]<80) then
      begin
      setcolor(rgb(220, 210, 0));
      setfillstyle(1, rgb(220, 210, 0));
      end;
      
      if (wrl[x, y]>=80) and (wrl[x, y]<=100) then
      begin
      setcolor(rgb(170, 130, 0));
      setfillstyle(1, rgb(170, 130, 0));
      end;
end;

//2 - ДВА ЦВЕТА (СУША/МОРЕ)
procedure twoc;
begin
  if (wrl[x, y]>=0) and (wrl[x, y]<=zsea) then
      begin
      setcolor(rgb(0, 0, 150));
      setfillstyle(1, rgb(0, 0, 150));
      end;
      
      if (wrl[x, y]>zsea) and (wrl[x, y]<=100) then
      begin
      setcolor(rgb(0, 200, 0));
      setfillstyle(1, rgb(0, 200, 0));
      end;
end;

procedure draw;
begin
clearbuffer;
setbufferenable(false);
if signal1=0 then
begin
  setcolor(rgb(0, 0, 75));
  setfillstyle(1, rgb(0, 0, 75));
  bar(0, 0, wx*kl+kl, wy*kl+kl);
  signal1:=1;
end;
  for y:=1 to wy do
    for x:=1 to wx do
    if wrl[x, y]>1 then
    begin
    vis;
    //twoc;
      
      bar(x*kl, y*kl, x*kl+kl, y*kl+kl);
    end;
//drawbuffer;
setbufferenable(true);
end;

//УСРЕДНЕНИЕ ЗНАЧЕНИЙ МОРЯ
procedure usrsea;
begin
  for k:=1 to cp do
  begin
    for y:=1 to wy do
    for x:=1 to wx do
    if x<wx then
    //условие для увеличения скорости
    if wrl[x+1, y]>1 then
    if wrl[x, y]<=zsea then
      wrl[x, y]:= int((wrl[x-1, y] + wrl[x+1, y])/2);
    
    for x:=1 to wx do
    for y:=1 to wy do
    if y<wy then
    //условие для увеличения скорости
    if wrl[x, y+1]>1 then
    if wrl[x, y]<=zsea then
      wrl[x, y]:= int((wrl[x, y-1] + wrl[x, y+1])/2);
  end;
end;

//УСРЕДНЕНИЕ ЗНАЧЕНИЙ ДО ГОР
procedure usr1;
begin
  for k:=1 to cp do
  begin
    for y:=1 to wy do
    for x:=1 to wx do
    if x<wx then
    if wrl[x, y]>zsea then
      if wrl[x, y]<78 then
      wrl[x, y]:= int((wrl[x-1, y] + wrl[x+1, y])/2);
    
    for x:=1 to wx do
    for y:=1 to wy do
    if y<wy then
    if wrl[x, y]>zsea then
      if wrl[x, y]<78 then
      wrl[x, y]:= int((wrl[x, y-1] + wrl[x, y+1])/2);
  end;
end;

//УМЕНЬШЕНИЕ ЗНАЧЕНИЙ ГОР
procedure usr_mounts;
begin
  for k:=1 to cp do
  begin
    for y:=1 to wy do
    for x:=1 to wx do
    if x<wx then
    if (wrl[x+1, y]>80) or (wrl[x-1, y]>80) then
      wrl[x, y]:= int((wrl[x-1, y] + wrl[x+1, y])/2);
    
    for x:=1 to wx do
    for y:=1 to wy do
    if y<wy then
    if (wrl[x, y+1]>80) or (wrl[x, y-1]>80) then
      wrl[x, y]:= int((wrl[x, y-1] + wrl[x, y+1])/2);
  end;
end;

procedure gener;
begin
for c1:=1 to cm do
begin
rox:=random(wx-rr+1)+int(rr/2);
roy:=random(wy-rr+1)+int(rr/2);
for c:=1 to kh do
begin
  rx:=random(rr-2*razm)-int(rr/2)+razm+rox;
  ry:=random(rr-2*razm)-int(rr/2)+razm+roy;
    dia1:=random(dia2+1-60)+60;
    wrl[rx, ry]:=dia1;
    
    for y:=ry-int(razm) to ry+int(razm) do
      for x:=rx-int(razm) to rx+int(razm) do
      if (x>=0) and (x<=wx) and (y>=0) and (y<=wy) then
      if (x<>rx) or (y<>ry) then
      if wrl[x, y] = 0 then
      wrl[x, y]:=random(dia2-dia1+1)+dia1 - int((abs(x-rx) + abs(y-ry))/2)*int(dia1/int(razm)*2)
      else wrl[x, y]:=int((wrl[x, y]+random(dia2-dia1+1)+dia1 - int((abs(x-rx) + abs(y-ry))/4)*int(dia1/razm/1))/2);
  
end;
end;
end;

procedure draw_signal;
begin
settextjustify(lefttext, bottomtext);
settextstyle(5, 0, 4);
setcolor(white);
  clearbuffer;
  outtextXY(10, 10, tx);
  drawbuffer;
end;

begin
initgraph(0, 0, '');
setbufferenable(true);

dia1:=0;
dia2:=100;

cp:=1;

wx:=300;
wy:=300;
kl:=3;
  
  while true do
  begin
    rr:=80;
    cm:=25;
    kh:=10;//random(15)+1;
    razm:=15;//random(10)+5;
    
    zsea:=45;
    
    setlength(wrl, 0, 0);
    setlength(wrl, wx+1, wy+1);
    tx:='Генерируем...';
    draw_signal;
    
    getTime(h, n, s, z);
    
    gener;
    getTime(h1, n1, s1, z1);
    tx:='Обрабатываем...';
    draw_signal;
    usr1;
    
    usr_mounts;
    
    usrsea;
    getTime(h3, n3, s3, z3);
    tx:='Рисуем...';
    draw_signal;
    draw;
    signal1:=0;
    getTime(h2, n2, s2, z2);
    repeat
    signal1:=0;
    readln();
    clrscr;
    writeln('Генерация "наброска": ', (h1*360000-h*360000+n1*6000-n*6000+s1*100-s*100 + z1 - z) div 100 + (h1*360000-h*360000+n1*6000-n*6000+s1*100-s*100 + z1 - z) mod 100 /100 : 5 : 2, ' сек.');
    writeln('Постобработка: ', (h3*360000-h1*360000+n3*6000-n1*6000+s3*100-s1*100 + z3 - z1) div 100 + (h3*360000-h1*360000+n3*6000-n1*6000+s3*100-s1*100 + z3 - z1) mod 100 /100 : 5 : 2, ' сек.');
    writeln('Отрисовка: ', (h2*360000-h3*360000+n2*6000-n3*6000+s2*100-s3*100 + z2 - z3) div 100 + (h2*360000-h3*360000+n2*6000-n3*6000+s2*100-s3*100 + z2 - z3) mod 100 /100 : 5 : 2, ' сек.');
    writeln('Общее время: ', (h2*360000-h*360000+n2*6000-n*6000+s2*100-s*100 + z2 - z) div 100 + (h2*360000-h*360000+n2*6000-n*6000+s2*100-s*100 + z2 - z) mod 100 /100 : 5 : 2, ' сек.');
    closegraph;
    readln(key);
    if key='g' then key:=key
    else 
    begin
      initgraph(0, 0, '');
      draw;
    end;
    until key='g';
    initgraph(0, 0, '');
    signal1:=0;
  end;
  readln;
end.

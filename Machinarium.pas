//////////////////////////
//Written by LeeryLis//
//////////////////////////

//Данная программа - набор процедур для отображения различных иероглифов

//Начало работы - 04.09.19
program machinarium;
uses crt, graph;

var
a, b, c, x, y: integer;
//отступ по x, y
ox: integer = 5;
oy: integer = 5;

//высота для каждого иероглифа
hie: integer = 55;

//размеры каждого иероглифа
sizeiex: array of integer;

//номер иероглифа
nie: integer;

procedure ie0;
begin
  ox:=ox+hie+2*(hie div 10);
  if ox>=(getmaxX-hie) then
  begin
    ox:=5;
    oy:=oy+hie+2*(hie div 10);
  end;
end;

procedure ie1;
begin
nie:=1;
  bar(ox, oy, ox+sizeiex[nie], oy+(hie div 10));
  bar(ox, oy+int(hie/2.5), ox+sizeiex[nie], oy+(hie div 10)+int(hie/2.5));
  bar(ox, oy, ox+(sizeiex[nie] div 10), oy+hie);
  bar(ox+sizeiex[nie], oy, ox+sizeiex[nie]-(sizeiex[nie] div 10), oy+hie);
  
  ox:=ox+sizeiex[nie]+2*(sizeiex[nie] div 10);
  if ox>=(getmaxX-hie) then
  begin
    ox:=5;
    oy:=oy+hie+2*(sizeiex[nie] div 10);
  end;
end;

procedure ie2;
begin
nie:=2;
  bar(ox, oy+ hie-(hie div 10), ox+sizeiex[nie], oy+hie);
  bar(ox, oy, ox+(sizeiex[nie] div 10), oy+hie);
  bar(ox+3*(sizeiex[nie] div 10), oy, ox+4*(sizeiex[nie] div 10), oy+hie);
  
  ox:=ox+sizeiex[nie]+2*(sizeiex[nie] div 10);
  if ox>=(getmaxX-hie) then
  begin
    ox:=5;
    oy:=oy+hie+2*(sizeiex[nie] div 10);
  end;
end;

procedure ie3;
begin
nie:=3;
  bar(ox, oy+ hie-(hie div 10), ox+sizeiex[nie], oy+hie);
  bar(ox, oy, ox+(sizeiex[nie] div 10), oy+hie);
  sector(ox+sizeiex[nie]-2*(hie div 8), oy+2*(hie div 8), 0, 360, hie div 8, hie div 8);
  
  ox:=ox+sizeiex[nie]+2*(sizeiex[nie] div 10);
  if ox>=(getmaxX-hie) then
  begin
    ox:=5;
    oy:=oy+hie+2*(sizeiex[nie] div 10);
  end;
end;

procedure setie;
begin
setlength(sizeiex, 10);
  sizeiex[1]:=hie;
  sizeiex[2]:=hie;
  sizeiex[3]:=hie;
  
end;

procedure start;
begin
  initgraph(0, 0, '');
  setbufferenable(true);
end;

begin
  setcolor(white);
  setfillstyle(1, white);
  
  start;
  setie;
  
  clearbuffer;
  
  for c:=1 to 300 do
  begin
    a:=random(3)+1;
    
    case a of
    //0: ie0;
    1: ie1;
    2: ie2;
    3: ie3;
    end;
  end;
  
  drawbuffer;
  readln;
end.

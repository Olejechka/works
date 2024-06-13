type
  Ocher = record
    items: array[1..10] of Integer;
    pered, zad: Integer;
  end;


procedure initOcher(var o: Ocher);
begin
  o.pered := 0;
  o.zad := 0;
end;



procedure vvod(var o: Ocher; val: Integer);
begin
  if (o.zad + 1) mod 10 = o.pered then
  begin
    writeln('Очередь заполнена.');
    Exit;
  end;
  if (o.pered = 0) and (o.zad = 0) then
    o.pered := 1;
  o.zad := (o.zad mod 10) + 1;
  o.items[o.zad] := val;
end;



procedure delete(var o: Ocher);
begin
  if (o.pered = 0) and (o.zad = 0) then
  begin
    writeln('В очереди нет элементов.');
    Exit;
  end;
  if o.pered = o.zad then
    initOcher(o)
  else
    o.pered := (o.pered mod 10) + 1;
end;



procedure print(var o: Ocher);
var
  i: Integer;
begin
  if (o.pered = 0) and (o.zad = 0) then
  begin
    writeln('В очереди нет элементов.');
    Exit;
  end;
  writeln('В очереди:');
  i := o.pered;
  repeat
    write(o.items[i], ' ');
    i := (i mod 10) + 1;
  until i <> (o.zad mod 10) + 1;
  writeln(o.items[o.zad]);
end;









var
  o: Ocher;
  ch, val: Integer;

begin
  initOcher(o);

  repeat
    writeln('1 - Добавить элемент');
    writeln('2 - Вывести первого');
    writeln('3 - Просмотр очередь');
    writeln('4 - Выйти ;(');
    write('Выберите цифру действия: ');
    readln(ch);

    case ch of
      1:
      begin
        write('Введите элемент для добавления: ');
        readln(val);
        vvod(o, val);
      end;
      2: delete(o);
      3: print(o);
      4: writeln('Программа завершена.');
    else
      writeln('Ошибочка.');
    end;

  until ch = 4;
end.
program pos;

type PNode = ^Node;   { указатель на узел }   
     Node = record    { структура узла }
       word: string[40]; { слово }
       count: integer;   { счетчик повторов слов }
       next: PNode;      { ссылка на следующий }
     end;
     
function CreateNode(NewWord: string): PNode; {создание списка}
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;
procedur
e AddFirst ( var Head: PNode; NewNode: PNode ); { Добавление узла в начало списка}
begin
  NewNode^.next := Head;
  Head := NewNode;
end;

procedure AddBefore(var Head: PNode; p, NewNode: PNode); { Добавление узла перед заданным}
var pp: PNode;
begin
  pp := Head;
  if p = Head then
    AddFirst ( Head, NewNode )  // добавление в начало списка
  else begin
    while (pp <> nil)  and  (pp^.next <> p) do // поиск узла, за которым следует узел p
      pp := pp^.next;
    if pp <> nil then AddAfter ( pp, NewNode ); // добавляем после узла pp
  end;
end;

function TakeWord ( F: Text ) : string;
var c: char;
begin
  Result := ''; { пустая строка }
  c := ' ';     { пробел – чтобы войти в цикл }  
    { пропускаем спецсимволы и пробелы }
  while not eof(f) and (c <= ' ') do 
    read(F, c);  
    { читаем слово }  
  while not eof(f) and (c > ' ') do begin
    Result := Result + c;
    read(F, c);
  end;
end;

function cnt:string;{подсчет количества повторений}
var NewNode:PNode;c:char;
begin
   read(Text,NewNode^.word);
   if (c = ' ') or eof(Text) then
    cnt:=''
   else cnt:=ch+cnt;
end;
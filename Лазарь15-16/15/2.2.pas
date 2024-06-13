program lst;


type plist = ^list;
     list = record
       intel: Integer;
       next: plist;
     end;

var
  mlist:plist;
  i:=integer;

procedure Add(var head: plist; ct:integer);
var 
  newNode: plist;
begin
  New(newNode);
  newNode^.intel:=ct;
  newNode^.next:=head;
  head:=newNode;
end;

procedure Print(head: plist);
begin
  while head <> nil  do begin
    write(head^.intel,' ');
    head:=head^.next;
  end;
  writeln;
end;

begin
  mlist:= nil;
  
  for i:= 1 to 10 do
    Add(mlist,i);
  Print(mlist);
end.
uses GraphABC,ml2;
var
  (m, wx, wy, g):= (100.0, 300.0, 300.0, 1.0);

procedure KeyDown(k: integer);
begin
  case k of
    VK_Down: wy -= 10.0;
    VK_Up: wy += 10.0;
    VK_Left: wx += 10.0;
    VK_Right: wx -= 10.0;
    VK_Escape: halt(1); //выход
    VK_A: if m < 500.0 then m += 10.0;
    VK_Z: if m > 20.0 then m -= 10.0;
    VK_S: if g < 8.0 then g += 1.0;
    VK_X: if g > 0.0 then g -= 1.0;
  end;
  Window.Clear;
  LockDrawing;
  ris(wx - m, wy, wx + m, wy, g);
  Redraw;
end;
begin
  m := 100.0;
  wx := 300.0;
  wy := 300.0;
  g := 1.0;
  SetWindowCaption('Фракталы: Снежинка Коха');
  SetWindowSize(700, 512);
  OnKeyDown := KeyDown;
  LockDrawing;
  ris(wx - m, wy, wx + m, wy, g);
  Redraw;
end.
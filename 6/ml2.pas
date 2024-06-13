unit ml2;
interface
procedure ris(x1, y1, x2, y2, k: real);
implementation
uses
  GraphABC;
procedure ris(x1, y1, x2, y2, k: real);
begin
  if k > 0 then
  begin
    var xn := (2 * x1 + x2) / 3;
    var yn := (2 * y1 + y2) / 3;
    var xm := (x1 + 2 * x2) / 3;
    var ym := (y1 + 2 * y2) / 3;
    var xp := (x1 + x2) / 2 + (y2 - y1) / 3;
    var yp := (y1 + y2) / 2 - (x2 - x1) / 3;

    ris(x1, y1, xn, yn, k - 1);
    ris(xn, yn, xp, yp, k - 1);
    ris(xp, yp, xm, ym, k - 1);
    ris(xm, ym, x2, y2, k - 1);
  end
  else
    Line(Round(x1), Round(y1), Round(x2), Round(y2));
end;
end.

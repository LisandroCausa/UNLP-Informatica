program seisB;
type
    ptr = ^real; // 4 Bytes estáticos, 4 bytes dinámicos
    kb = array[1..256] of ptr;
    kb25_25 = array[1..25] of kb;

procedure mallocArray(var arr:kb25_25);
var
    i, j : integer;
begin
    for i:=1 to 25 do
    begin
        for j:=1 to 256 do
        begin
            new(arr[i][j]);
        end;
    end;
end;

var
    mem : kb25_25;
begin
    mallocArray(mem);
    readln;
end.
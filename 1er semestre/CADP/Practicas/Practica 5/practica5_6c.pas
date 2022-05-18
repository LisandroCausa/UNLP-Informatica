program seisC;
type
    kb = array[1..1024] of char;
    kb50 = array[1..50] of kb;
    kb50_ptr = ^kb50;
var
    mem : kb50_ptr;
begin
    new(mem);
    readln;
end.
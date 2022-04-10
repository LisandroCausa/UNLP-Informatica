program tres;
var
	num1 : integer;
	num2 : integer;
	num3 : integer;
begin
	readln(num1);
	readln(num2);
	readln(num3);
	writeln('---------------');
	if(num1 > num2) then
	begin
		if(num1 > num3) then
		begin
			write(num1, ' ');
			if(num2 > num3) then
			begin
				write(num2, ' ');
				write(num3);
			end
			else
			begin
				write(num3, ' ');
				write(num2);
			end;
		end
		else
		begin
			write(num3, ' ');
			write(num1, ' ');
			write(num2);
		end;
	end
	else	// num2 > num1
	begin
		if(num2 > num3) then
		begin
			write(num2, ' ');
			if(num1 > num3) then
			begin
				write(num1, ' ');
				write(num3);
			end
			else
			begin
				write(num3, ' ');
				write(num1);
			end;
		end
		else
		begin
			write(num3, ' ');
			write(num2, ' ');
			write(num1);
		end;
	end;
	writeln;
	writeln('---------------');
end.
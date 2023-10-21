{**********************************************************************}
{                                                                      }
{     质数检查程序                                                     }
{                                                                      }
{     判断输入是否是质数，如果不是的话输出下一个质数。                 }
{                                                                      }
{**********************************************************************}

program PrimeNumber;

{$APPTYPE CONSOLE}

uses
  SysUtils;

// 判断一个数是否为质数
function IsPrime(n: integer): boolean;
var
  i: integer;
begin
  if n <= 1 then
    Result := False
  else if n <= 3 then
    Result := True
  else if (n mod 2 = 0) or (n mod 3 = 0) then
    Result := False
  else
  begin
    i := 5;
    while (i * i <= n) do
    begin
      if (n mod i = 0) or (n mod (i + 2) = 0) then
      begin
        Result := False;
        exit;
      end;
      i := i + 6;
    end;
    Result := True;
  end;
end;

// 主函数
procedure Main;
var
  num: integer; // 待检查的数字
begin
  Write('请输入一个数字: ');
  Readln(num);

  // 如果输入的数字是质数，则输出结果
  if IsPrime(num) then
    Writeln(num, ' 是一个质数')
  else
  begin
    // 如果输入的数字不是质数，则查找下一个质数并输出结果
    while not IsPrime(num) do
      Inc(num);
    Writeln(num, ' 不是质数，下一个质数是 ', num);
  end;
end;

begin
  try
    Main; // 调用主函数
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln; // 在关闭控制台窗口之前等待用户输入
end.

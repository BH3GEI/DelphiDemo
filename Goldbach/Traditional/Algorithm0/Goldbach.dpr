{**********************************************************************}
{                                                                      }
{     哥德巴赫猜想验证程序                                             }
{     将输入数值分解成质数的和。                                       }
{     验证从2开始的哥德巴赫猜想。                                      }
{                                                                      }
{**********************************************************************}

program Goldbach;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Diagnostics;

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

// 获取一个偶数的两个质数和
function GetPrimeSumForEvenNumber(n: integer; var prime1, prime2: integer): boolean;
var
  i: integer;
begin
  // 遍历所有小于等于 n/2 的数字，检查是否存在满足条件的质数
  for i := 2 to (n div 2) do
  begin
    if IsPrime(i) and IsPrime(n - i) then
    begin
      prime1 := i;
      prime2 := n - i;
      Result := True; // 返回 true，表示找到了两个质数的和
      exit;
    end;
  end;
  Result := False; // 返回 false，表示没有找到两个质数的和
end;


// 主函数
procedure Main;
var
  input, prime1, prime2: integer;
begin
  Write('请输入一个大于2的偶数: ');
  Readln(input);

  // 输入的数字必须是大于2的偶数
  if (input <= 2) or (input mod 2 <> 0) then
  begin
    Writeln('请输入一个大于2的偶数');
    exit;
  end;

  // 获取两个质数的和
  GetPrimeSumForEvenNumber(input, prime1, prime2);

  Writeln(input, ' = ', prime1, ' + ', prime2);
end;

// 验证从2开始的哥德巴赫猜想
procedure VerifyGoldbachConjecture;
var
  i, prime1, prime2: integer;
  StopWatch: TStopwatch;
begin
  StopWatch := TStopwatch.StartNew; // 记录开始时间

  // 从2开始遍历所有小于指定值的数字
  for i := 2 to 100000000 do
  begin
    if (i mod 2 = 0) and GetPrimeSumForEvenNumber(i, prime1, prime2) then
      //Writeln(i, ' = ', prime1, ' + ', prime2);
  end;

  StopWatch.Stop;

  writeln('验证完成，花费时间为:', StopWatch.ElapsedMilliseconds, ' 毫秒');

end;
begin
  try
    Main; // 调用主函数
    VerifyGoldbachConjecture; // 验证哥德巴赫猜想
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln; // 在关闭控制台窗口之前等待用户输入
end.

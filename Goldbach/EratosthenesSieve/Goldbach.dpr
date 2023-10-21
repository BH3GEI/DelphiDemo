{**********************************************************************}
{                                                                      }
{     哥德巴赫猜想验证程序                                             }
{     将输入数值分解成质数的和。                                       }
{     验证从2开始的哥德巴赫猜想。                                      }
{     与其他两段程序不同的是使用了埃拉托色尼筛法                       }
{                                                                      }
{**********************************************************************}
program Goldbach;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Diagnostics;

var
  IsPrime: array of Boolean;

// 使用埃拉托色尼筛法生成一个布尔值数组
procedure EratosthenesSieve(n: integer);
var
  p, i: integer;
begin
  SetLength(IsPrime, n+1);
  FillChar(IsPrime[0], Length(IsPrime), True);
  IsPrime[0] := False;
  IsPrime[1] := False;

  p := 2;
  while (p * p <= n) do
  begin
    if (IsPrime[p] = True) then
    begin
      i := p * p;
      while (i <= n) do
      begin
        IsPrime[i] := False;
        i := i + p;
      end;
    end;
    Inc(p);
  end;
end;

// 获取一个偶数的两个质数和
function GetPrimeSumForEvenNumber(n: integer; var prime1, prime2: integer): boolean;
var
  i: integer;
begin
  for i := 2 to (n div 2) do
  begin
    if IsPrime[i] and IsPrime[n - i] then
    begin
      prime1 := i;
      prime2 := n - i;
      Result := True;
      exit;
    end;
  end;
  Result := False;
end;

// 主函数
procedure Main;
var
  input, prime1, prime2: integer;
begin
  Write('请输入一个大于2的偶数: ');
  Readln(input);

  if (input <= 2) or (input mod 2 <> 0) then
  begin
    Writeln('请输入一个大于2的偶数');
    exit;
  end;

  EratosthenesSieve(input); // 使用埃拉托色尼筛法生成质数列表
  GetPrimeSumForEvenNumber(input, prime1, prime2);

  Writeln(input, ' = ', prime1, ' + ', prime2);
end;

// 验证哥德巴赫猜想
procedure VerifyGoldbachConjecture;
var
  i, prime1, prime2: integer;
  StopWatch: TStopwatch;
begin
  StopWatch := TStopwatch.StartNew;

  EratosthenesSieve(1000000000); // 使用埃拉托色尼筛法生成质数列表
  for i := 2 to 1000000000 do
  begin
    if (i mod 2 = 0) and GetPrimeSumForEvenNumber(i, prime1, prime2) then
      //Writeln(i, ' = ', prime1, ' + ', prime2);
  end;

  StopWatch.Stop;
  writeln('验证完成，花费时间为:', StopWatch.ElapsedMilliseconds, ' 毫秒');

end;

begin
  try
    Main;
    VerifyGoldbachConjecture;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.

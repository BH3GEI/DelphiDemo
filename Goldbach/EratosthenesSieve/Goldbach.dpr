{**********************************************************************}
{                                                                      }
{     ��°ͺղ�����֤����                                             }
{     ��������ֵ�ֽ�������ĺ͡�                                       }
{     ��֤��2��ʼ�ĸ�°ͺղ��롣                                      }
{     ���������γ���ͬ����ʹ���˰�����ɫ��ɸ��                       }
{                                                                      }
{**********************************************************************}
program Goldbach;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Diagnostics;

var
  IsPrime: array of Boolean;

// ʹ�ð�����ɫ��ɸ������һ������ֵ����
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

// ��ȡһ��ż��������������
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

// ������
procedure Main;
var
  input, prime1, prime2: integer;
begin
  Write('������һ������2��ż��: ');
  Readln(input);

  if (input <= 2) or (input mod 2 <> 0) then
  begin
    Writeln('������һ������2��ż��');
    exit;
  end;

  EratosthenesSieve(input); // ʹ�ð�����ɫ��ɸ�����������б�
  GetPrimeSumForEvenNumber(input, prime1, prime2);

  Writeln(input, ' = ', prime1, ' + ', prime2);
end;

// ��֤��°ͺղ���
procedure VerifyGoldbachConjecture;
var
  i, prime1, prime2: integer;
  StopWatch: TStopwatch;
begin
  StopWatch := TStopwatch.StartNew;

  EratosthenesSieve(1000000000); // ʹ�ð�����ɫ��ɸ�����������б�
  for i := 2 to 1000000000 do
  begin
    if (i mod 2 = 0) and GetPrimeSumForEvenNumber(i, prime1, prime2) then
      //Writeln(i, ' = ', prime1, ' + ', prime2);
  end;

  StopWatch.Stop;
  writeln('��֤��ɣ�����ʱ��Ϊ:', StopWatch.ElapsedMilliseconds, ' ����');

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

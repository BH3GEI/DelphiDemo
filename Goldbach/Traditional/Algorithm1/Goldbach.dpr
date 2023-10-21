{**********************************************************************}
{                                                                      }
{     ��°ͺղ�����֤����                                             }
{     ��������ֵ�ֽ�������ĺ͡�                                       }
{     ��֤��2��ʼ�ĸ�°ͺղ��롣                                      }
{                                                                      }
{**********************************************************************}

program Goldbach;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Diagnostics;

// �ж�һ�����Ƿ�Ϊ����
function IsPrime(n: integer): boolean;
var
  i: integer;
begin
  if n <= 1 then
    Result := false
  else
  begin
    Result := true;
    for i := 2 to trunc(sqrt(n)) do
      if n mod i = 0 then
      begin
        Result := false;
        break;
      end;
  end;
end;

// ��ȡһ��ż��������������
function GetPrimeSumForEvenNumber(n: integer; var prime1, prime2: integer): boolean;
var
  i: integer;
begin
  // ��������С�ڵ��� n/2 �����֣�����Ƿ������������������
  for i := 2 to (n div 2) do
  begin
    if IsPrime(i) and IsPrime(n - i) then
    begin
      prime1 := i;
      prime2 := n - i;
      Result := True; // ���� true����ʾ�ҵ������������ĺ�
      exit;
    end;
  end;
  Result := False; // ���� false����ʾû���ҵ����������ĺ�
end;


// ������
procedure Main;
var
  input, prime1, prime2: integer;
begin
  //Writeln(IsPrime(5));
  Write('������һ������2��ż��: ');
  Readln(input);

  // ��������ֱ����Ǵ���2��ż��
  if (input <= 2) or (input mod 2 <> 0) then
  begin
    Writeln('������һ������2��ż��');
    exit;
  end;

  // ��ȡ���������ĺ�
  GetPrimeSumForEvenNumber(input, prime1, prime2);

  Writeln(input, ' = ', prime1, ' + ', prime2);
end;

// ��֤��2��ʼ�ĸ�°ͺղ���
procedure VerifyGoldbachConjecture;
var
  i, prime1, prime2: integer;
  StopWatch: TStopwatch;
begin
  StopWatch := TStopwatch.StartNew; // ��¼��ʼʱ��
  // ��2��ʼ��������С��ָ��ֵ������
  for i := 2 to 100000000 do

  begin
    if (i mod 2 = 0) and GetPrimeSumForEvenNumber(i, prime1, prime2) then
      //Writeln(i, ' = ', prime1, ' + ', prime2);
  end;

  StopWatch.Stop;

  writeln('��֤��ɣ�����ʱ��Ϊ:', StopWatch.ElapsedMilliseconds, ' ����');

end;
begin
  try
    Main; // ����������
    VerifyGoldbachConjecture; // ��֤��°ͺղ���
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln; // �ڹرտ���̨����֮ǰ�ȴ��û�����
end.

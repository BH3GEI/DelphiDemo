{**********************************************************************}
{                                                                      }
{     ����������                                                     }
{                                                                      }
{     �ж������Ƿ���������������ǵĻ������һ��������                 }
{                                                                      }
{**********************************************************************}

program PrimeNumber;

{$APPTYPE CONSOLE}

uses
  SysUtils;

// �ж�һ�����Ƿ�Ϊ����
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

// ������
procedure Main;
var
  num: integer; // ����������
begin
  Write('������һ������: ');
  Readln(num);

  // ����������������������������
  if IsPrime(num) then
    Writeln(num, ' ��һ������')
  else
  begin
    // �����������ֲ����������������һ��������������
    while not IsPrime(num) do
      Inc(num);
    Writeln(num, ' ������������һ�������� ', num);
  end;
end;

begin
  try
    Main; // ����������
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln; // �ڹرտ���̨����֮ǰ�ȴ��û�����
end.

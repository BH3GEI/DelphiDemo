{**********************************************************************}
{                                                                      }
{     �˷������                                                       }
{                                                                      }
{     ���ɴ�1��9�ĳ˷���                                             }
{                                                                      }
{**********************************************************************}

program MultTable;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  Multiplicand, Multiplier: Integer; // ���������ı������ͳ���

begin
  // ѭ������ÿ������������1��9
  for Multiplicand := 1 to 9 do
  begin
    // ѭ������ÿ����������1����ǰ������
    for Multiplier := 1 to Multiplicand do
    begin
      // ��ӡ�˷����ÿ����Ŀ
      Write(multiplier, ' x ', multiplicand, ' = ', Multiplicand * Multiplier, #9);
    end;
    // ��ÿ�н����󻻵���һ��
    Writeln('');
  end;

  // �ڹرտ���̨����֮ǰ�ȴ��û�����
  Readln;
end.

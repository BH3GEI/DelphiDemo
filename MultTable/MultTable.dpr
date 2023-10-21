{**********************************************************************}
{                                                                      }
{     乘法表程序                                                       }
{                                                                      }
{     生成从1到9的乘法表。                                             }
{                                                                      }
{**********************************************************************}

program MultTable;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  Multiplicand, Multiplier: Integer; // 定义整数的被乘数和乘数

begin
  // 循环遍历每个被乘数，从1到9
  for Multiplicand := 1 to 9 do
  begin
    // 循环遍历每个乘数，从1到当前被乘数
    for Multiplier := 1 to Multiplicand do
    begin
      // 打印乘法表的每个条目
      Write(multiplier, ' x ', multiplicand, ' = ', Multiplicand * Multiplier, #9);
    end;
    // 在每行结束后换到下一行
    Writeln('');
  end;

  // 在关闭控制台窗口之前等待用户输入
  Readln;
end.

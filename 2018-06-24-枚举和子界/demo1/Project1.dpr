program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{
  ����
    ������һ��ʼ�Ͷ���õ�һЩֵ���Ժ��ڳ�������й����в�����ı䣬���磺Բ����

  ö�٣�������
    type
      ö����=(��ʶ��1,��ʶ��2...)

}
uses
    System.TypInfo,
    System.SysUtils;

const
    YuanZhouLv: Double = 3.15;
    {�����Ķ��巽ʽ�����Բ�������������,����������ݾ���ֵ����������������}
    YuanZhouLv2 = 3;

type
    {���������ö�����͵������Ǵ�0��ʼ}
    EColors = (RED, GREEN, BLUE);

type
    EWeek = (SUN = 1, MON = 2, TUE = 3, WED = 4, THU = 5, FRI = 6, SAT = 7);

var
    {����һ��ö�����͵ı���}
    Color: EColors;
    Week: EWeek;
    Eindex: Integer;
    Ename: string;
    Evalue: Integer;

{*------------------------------------------------------------------------------
  ��ȡö���еĵ���Ԫ��

-------------------------------------------------------------------------------}
procedure Demo1();
begin
    Color := EColors.RED;
    Week := EWeek.MON;
    Writeln(Ord(Color), ',', Ord(Week));

end;

{*------------------------------------------------------------------------------

 ʹ��ѭ������(������ȡ)ö��Ԫ��
-------------------------------------------------------------------------------}
procedure Demo2();
begin
    Eindex := 0;
    {����ö��}
    for Color := Low(EColors) to High(EColors) do begin

        Ename := GetEnumName(TypeInfo(EColors), Eindex);

        Evalue := GetEnumValue(TypeInfo(EColors), Ename);

        Writeln(Ename, ',', Evalue);

//        Eindex := Eindex + 1;
        //��˵Delphi�����Ż�
        Inc(Eindex);
    end;
end;

begin
    Writeln(ord(EWeek.SUN));
    Readln;

end.


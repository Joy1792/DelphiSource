program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{*------------------------------------------------------------------------------


ʲô�Ƕ�̬
        ��װ���̳С���̬

        һ�������Զ�����̬���ڣ����磺������͹��ࡢè��Ĺ�ϵ

        ǰ�᣺������߱��̳�(����)��ʵ�������ֹ�ϵ��һ��

        �������֣�������ջ�ָ�����������

��ʲô��
      ��ߴ���ĸ�����,�������ǶԴ�����н���(�����֮�䲻Ҫ����ֱ�ӵ�������ϵ)



��ôʹ��

-------------------------------------------------------------------------------}
uses
    System.SysUtils,
    Unit1 in 'Unit1.pas';

//����ת�ͣ���������������ת�����˸������������
procedure ShowAimalRun(Aimal: TAimal);
var
    Dog: TDog;
begin
    //����ʱ����������
    Aimal.Run;
    //����ת�ͣ��Ѹ�����������ת�����������������
    if Assigned(Dog) then begin
        Writeln('�ǿ�ֵ');
    end;

    if Aimal.ClassName = 'TDog' then begin
        //ǿ������ת��
        Dog := TDog(Aimal);
        Dog.LookDoor;
    end;

    //�ж�һ�������Ƿ��һ�����ͼ���
    if Aimal is TDog then begin
        Dog := Aimal as TDog;

        Dog.LookDoor;
    end;

end;

begin

    ShowAimalRun(TCat.Create);
    Readln;
end.


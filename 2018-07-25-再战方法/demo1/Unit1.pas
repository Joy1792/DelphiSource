unit Unit1;

interface

type
    TAinmal = class
    public
        procedure Talk();

        {���ⷽ��}
        function Run(): Integer; virtual;
        {�෽��}
        class procedure Eat();

        {���췽��}
        constructor Create1();
        {���󷽷�:�淶��һ��ָ�涨}
        procedure Sleep(); virtual; abstract;
    end;

    TDog = class(TAinmal)
    public
        function Run(): Integer;
        procedure Sleep();
    end;

implementation

{ TPersion }

constructor TAinmal.Create1;
begin
    Writeln('���췽��ִ����');
end;

class procedure TAinmal.Eat;
begin
    Writeln('Eat');
end;

function TAinmal.Run: Integer;
begin
{һ������£���������ⷽ������һ����ʵ��}

end;

procedure TAinmal.Talk;
begin
    Writeln('Talk');
end;

{ TUser }

function TDog.Run: Integer;
begin
    Writeln('����������');
end;

procedure TDog.Sleep;
begin

end;

end.


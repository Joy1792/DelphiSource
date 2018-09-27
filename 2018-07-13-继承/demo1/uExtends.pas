unit uExtends;

interface

type
    {����һ����}
    TAnimal = class
    private
        FTiZhong: Integer;
    protected
        FName: string;
    public
        {����һ�����췽��}
        constructor Create(FTiZhong: Integer);

        {��������}
        property TiZhong: Integer read FTiZhong write FTiZhong;

        {����һ���鷽��}
        procedure GetName(); virtual;
    end;

    {����һ��������}
    TDog = class(TAnimal)
    public
        constructor Create();
        {��д�����Ǹ����е��鷽��}
        procedure GetName(); override;
    end;

implementation

{ TAnimal }

constructor TAnimal.Create(FTiZhong: Integer);
begin
    Self.FTiZhong := FTiZhong;
end;

procedure TAnimal.GetName;
begin
    Writeln('������ķ���');
end;

{ TDog }

constructor TDog.Create;
begin

    Writeln('����');
    //ֱ�ӵ��ø��� ����
    inherited Create(1001);
end;

procedure TDog.GetName;
begin
    inherited;
    Writeln('TDog.GetName�ķ���');

end;

end.


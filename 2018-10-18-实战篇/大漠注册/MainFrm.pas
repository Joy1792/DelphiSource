unit MainFrm;

interface

uses
  Dm_TLB, uUtils, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  dmhdl: THandle;
  dm: Idmsoft;
begin
  dmhdl := LoadLibrary('dm.dll');
  if dmhdl < 32 then begin
    ShowMessage('��ʼ��ʧ��'#13'��������Ŀ¼���Ƿ���dm.dll�ļ�');
    Exit;
  end

  else begin
    dm := CreateComObjectFromDll(CLASS_dmsoft, dmhdl) as Idmsoft;
    ShowMessage('��ʼ���ɹ� ����汾:' + dm.Ver);
    dm := nil;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OLERegister('./dm.dll', 1);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  OLERegister('./dm.dll', 0);
end;

end.


unit MainFrm;

interface

uses
  LoggerPro, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    //定义日志字段
    FLog: ILogWriter;
  public
    { Public declarations }
    //定义一个属性，属性是为了防止直接访问我们的字段
    property Log: ILogWriter read FLog write FLog;
  end;

var
  Form1: TForm1;

implementation

uses
  LoggerPro.VCLListViewAppender;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Log.Info('这是一条测试信息', '温馨提示');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLog := BuildLogWriter([TVCLListViewAppender.Create(ListView1)]);
end;

//当事件发生时会将键盘的键码值传到函数内
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of
    VK_UP:
      begin
        Log.Info('上', 'VK_UP');
      end;

    VK_DOWN:
      begin
        Log.Info('下', 'VK_DOWN');
      end;

    VK_LEFT:
      begin
        Log.Info('左', 'VK_LEFT');
      end;
    VK_RIGHT:
      begin
        Log.Info('右', 'VK_RIGHT');
      end;

    VK_SPACE:
      begin
        Log.Info('空格', 'VK_SPACE');
      end;
  end;
end;

end.


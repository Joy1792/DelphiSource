unit MainFrm;

interface

uses
  LoggerPro, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
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
  UnitService, LoggerPro.VCLListViewAppender;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

  Log.Info('这是一个提示信息', '温馨提示');

end;

//图片绘制测试

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLog := BuildLogWriter([TVCLListViewAppender.Create(ListView1)]);
   //绘制背景
  TGameSevice.Create(Image1.Canvas.Handle).DrawBackground('D:\DelphiSource\2020-01-07-Game\bin\resources\background\bg011.jpg',Image1.Width, Image1.Height);


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


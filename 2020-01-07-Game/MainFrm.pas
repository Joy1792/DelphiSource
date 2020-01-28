unit MainFrm;

interface

uses
  UnitService, LoggerPro, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    Button1: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    //������־�ֶ�
    FLog: ILogWriter;
    //������Ϸҵ����Ķ���
    GameService: TGameSevice;
  public
    { Public declarations }
    //����һ�����ԣ�������Ϊ�˷�ֱֹ�ӷ������ǵ��ֶ�
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

  // 1��TGameService���󴴽�������,ע�⣬ԭ��������Ҫ���ݾ����չʾͼƬ������
  //���þ��
  GameService.GameHandle := Image1.Canvas.Handle;

  //���Ʊ���ͼ
  GameService.DrawBackGround(Image1.Width, Image1.Height);

  // 2����α���num������ֵ  ��ͨ��TGameService���е�ImageIndex���Խ��б���
  //�ػ�
  Repaint;
  Log.Info(GameService.ImageIndex.ToString, '��ܰ��ʾ');
  //���ñ���ͼ������
  GameService.ImageIndex := GameService.ImageIndex + 1;
end;

//ͼƬ���Ʋ���
procedure TForm1.FormCreate(Sender: TObject);
begin
  FLog := BuildLogWriter([TVCLListViewAppender.Create(ListView1)]);
  //��ʼ����Ϸҵ����Ķ���
  GameService := TGameSevice.Create();
end;


//���¼�����ʱ�Ὣ���̵ļ���ֵ����������
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of
    VK_UP:
      begin
        Log.Info('��', 'VK_UP');
      end;

    VK_DOWN:
      begin
        Log.Info('��', 'VK_DOWN');
      end;

    VK_LEFT:
      begin
        Log.Info('��', 'VK_LEFT');
      end;
    VK_RIGHT:
      begin
        Log.Info('��', 'VK_RIGHT');
      end;

    VK_SPACE:
      begin
        Log.Info('�ո�', 'VK_SPACE');
      end;
  end;
end;

end.

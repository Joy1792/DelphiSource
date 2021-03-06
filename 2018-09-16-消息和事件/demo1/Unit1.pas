unit Unit1;

interface

uses
  System.SysUtils, Winapi.Windows, Vcl.Dialogs;

type
  {用户传输消息的结构}
  TMyMsg = record
    //消息号
    MsgNum: Cardinal;
    //传输的消息内容
    MsgText: ShortString;
  end;

  {消息处理类}
  TMsgAccepter = class(TObject)
  private
    {用于处理消息编号是2000的消息}
    procedure AcceptMsg2000(var msg: TMyMsg); message 2000;
  public
  //默认处理方法
    procedure DefaultHandler(var Message); override;
  end;

implementation

{ TMsgAccepter }

procedure TMsgAccepter.AcceptMsg2000(var msg: TMyMsg);
begin

  ShowMessage('接收到消息，编号是：' + msg.MsgNum.ToString + '，消息内容是：' + msg.MsgText);
end;

procedure TMsgAccepter.DefaultHandler(var Message);
var
  Msg: TMyMsg;
begin
  Msg := TMyMsg(Message);

  ShowMessage('对不起，该消息编号无法处理' + Msg.MsgNum.ToString);
end;

end.


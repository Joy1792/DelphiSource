program ProjectLog;

uses
  TConfiguratorUnit, {��Ҫ���øõ�Ԫ} Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  { ��ʼ������ȡ���� }
  doPropertiesConfiguration('log4delphi.properties');
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.

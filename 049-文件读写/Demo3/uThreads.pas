unit uThreads;

interface

uses
  System.Classes;

type
  TWorkThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses
  UnitMainFrm;

{ TWorkThread }
const
  SOURCE_FILE = 'D:\Test\1.avi';
  TARGET_FILE = 'D:\Test\2.avi';

procedure TWorkThread.Execute;
var
  SourceFile, TargetFile: file;
var
  Buf: array[0..255] of Byte;
begin
  try
    form1.Caption := 'a';
      //关联
    AssignFile(SourceFile, SOURCE_FILE);

    AssignFile(TargetFile, TARGET_FILE);
       //设置打开方式
    Reset(SourceFile);
    Rewrite(TargetFile);

    Synchronize(
      procedure
      begin
        Form1.ProgressBar1.Max := FileSize(SourceFile);
      end);

    //读写
    while not Eof(SourceFile) do begin
      BlockRead(SourceFile, Buf, 1);
      BlockWrite(TargetFile, Buf, 1);
      Synchronize(
        procedure
        begin
          Form1.CurPosition := FileSize(TargetFile);
        end);

    end;
  finally

    CloseFile(SourceFile);
    CloseFile(TargetFile);
  end;

end;

end.


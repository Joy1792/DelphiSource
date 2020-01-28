unit UnitService;

interface

uses
  System.IOUtils, Winapi.Windows, Winapi.GDIPOBJ, Winapi.GDIPAPI;

type
  TGameSevice = class
  private
   //��������
    FHdc: HDC;
    //��ʾͼƬ�ı��
    FImageIndex: Integer;
  public
    //����ͼƬ
    procedure DrawImage(FileName: string; Width, Hegiht: Integer);
    //���Ʊ���
    procedure DrawBackGround(Width, Hegiht: Integer);
    //���췽������������ͬ�������б���ͬ��Ϊ����
    constructor Create(hdc: HDC); overload;
    constructor Create(); overload;
    //�����ֶ�
    property GameHandle: HDC read FHdc write FHdc;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
  end;

implementation

{ TGameSevice }

constructor TGameSevice.Create(hdc: hdc);
begin
  GameHandle := hdc;
end;

constructor TGameSevice.Create;
begin
  inherited;
end;

procedure TGameSevice.DrawBackGround(Width, Hegiht: Integer);
var
  ImageList: TArray<string>;
begin
  //��ȡͼƬ�б�
  ImageList := TDirectory.GetFiles('E:\Delphi�γ����\resources\background');
  if ImageIndex >= Length(ImageList) then
    ImageIndex := 0;
  //ѡȡͼƬ�б��е�ĳһ��ͼƬ��չʾ�ڴ���
  DrawImage(ImageList[ImageIndex], Width, Hegiht);
end;

procedure TGameSevice.DrawImage(FileName: string; Width, Hegiht: Integer);
var
  //����
  Graphics: TGPGraphics;
  Image: TGPImage;
begin
  //�������ǵ�ͼƬ�ļ�
  Image := TGPImage.Create(FileName);
  //�������ͼƬ���Ƶ�ָ���������(TImage)
  Graphics := TGPGraphics.Create(GameHandle);
  //����ͼƬ
  Graphics.DrawImage(Image, MakeRect(0, 0, Width, Hegiht));
  Graphics.Free;
  Image.Free;
end;

end.

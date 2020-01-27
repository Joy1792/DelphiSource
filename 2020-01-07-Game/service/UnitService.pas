unit UnitService;

interface

uses
  Winapi.Windows, Winapi.GDIPOBJ, Winapi.GDIPAPI;

type
  TGameSevice = class
  private
   //��������
    FHdc: HDC;
  public
    procedure DrawBackground(FileName: string; Width, Hegiht: Integer);
    //���췽��
    constructor Create(hdc: HDC);
    //�����ֶ�
    property GameHandle: HDC read FHdc write FHdc;
  end;

implementation

{ TGameSevice }

constructor TGameSevice.Create(hdc: hdc);
begin
  GameHandle := hdc;
end;

procedure TGameSevice.DrawBackground(FileName: string; Width, Hegiht: Integer);
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


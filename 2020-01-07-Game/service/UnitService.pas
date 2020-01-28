unit UnitService;
{*------------------------------------------------------------------------------
  @author  ��Ҷ��
  @version 2020/01/28 1.0 Initial revision.
  @comment  ��Ϸ��ҵ�����
-------------------------------------------------------------------------------}

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

    //���ƴ���
    procedure DrawWindow(x, y, w, h: Integer);

    //���췽������������ͬ�������б�ͬ��Ϊ����
    constructor Create(hdc: HDC); overload;
    constructor Create(); overload;
    //�����ֶ�
    property GameHandle: HDC read FHdc write FHdc;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
  end;

implementation

uses
  UnitConst;
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
  ImageList := TDirectory.GetFiles(UnitConst.BACK_GROUND_IMAGE);

  if ImageIndex >= Length(ImageList) then begin
    ImageIndex := 0;
  end;

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

{*------------------------------------------------------------------------------
  ������Ϸ����

  @param x ��Ϸ���ڵ�X����
  @param y ��Ϸ���ڵ�Y����
  @param w ��Ϸ���ڵĿ��
  @param h ��Ϸ���ڵĸ߶�
-------------------------------------------------------------------------------}
procedure TGameSevice.DrawWindow(x, y, w, h: Integer);
var
  //����
  Graphics: TGPGraphics;
  img: TGPImage;
begin
  //�������ǵ�ͼƬ�ļ�
  img := TGPImage.Create(UnitConst.GAME_WINDOW);
  //�������ͼƬ���Ƶ�ָ���������(TImage)
  Graphics := TGPGraphics.Create(GameHandle);
  //����ͼƬ
    // ���Ͻ�
  Graphics.DrawImage(img, MakeRect(x, y, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH), 0, 0, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitPixel);

    // �������
  Graphics.DrawImage(img, MakeRect(x, y + UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, h - UnitConst.GAME_WINDOW_BORDER_WIDTH), 0, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth - (img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH), img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, UnitPixel);

    // ���½�
  Graphics.DrawImage(img, MakeRect(x, y + h, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight), 0, img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight, UnitPixel);

    // �ײ�����
  Graphics.DrawImage(img, MakeRect(x + UnitConst.GAME_WINDOW_BORDER_WIDTH, y + h, w - UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight), UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, img.GetHeight, UnitPixel);

    // ���½�
  Graphics.DrawImage(img, MakeRect(x + w, y + h, img.GetWidth, img.GetHeight), img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth, img.GetHeight, UnitPixel);
    // �Ҳ�����
  Graphics.DrawImage(img, MakeRect(x + w, y + UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth, h - UnitConst.GAME_WINDOW_BORDER_WIDTH), img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth, img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, UnitPixel);

    // ���Ͻ�
  Graphics.DrawImage(img, MakeRect(x + w, y, img.GetHeight, UnitConst.GAME_WINDOW_BORDER_WIDTH), img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH, 0, img.GetHeight, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitPixel);
    // ��������
  Graphics.DrawImage(img, MakeRect(x + UnitConst.GAME_WINDOW_BORDER_WIDTH, y, w - UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH), UnitConst.GAME_WINDOW_BORDER_WIDTH, 0, img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitPixel);

    // �м�
  Graphics.DrawImage(img, MakeRect(x + UnitConst.GAME_WINDOW_BORDER_WIDTH, y + UnitConst.GAME_WINDOW_BORDER_WIDTH, w - UnitConst.GAME_WINDOW_BORDER_WIDTH, h - UnitConst.GAME_WINDOW_BORDER_WIDTH), UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, UnitPixel);
  Graphics.Free;
  img.Free;

end;

end.


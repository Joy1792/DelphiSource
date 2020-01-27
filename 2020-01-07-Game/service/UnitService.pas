unit UnitService;

interface

uses
  Winapi.Windows, Winapi.GDIPOBJ, Winapi.GDIPAPI;

type
  TGameSevice = class
  private
   //定义属性
    FHdc: HDC;
  public
    procedure DrawBackground(FileName: string; Width, Hegiht: Integer);
    //构造方法
    constructor Create(hdc: HDC);
    //定义字段
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
  //画笔
  Graphics: TGPGraphics;
  Image: TGPImage;
begin

  //载入我们的图片文件
  Image := TGPImage.Create(FileName);
  //将载入的图片绘制到指定的组件上(TImage)
  Graphics := TGPGraphics.Create(GameHandle);

  //绘制图片
  Graphics.DrawImage(Image, MakeRect(0, 0, Width, Hegiht));

  Graphics.Free;
  Image.Free;
end;

end.


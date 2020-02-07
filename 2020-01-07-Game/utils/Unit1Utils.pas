unit Unit1Utils;

interface

type
  TPublicUtil = class
    class function GetNumberWithRound(Min, Max: Integer): Integer;
  end;

implementation

{ TPublicUtil }

{*------------------------------------------------------------------------------

  ��ָ����Χ��ȡһ�������

  @param Min ��Χ��ʼֵ

  @param Max  ��Χ�Ľ���ֵ

  @return ���ص������
-------------------------------------------------------------------------------}
class function TPublicUtil.GetNumberWithRound(Min, Max: Integer): Integer;
begin
  //��ʼ���������
  Randomize;

  Result := Random(Max) mod (Max - Min + 1) + Min;

end;

end.


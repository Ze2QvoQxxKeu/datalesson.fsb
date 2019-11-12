unit uMain;

interface

uses
  Winapi.Windows, System.SysUtils, System.RegularExpressions, System.StrUtils,
  System.Classes, Vcl.Controls, Vcl.Forms, System.Net.HttpClient, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfMain = class(TForm)
    Получить: TButton;
    Регион: TLabeledEdit;
    Город: TLabeledEdit;
    Имя: TLabeledEdit;
    Мыло: TLabeledEdit;
    Жертва: TComboBox;
    Label1: TLabel;
    Класс: TComboBox;
    Label2: TLabel;
    Школа: TLabeledEdit;
    Label3: TLabel;
    Пол: TComboBox;
    procedure ПолучитьClick(Sender: TObject);
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

function RandStr: string;
var
  i: Byte;
begin
  SetLength(Result, Succ(Random(10)));
  for i := 1 to Length(Result) do
    repeat
      Result[i] := Chr(Random(128));
    until CharInSet(Result[i], ['A'..'Z', '0'..'9']);
end;

procedure TfMain.ПолучитьClick(Sender: TObject);

  function Дисциплины: string;
  var
    i: Integer;
  begin
    Result := EmptyStr;
    i := Random(4);
    repeat
      Result := Result + '"' + RandStr + '",';
      Dec(i);
    until i = 0;
    Delete(Result, Result.Length, 1);
  end;

const
  ЖЕРТВЫ: array[0..2] of string = ('student', 'teacher', 'parent');
var
  SS: TStringStream;
begin
  SS := TStringStream.Create(Format('{"age_group":%d,"type":"%s","region":"%s","state":"%s"'
    + ',"vk_id":%s,"class_no":%d,"school":"%s","discipline":[%s],"children_ages":[%s],"student_info":[{"age":%s,"sex":"%s"}]}',
    [Succ(Класс.ItemIndex), ЖЕРТВЫ[Жертва.ItemIndex], Trim(Регион.Text),
    Trim(Город.Text), Random(MaxInt).toString, Succ(Random(11)), Trim(Школа.Text), Дисциплины,
    (7 + Random(11)).toString, (18 + Random(50)).toString,
    IfThen(Пол.ItemIndex = 0, 'male', 'female')]), TEncoding.UTF8);
  try
    with THTTPClient.Create do
    try
      ContentType := 'application/json; charset=utf-8';
      UserAgent := 'Mozilla/5.0 Mail.Ru Отъебись!!!';
      try
        with Post('https://form.datalesson.ru/api/v1/auth', SS) do
        begin
          with TRegEx.Match(ContentAsString(), 'user_id\"\:\"([^\"]+)') do
            if Success then
            begin
              SS.Clear;
              SS.WriteString(Format('{"name":"%s","email":"%s"}', [Trim(Имя.Text),
                Trim(Мыло.Text)]));
              SS.Position := 0;
              with Post(Format('https://form.datalesson.ru/api/v1/certificates/student/%s/send',
                [Groups[1].Value]), SS) do
              begin
                if ContentAsString().Equals('{"data":{}}') then
                  Application.MessageBox(PChar(Format('СертиФикат выслан на почту "%s"',
                    [Trim(Мыло.Text)])), 'Готово', MB_ICONINFORMATION)
                else
                  Application.MessageBox(PChar('Не сожрал:'#13#10 +
                    ContentAsString(TEncoding.UTF8)), 'Ошибка', MB_ICONERROR);
              end;
            end
            else
              Application.MessageBox(PChar('Не сожрал:'#13#10 + ContentAsString(TEncoding.UTF8)),
                'Ошибка', MB_ICONERROR);
        end;
      except
        raise Exception.Create('Ошибка отправки');
      end;
    finally
      Free;
    end;
  finally
    SS.Clear;
    SS.Free;
  end;
end;

initialization
  Randomize;

end.


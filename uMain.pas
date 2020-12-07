unit uMain;

interface

uses
  Winapi.Windows, System.SysUtils, System.RegularExpressions, System.StrUtils,
  System.Classes, Vcl.Controls, Vcl.Forms, System.Net.HttpClient, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Dialogs, Winapi.ShellAPI;

type
  TfMain = class(TForm)
    Получить: TButton;
    Регион: TLabeledEdit;
    Город: TLabeledEdit;
    Имя: TLabeledEdit;
    Жертва: TComboBox;
    Label1: TLabel;
    Класс: TComboBox;
    Label2: TLabel;
    Школа: TLabeledEdit;
    Label3: TLabel;
    Пол: TComboBox;
    Урок: TComboBox;
    Label4: TLabel;
    SaveDlg: TSaveDialog;
    КодСессии: TLabeledEdit;
    Данные: TPanel;
    Общее: TPanel;
    procedure ПолучитьClick(Sender: TObject);
    procedure КодСессииChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    until CharInSet(Result[i], ['A'..'Z', 'a'..'z', '0'..'9']);
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  Height := 308;
end;

procedure TfMain.КодСессииChange(Sender: TObject);
begin
  if Trim(КодСессии.Text).Length = 12 then
    Height := 142
  else if Height = 142 then
    Height := 308;
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
  NEW_ENGINE = 5;
  ЖЕРТВЫ: array[0..2] of string = ('student', 'teacher', 'parent');
  УРОКИ: array[0..5] of string = ('mail', 'cdw', 'da', 'fs', 'sber', 'ncom');
  ИЗОБРАЖЕНИЯ: array[NEW_ENGINE..5] of string =
  ('https://new-1.datalesson.ru/wp-content/uploads/2020/11/cert-pdf-20-02.jpg');
var
  SS: TStringStream;
  MS: TMemoryStream;
begin
  SaveDlg.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDlg.FileName := Format('cert_%s.pdf', [Уроки[Урок.ItemIndex]]);
  if not SaveDlg.Execute(Handle) then
    Exit;
  if Trim(Регион.Text).IsEmpty then
    Регион.Text := RandStr;
  if Trim(Город.Text).IsEmpty then
    Город.Text := RandStr;
  if Trim(Школа.Text).IsEmpty then
    Школа.Text := Random(MaxByte).ToString;
  if Trim(Имя.Text).IsEmpty then
    Имя.Text := 'урокцифры.фсб';
  SS := TStringStream.Create(Format('{"age_group":%d,"type":"%s","region":"%s","state":"%s"'
    + ',"vk_id":%s,"class_no":%d,"school":"%s","discipline":[%s],"children_ages":[%s],"student_info":[{"age":%s,"sex":"%s"}]}',
    [Succ(Класс.ItemIndex), ЖЕРТВЫ[Жертва.ItemIndex], Trim(Регион.Text), Trim(Город.Text),
    Random(MaxInt).toString, Succ(Random(11)), Trim(Школа.Text), Дисциплины, (7
    + Random(11)).toString, (18 + Random(50)).toString, IfThen(Пол.ItemIndex = 0,
    'male', 'female')]), TEncoding.UTF8);
  try
    with THTTPClient.Create do
    try
      ContentType := 'application/json; charset=utf-8';
      UserAgent := 'Mozilla/5.0 урокцифры.фсб';
      try
        with Post(IfThen(Trim(КодСессии.Text).Length <> 12,
          'https://form.datalesson.ru/api/v1/auth', //
          Format('https://form.datalesson.ru/api/v1/auth_by_code?code=%s', [Trim
          (КодСессии.Text)])), SS) do
        begin
          with TRegEx.Match(ContentAsString(), 'user_id\"\:\"([^\"]+)') do
            if Success then
            begin
              MS := TMemoryStream.Create;
              try
                if УРОК.ItemIndex < NEW_ENGINE then
                  Get(Format('https://form.datalesson.ru/api/v1/certificates/student/%s?challenge_type=%s&name=%s',
                    [Groups[1].Value, Уроки[Урок.ItemIndex], Trim(Имя.Text)]), MS)
                else
                begin
                  SS.Clear;
                  SS.WriteString(Format('cert_ename=%s&img=%s', [Trim(Имя.Text),
                    ИЗОБРАЖЕНИЯ[Урок.ItemIndex]]));
                  SS.Position := 0;
                  ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';
                  Get(Post('https://new-1.datalesson.ru/tech/', SS).ContentAsString, MS);
                end;
                try
                  MS.SaveToFile(SaveDlg.FileName);
                  if Application.MessageBox('Сертификат сохранён. Открыть для просмотра?',
                    'Готово', MB_ICONQUESTION or MB_YESNO) = IDYES then
                    ShellExecute(Handle, 'open', PChar(SaveDlg.FileName), nil,
                      nil, SW_SHOWNORMAL);
                except
                  Application.MessageBox('Ошибка сохранения сертификата',
                    'Ошибка', MB_ICONERROR);
                end;
              finally
                FreeAndNil(MS);
              end;
            end
            else
              Application.MessageBox(PChar('Текст ответа:'#13#10 +
                ContentAsString(TEncoding.UTF8)), 'Ошибка', MB_ICONERROR);
        end;
      except
        raise Exception.Create('Ошибка отправки');
      end;
    finally
      Free;
    end;
  finally
    FreeAndNil(SS);
  end;
end;

initialization
  Randomize;

end.


unit StoryUnit;
//Unit for Story
interface

//Connect libraries to work with graphics components
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MainUnit, Menus;

//Declaring types
type
  TResultArr = Array[1..100] of TResult;

//Declaring types
type
  TStoryForm = class(TForm)
    StoryBox: TListBox;
    ChooseBox: TComboBox;
    IncludeBut: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;

    procedure Refresh;
    function GetStory(var n: Integer):TResultArr;
    procedure FormCreate(Sender: TObject);
    procedure IncludeButClick(Sender: TObject);
    procedure StoryBoxClick(Sender: TObject);
    procedure N1Click(Sender: TObject);

    private
      { Private declarations }
    public
      { Public declarations }
    end;

//Declaring variables
var
  StoryForm: TStoryForm;

implementation

{$R *.dfm}

//Subprogram for story form
procedure TStoryForm.Refresh;
var
  Story: TResultArr;
  i,n: Integer;
begin
  StoryBox.Clear;
  Story:=GetStory(n);
  for i:=1 to n do
    StoryBox.Items.Add(Story[i].Name);
end;

//Subprogram for story form
procedure TStoryForm.FormCreate(Sender: TObject);
begin
  Refresh;
end;

//Subprogram for story form (button)
procedure TStoryForm.IncludeButClick(Sender: TObject);
var
  Choose, ChooseRes, n:Integer;
  Res: TResult;
  Story: TResultArr;
begin
  Choose:= ChooseBox.ItemIndex;
  if Choose = -1 then
    raise Exception.Create('Выберите матрицу.');
  ChooseRes:=StoryBox.ItemIndex;
  if ChooseRes = -1 then
    raise Exception.Create('Не выбран результат.');
  Inc(Choose);
  Inc(ChooseRes);

  Story := GetStory(n);
  Res := Story[ChooseRes];
  Form1.SetMatrix(Res.Mat, Choose);
end;

//Subprogram for story form for getting
function TStoryForm.GetStory(var N: Integer):TResultArr;
var
  TypeFile: File of TResult;
  Story: TResultArr;
  i: Integer;
begin
  AssignFile(TypeFile, 'Story.mtx');
  Reset(TypeFile);
  i:=1;
  while not EOF(TypeFile) do
  begin
    Read(TypeFile, Story[i]);
    Inc(i);
  end;
  N := i-1;
  CloseFile(TypeFile);
  Result := Story;
end;

//Subprogram for story form
procedure TStoryForm.StoryBoxClick(Sender: TObject);
var
  ChooseRes,n: Integer;
  Res: TResult;
  Story: TResultArr;
begin
  ChooseRes := StoryBox.ItemIndex;
  if ChooseRes <> -1 then
  begin
    Inc(ChooseRes);
    Story := GetStory(n);
    Res := Story[ChooseRes];
    Form1.PrintMarix(Res.Mat, False);
  end;
end;

//Subprogram for story form
procedure TStoryForm.N1Click(Sender: TObject);
var
  Ans: Integer;
  TypeFile: File of TResult;
begin
  Ans := MessageDlg('Вы уверены, что хотите удали результаты?', mtCustom,[mbYes, mbNo], 0);
  if Ans = mrYes then
  begin
     AssignFile(TypeFile, 'Story.mtx');
     Rewrite(TypeFile);
     CloseFile(TypeFile);
     Refresh;
  end;
end;

end.

unit MainUnit;
//Main Unit

interface

//Connect libraries to work with graphics components
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, StackUnit, OperationsUnit, Menus;

//Declaring types
type
  TMatrix = Array[1..10,1..10] of Real;

//Declaring types
type
  TResult = record
    Mat: Matrix;
    Name: String[100];
  end;

//Declaring types
type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    AddRowBut1: TButton;
    AddColBut1: TButton;
    DelRowBut1: TButton;
    DelColBut1: TButton;

    AddRow2But: TButton;
    AddCol2But: TButton;
    DelRow2But: TButton;
    DelCol2But: TButton;

    ResultBut: TButton;
    Console: TStringGrid;
    ByNumber: TEdit;
    FieldExpr: TEdit;
    MainMenu1: TMainMenu;
    About: TMenuItem;
    Story: TMenuItem;
    Label1: TLabel;
    Clean: TButton;
    Label2: TLabel;
    LabMatB: TLabel;
    N1: TMenuItem;


    procedure ListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControlVisible();
    procedure AddRowBut1Click(Sender: TObject);
    procedure AddColBut1Click(Sender: TObject);
    procedure DelRowBut1Click(Sender: TObject);
    procedure DelColBut1Click(Sender: TObject);

    procedure AddRow2ButClick(Sender: TObject);
    procedure AddCol2ButClick(Sender: TObject);
    procedure DelRow2ButClick(Sender: TObject);
    procedure DelCol2ButClick(Sender: TObject);

    procedure ResultButClick(Sender: TObject);
    procedure PrintMarix(Mat: Matrix;  isSave: Boolean);
    function GetMatrix(Number: Integer):Matrix;
    procedure SetMatrix(Mat: Matrix; Number: Integer);
    function Expression():Matrix;
    procedure doOperat();
    procedure AboutClick(Sender: TObject);
    procedure StoryClick(Sender: TObject);
    procedure CleanClick(Sender: TObject);
    procedure N1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

//Declaring variables
var
  Form1: TForm1;
  ChooseOperation: Integer;
  MEdit: array[1..2, 1..10, 1..10] of TEdit;
  NRow, NCol: array[1..2] of Integer;

implementation

uses
  StoryUnit;

{$R *.dfm}

//Subprogram for selecting operation
procedure TForm1.ListBox1Click(Sender: TObject);
begin
  ChooseOperation:=ListBox1.ItemIndex;
  if ChooseOperation in [3..4] then
  begin
    ByNumber.Visible := True;
    Panel2.Visible := False;
    AddRow2But.Visible := False;
    AddCol2But.Visible := False;
    DelRow2But.Visible := False;
    DelCol2But.Visible := False;
    FieldExpr.Visible := False;
    LabMatB.Visible := False;
  end
  else
    if ChooseOperation in [5..7] then
    begin
      ByNumber.Visible := False;
      Panel2.Visible := False;
      AddRow2But.Visible := False;
      AddCol2But.Visible := False;
      DelRow2But.Visible := False;
      DelCol2But.Visible := False;
      FieldExpr.Visible := False;
      LabMatB.Visible := False;
    end
    else
      if ChooseOperation = 8 then
      begin
        ByNumber.Visible := False;
        Panel2.Visible := False;
        AddRow2But.Visible := False;
        AddCol2But.Visible := False;
        DelRow2But.Visible := False;
        DelCol2But.Visible := False;
        FieldExpr.Visible := False;
        LabMatB.Visible := False;
      end
      else
        if ChooseOperation = 9 then
        begin
          ByNumber.Visible := False;
          Panel2.Visible := True;
          AddRow2But.Visible := True;
          AddCol2But.Visible := True;
          DelRow2But.Visible := True;
          DelCol2But.Visible := True;
          FieldExpr.Visible := True;
          LabMatB.Visible := True;
        end
        else
        begin
          ByNumber.Visible := False;
          Panel2.Visible := True;
          AddRow2But.Visible := True;
          AddCol2But.Visible := True;
          DelRow2But.Visible := True;
          DelCol2But.Visible := True;
          FieldExpr.Visible := False;
          LabMatB.Visible := True
        end;
end;

//Subprogram for control visible edits
procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:Integer;
begin
  for i:=1 to 10 do
    for j:=1 to 10 do
    begin
      MEdit[1,i,j] := TEdit.Create(Panel1);
      MEdit[1,i,j].Parent := Panel1;
      MEdit[1,i,j].Width := (Panel1.Width-33) div 10;
      MEdit[1,i,j].Height := (Panel1.Height-33) div 10;
      MEdit[1,i,j].Left := 3*j+(j-1)*MEdit[1,i,j].Width;
      MEdit[1,i,j].Top := 3*i+(i-1)*MEdit[1,i,j].Height;

      MEdit[2,i,j] := TEdit.Create(Panel1);
      MEdit[2,i,j].Parent := Panel2;
      MEdit[2,i,j].Width := (Panel2.Width-33) div 10;
      MEdit[2,i,j].Height := (Panel2.Height-33) div 10;
      MEdit[2,i,j].Left := 3*j+(j-1)*MEdit[2,i,j].Width;
      MEdit[2,i,j].Top := 3*i+(i-1)*MEdit[2,i,j].Height;
    end;
    for i:=1 to 2 do
    begin
      NRow[i] := 3;
      NCol[i] := 3;
    end;
    ListBox1.ItemIndex:=0;
    ControlVisible;
end;

//Subprogram for control visible edits
procedure TForm1.ControlVisible();
var
  i,j,k: Integer;
begin
  for k:=1 to 2 do
    for i:=1 to 10 do
      for j:=1 to 10 do
      begin
        if(i<=NRow[k]) and (j<=NCol[k]) then
          MEdit[k,i,j].Visible := True
        else
          MEdit[k,i,j].Visible := False;
      end;
end;

//Addition of row for pan1
procedure TForm1.AddRowBut1Click(Sender: TObject);
begin
  if NRow[1]<10 then
    NRow[1] := NRow[1] + 1;
  ControlVisible;
end;

//Addition of col for pan1
procedure TForm1.AddColBut1Click(Sender: TObject);
begin
  if NCol[1]<10 then
    NCol[1] := NCol[1] + 1;
  ControlVisible;
end;

//Delete of row for pan1
procedure TForm1.DelRowBut1Click(Sender: TObject);
begin
  if NRow[1]>1 then
    NRow[1] := NRow[1] - 1;
  ControlVisible;
end;

//Delete of col for pan1
procedure TForm1.DelColBut1Click(Sender: TObject);
begin
  if NCol[1]>1 then
    NCol[1] := NCol[1] - 1;
  ControlVisible;
end;

//Addition of col for pan2
procedure TForm1.AddRow2ButClick(Sender: TObject);
begin
  if NRow[2]<10 then
    NRow[2] := NRow[2] + 1;
  ControlVisible;
end;

//Addition of col for pan2
procedure TForm1.AddCol2ButClick(Sender: TObject);
begin
  if NCol[2]<10 then
    NCol[2] := NCol[2] + 1;
  ControlVisible;
end;

//Delete of row for pan2
procedure TForm1.DelRow2ButClick(Sender: TObject);
begin
  if NRow[2]>1 then
    NRow[2] := NRow[2] - 1;
  ControlVisible;
end;

//Delete of col for pan2
procedure TForm1.DelCol2ButClick(Sender: TObject);
begin
  if NCol[2]>1 then
    NCol[2] := NCol[2] - 1;
  ControlVisible;
end;

//Subprogram for setting matrix
procedure TForm1.SetMatrix(Mat: Matrix; Number: Integer);
var
  i,j: Integer;
begin
  NRow[Number] := Mat.N;
  NCol[Number] := Mat.M;

  for i:=1 to 10 do
    for j:=1 to 10 do
      MEdit[Number,i,j].Visible := False;
  for i:=1 to Mat.N do
    for j:=1 to Mat.M do
    begin
      MEdit[Number,i,j].Text:=FloatToStr(Mat.Arr[i,j]);
      MEdit[Number,i,j].Visible:=True;
    end;
end;

//Subprogram for getting matrix
function TForm1.GetMatrix(Number: Integer):Matrix;
var
  Mat: Matrix;
  i,j: Integer;
begin
  try
    Mat.N := NRow[Number];
    Mat.M := NCol[Number];
    for i:= 1 to Mat.N do
      for j:= 1 to Mat.M do
        Mat.Arr[i,j] := StrToFloat(MEdit[Number, i, j].Text);
    GetMatrix:=Mat;
  except on E:Exception do
    raise Exeption.Create('Некорректный ввод!');
  end;
end;

//Subprogram for button Result
procedure TForm1.ResultButClick(Sender: TObject);
var
  A,B,Res: Matrix;
begin
  try
    A := GetMatrix(1);
    B := GetMatrix(2);

    if ChooseOperation = 0 then
      Res := MulMatrix(A,B);
    if ChooseOperation = 1 then
      Res := SumMatrix(A,B);
    if ChooseOperation = 2 then
      Res := SubMatrix(A,B);
    if ChooseOperation = 3 then
    begin
      try
        Res := MulByNumber(A,StrToFloat(ByNumber.Text));
      Except on E:Exeption do
        raise Exeption.Create('Некорректный ввод!');
      end;
    end;
    if ChooseOperation = 4 then
      Res := Exponent(A,StrToInt(ByNumber.Text));
    if ChooseOperation = 5 then
      Res := TransposMatrix(A);
    if ChooseOperation = 6 then
      Res := InverseMatrix(A);
    if ChooseOperation = 7 then
      Res := TriangleView(A);
    if ChooseOperation = 8 then
      Res := DetMatrix(A);
    if ChooseOperation = 9 then
      Res := Expression();
    PrintMarix(Res, True);

  except on E:Exception do
    ShowMessage(E.Message);
  end;
end;

//Subprogram for printing matrix
procedure TForm1.PrintMarix(Mat: Matrix; isSave: Boolean);
var
  i,j,Width,Height: Integer;
  TypeFile: File of TResult;
  Res: TResult;
  Story: Array[1..100] of TResult;
  Name: String;
begin
  Console.RowCount := Mat.N;
  Console.ColCount := Mat.M;
  Width := 50*Mat.M;
  Height := 20*Mat.N;
  Console.Left := 528-(Width div 2);
  Console.Top := 480-(Height div 2);
  Console.Width := Width+5;
  Console.Height := Height+5;

  for i:=1 to Mat.N do
    for j:=1 to Mat.M do
      Console.Cells[j-1,i-1] := FloatToStr(Round(100*Mat.Arr[i,j])/100);
  if isSave then
  begin
    AssignFile(TypeFile, 'Story.mtx');
    Reset(TypeFile);
    i := 2;
    while (i<=100) and (not EOF(TypeFile)) do
    begin
      Read(TypeFile, Story[i]);
      Inc(i);
    end;
    j:=i-1;
    CloseFile(TypeFile);

    Rewrite(TypeFile);
    Res.Mat := Mat;

    Name := TimeToStr(Time)+' / ';
    for i:=1 to Mat.M do
      Name := Name + FloatToStr(Mat.Arr[1,i])+' ';

    Res.Name := Name;
    Story[1] := Res;
    for i:=1 to j do
      Write(TypeFile,Story[i]);
    CloseFile(TypeFile);

    if StoryForm <> nil then
    StoryForm.Refresh;
  end;
end;

//Subprogram for expression
function TForm1.Expression():Matrix;
var
  i,j: Integer;
  NumberInt,NumberReal: Real;
  Mat: Matrix;
  ExprResult: String;
begin
  Mat := EMatrix(3);
  ExprResult := FieldExpr.Text;

  for i:=1 to Length(ExprResult) do
  begin
    if(ExprResult[i]='A') then
      pushData(GetMatrix(1))
    else if(ExprResult[i]='B') then
      pushData(GetMatrix(2))
      else if(ExprResult[i]='E') then
        pushData(EMatrix(10))
        else if(ExprResult[i]='*') then
        begin
          if not isEmptyOperat then
            if (topOperat='*') then
              doOperat;
            pushOperat('*');
        end
        else if(ExprResult[i]='+') or (ExprResult[i]='-') then
        begin
          if not isEmptyOperat then
            if topOperat <> '(' then
              doOperat;
            pushOperat(ExprResult[i]);
        end
        else if(ExprResult[i]='(') then
          pushOperat('(')
          else if(ExprResult[i]=')') then
          begin
            while topOperat<>'(' do
              doOperat;
            popOperat;
          end
          else
          begin
            numberInt := 0;
            numberReal := 10;
            j := i;
            while ExprResult[j] in ['0'..'9'] do
            begin
              numberInt := numberInt*10+(ord(ExprResult[j])-ord('0'));
              j:= j+1;
            end;
            if ExprResult[j] = '.' then
            begin
              j := j+1;
              while ExprResult[j] in ['0'..'9'] do
              begin
                numberInt := numberInt + (ord(ExprResult[j])-ord('0'))/numberReal;
                numberReal := numberReal*10;
                j := j+1;
              end;
            end;
            pushNumber(NumberInt);
          end;
  end;
  while not isEmptyOperat do
    doOperat;

  if isLastMatrix then
    Result := popDataMatrix
  else
    Result := MulByNumber(EMatrix(1), popDataNumber);
end;

//Subprogram for expression
procedure TForm1.doOperat();
var
  Operat: Char;
  A,B: Matrix;
  ANum,BNum: Real;
  AisNum,BisNum: Boolean;
begin
  AisNum := False;
  BisNum := False;
  Operat := PopOperat();
  if(isLastMatrix) then
    B := popDataMatrix
  else
  Begin
    BNum := popDataNumber;
    BisNum := True;
  End;
  if (isLastMatrix) then
    A := popDataMatrix
  else
  Begin
    ANum := popDataNumber;
    AisNum := True;
  End;

  case Operat of
  '*':
    if AisNum and BisNum then
      pushNumber(ANum*BNum)
    else if AisNum then
      pushData(MulByNumber(B, ANum))
    else if BisNum then
      pushData(MulByNumber(A, BNum))
    else
      pushData(MulMatrix(A, B));

  '-':
    if AisNum and BisNum then
      pushNumber(ANum-BNum)
    else if AisNum then
      raise Exeption.Create('Используйте матрица-число*E.')
    else if BisNum then
      raise Exeption.Create('Используйте число*E-матрица.')
    else
      pushData(SubMatrix(A, B));

   '+':
    if AisNum and BisNum then
      pushNumber(ANum+BNum)
    else if AisNum then
      raise Exeption.Create('Используйте матрица+число*E.')
    else if BisNum then
     raise Exeption.Create('Используйте число*E+матрица.')
    else
      pushData(SumMatrix(A, B));
   end;
end;

//Subprogram for text file
procedure TForm1.AboutClick(Sender: TObject);
var
  F: TextFile;
  S,Text: String;
begin
  AssignFile(F,'AboutProgram.txt');
  Reset(F);
  Text:='';
  while not EOF(F) do
  begin
    Readln(F,S);
    Text := Text+S+Chr(10)+Chr(13);
  end;
  ShowMessage(Text);
  CloseFile(F);
end;

//Subprogram for type file
procedure TForm1.StoryClick(Sender: TObject);
begin
  StoryForm := TStoryForm.Create(Self);
  StoryForm.Show;
end;

procedure TForm1.CleanClick(Sender: TObject);
var
  i,j,k:Integer;
begin
  for k:=1 to 2 do
    for i:= 1 to 10 do
      for j:= 1 to 10 do
        MEdit[k,i,j].Text:='';

  ByNumber.Text:='';
  FieldExpr.Text:='';
end;

//Subprogram for text file
procedure TForm1.N1Click(Sender: TObject);
var
  F: TextFile;
  S,Text: String;
begin
AssignFile(F,'Rules.txt');
  Reset(F);
  Text:='';
  while not EOF(F) do
  begin
    Readln(F,S);
    Text := Text+S+Chr(10)+Chr(13);
  end;
  ShowMessage(Text);
  CloseFile(F);
end;

end.

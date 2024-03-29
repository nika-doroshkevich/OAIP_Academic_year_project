unit OperationsUnit;
//Unit for operations

interface

//Connect libraries to work with graphics components
uses
  SysUtils;

//Declaring types
type
  TMatrix = Array[1..10,1..10] of Real;
  Exeption = class(Exception);

Matrix = record
  N,M: Integer;
  Arr: TMatrix;
end;

function SumMatrix(MatrixA,MatrixB: Matrix):Matrix;
function MulByNumber(MatrixA: Matrix; Number: Real):Matrix;
function SubMatrix(MatrixA,MatrixB: Matrix):Matrix;
function MulMatrix(MatrixA,MatrixB: Matrix):Matrix;
function Exponent(MatrixA: Matrix; Power: Integer):Matrix;
function TransposMatrix(MatrixA: Matrix):Matrix;
procedure ElemTransform(var Mat: Matrix; NStr1,NStr2: Integer; Number: Real);
function TriangleView(Mat: Matrix):Matrix;

function InverseMatrix(Mat: Matrix):Matrix;

function EMatrix(Size: Integer):Matrix;
function isDiagMatrix(MatrixA: Matrix):Boolean;
function DetMatrix(Mat: Matrix):Matrix;
function DelRowCol(Mat: Matrix; Row,Col: Integer):Matrix;

implementation

//Subprogram for sum matrix
function SumMatrix(MatrixA,MatrixB: Matrix):Matrix;
var
  i,j: Integer;
  Res: Matrix;
begin
  if isDiagmatrix(MatrixA) then
  begin
    MatrixA.N := MatrixB.N;
    MatrixA.M := MatrixB.M;
  end;
  if isDiagmatrix(MatrixB) then
  begin
    MatrixB.N := MatrixA.N;
    MatrixB.M := MatrixA.M;
  end;
  if (MatrixA.N<>MatrixB.N) or (MatrixA.M<>MatrixB.M) then
    raise Exeption.Create('�� ��������� ������� ������.');
  Res.N := MatrixA.N;
  Res.M := MatrixA.M;
  for i:=1 to MatrixA.N do
    for j:=1 to MatrixA.M do
      Res.Arr[i,j] := MatrixA.Arr[i,j]+MatrixB.Arr[i,j];
  Result:=Res;
end;

//Subprogram for mul matrix by number
function MulByNumber(MatrixA: Matrix; Number: Real):Matrix;
var
  i,j: Integer;
  Res: Matrix;
Begin
  Res.N := MatrixA.N;
  Res.M := MatrixA.M;
  for i:=1 to MatrixA.N do
    for j:=1 to MatrixA.M do
      Res.Arr[i,j] := MatrixA.Arr[i,j]*Number;
  Result := Res;
end;

//Subprogram for sub matrix
function SubMatrix(MatrixA,MatrixB: Matrix):Matrix;
Begin
  SubMatrix := SumMatrix(MatrixA, MulByNumber(MatrixB,-1));
end;

//Subprogram for mul matrix
function MulMatrix(MatrixA,MatrixB: Matrix):Matrix;
var
  i,j,k: Integer;
  Res: Matrix;
Begin
  if isDiagmatrix(MatrixA) then
  begin
    MatrixA.N := MatrixB.M;
    MatrixA.M := MatrixB.N;
  end;
  if isDiagmatrix(MatrixB) then
  begin
    MatrixB.N := MatrixA.M;
    MatrixB.M := MatrixA.N;
  end;
  if (MatrixA.M<>MatrixB.N) then
    raise Exeption.Create('���������� �������� ������� � ������ ��������� � ����������� ����� ������� �');
  Res.N := MatrixA.N;
  Res.M := MatrixB.M;
  for i:=1 to MatrixA.N do
    for j:=1 to MatrixB.M do
    begin
      Res.Arr[i,j] := 0;
      for k:=1 to MatrixA.M do
        Res.Arr[i,j] := Res.Arr[i,j] + MatrixA.Arr[i,k]*MatrixB.Arr[k,j];
    end;
  Result := Res;
end;

//Subprogram for exponent
function Exponent(MatrixA: Matrix; Power: Integer):Matrix;
var
  i: Integer;
  Res: Matrix;
begin
  if Power < 0 then
    raise Exeption.Create('� ������������� ������� �� ��������.');

  if (MatrixA.N<>MatrixA.M) then
    raise Exeption.Create('������� ������ ���� ����������.');

  Res := EMatrix(MatrixA.N);
  for i:=1 to Power do
    Res := MulMatrix(Res,MatrixA);

  Result := Res;
end;

//Subprogram for finding Ematrix
function EMatrix(Size: Integer):Matrix;
var
  i,j: Integer;
  Res: Matrix;
begin
  Res.N := Size;
  Res.M := Size;
  for i:=1 to Size do
    for j:=1 to Size do
      if i = j then
        Res.Arr[i,j] := 1
      else
        Res.Arr[i,j] := 0;
  Result := Res;
end;

//Subprogram for finding diag matrix
function isDiagMatrix(MatrixA: Matrix):Boolean;
var
  i,j,Diag,NonDiag: Integer;
begin
  Diag := 0;
  Nondiag := 0;
  for i:=1 to MatrixA.N do
    for j:=1 to MatrixA.M do
      if MatrixA.Arr[i,j]<>0 then
        if i=j then
          Inc(Diag)
        else
          Inc(NonDiag);
  Result := (Diag=MatrixA.N) and (NonDiag=0);
end;

//Subprogram for transpos
function TransposMatrix(MatrixA: Matrix):Matrix;
var
  i,j: Integer;
  Res: Matrix;
begin
  Res.N := MatrixA.N;
  Res.M := MatrixA.M;
  for i:=1 to MatrixA.N do
    for j:=1 to MatrixA.M do
      Res.Arr[i,j] := MatrixA.Arr[j,i];
  Result := Res;
end;

//Subprogram for elem transform
procedure ElemTransform(var Mat: Matrix; NStr1,NStr2: Integer; Number: Real);
var
  j: Integer;
begin
  for j:=1 to Mat.M do
  begin
    Mat.Arr[NStr1,j]:= Mat.Arr[NStr1,j]+Number* Mat.Arr[NStr2,j];
    Mat.Arr[NStr1,j]:=Round(1000*Mat.Arr[NStr1,j])/1000;
  end;
end;

//Subprogram for triangle view
function TriangleView(Mat: Matrix):Matrix;
var
  i,j: Integer;
begin
  if (Mat.N<>Mat.M) then
    raise Exeption.Create('������� �� ����������.');
  for i:=1 to Mat.N do
  begin
    for j:=i+1 to Mat.N do
    begin
      if Mat.Arr[i,i]=0 then
        raise Exeption.Create('���������� �������� � ������������ ����.');
      ElemTransform(Mat, j, i, -Mat.Arr[j, i]/Mat.Arr[i,i]);
    end;
  end;
  Result := Mat;
end;

//Subprogram for inverse matrix
function InverseMatrix(Mat: Matrix):Matrix;
var
  i,j: Integer;
  InversMat: Matrix;
  Temp: Real;
begin
  if (Mat.N<>Mat.M) then
    raise Exeption.Create('������� �� ����������.');
  InversMat := EMatrix(Mat.N);
  for i:=1 to Mat.N do
  begin
    for j:=i+1 to Mat.N do
    begin
      if Mat.Arr[i,i]=0 then
        raise Exeption.Create('���������� ����� �������� �������.');
      ElemTransform(InversMat, j, i, -Mat.Arr[j, i]/Mat.Arr[i,i]);
      ElemTransform(Mat, j, i, -Mat.Arr[j, i]/Mat.Arr[i,i]);
    end;
  end;

  for i:=Mat.N downto 1 do
  begin
    for j:=i-1 downto 1 do
    begin
      if Mat.Arr[i,i]=0 then
        raise Exeption.Create('���������� ����� �������� �������.');
      ElemTransform(InversMat, j, i, -Mat.Arr[j, i]/Mat.Arr[i,i]);
      ElemTransform(Mat, j, i, -Mat.Arr[j, i]/Mat.Arr[i,i]);
    end;
  end;

  for i:=1 to Mat.N do
  begin
    Temp := Mat.Arr[i,i];
    for j:=1 to Mat.N do
    begin
      InversMat.Arr[i,j] := InversMat.Arr[i,j]/Temp;
      Mat.Arr[i,j] := Mat.Arr[i,j]/Temp;
    end;
  end;
  Result := InversMat;
end;

//Subprogram for det matrix
function DetMatrix(Mat: Matrix):Matrix;
var
  i: Integer;
  Det,Znak: Real;
begin
  Det := 0;
  Znak:=1;
  if Mat.N=1 then
    Result:=Mat
  else
  begin
    for i:= 1 to Mat.N do
    begin
      Det:=Det+znak*Mat.arr[1,i]*DetMatrix(DelRowCol(Mat, 1, i)).Arr[1,1];
      Znak:=Znak*(-1);
    end;

    Result := MulByNumber(EMatrix(1), Det);
  end;
end;

//Subprogram for del rows and cols
function DelRowCol(Mat: Matrix; Row,Col: Integer):Matrix;
var
  i,j, ResJ, ResI: Integer;
  Res: Matrix;
begin
  Res.N := Mat.N-1;
  Res.M := Mat.M-1;
  for i:= 1 to Mat.N do
    for j:= 1 to Mat.M  do
    begin
      if i < Row then
        ResI := i
      else if i>Row then
        ResI := i-1
      else
        ResI := 0;
      if j < Col then
        ResJ := j
      else if j>Col then
        ResJ := j-1
      else
        ResJ := 0;
      if (ResI > 0) and (ResJ > 0) then
        Res.Arr[ResI, ResJ] := Mat.Arr[i,j];
    end;
    Result := Res;
end;

end.

unit StackUnit;
//Unit for Stack
interface

//Connect libraries to work with graphics components
uses
  OperationsUnit;

//Declaring types
type
  PNodeOperat = ^nodeOperat;
  PNodeData = ^nodeData;

nodeOperat = record // Узел
  operation: char;
  next: PNodeOperat;
  end;

nodeData = record
  Mat: Matrix;
  Number: Real;
  isMatrix: Boolean;
  Next: pNodeData;
  end;

  //-----OPERATION STACK FUNCTIONAL
  procedure pushOperat(Operation: Char);
  function popOperat(): Char;
  function topOperat(): Char;
  function isEmptyOperat(): Boolean;
  procedure removeOperat();
  //---
  //-----DATA STACK FUNCTIONAL
  procedure pushData(Data: Matrix);
  procedure pushNumber(Data: Real);

  function popDataMatrix():Matrix;
  function popDataNumber():Real;

  function topDataNumber():Real;
  function topDataMatrix():Matrix;

  function isLastMatrix():Boolean;

  function isEmptyData():Boolean;

  procedure removeData();
  //---

var
  headOperat: pNodeOperat;
  headData: pNodeData;

implementation

//-----OPERATION STACK FUNCTIONAL
//Subprogram for push operation
procedure pushOperat(Operation: Char);
var
  Temp: pNodeOperat;
begin
  New(Temp);
  Temp^.Next := headOperat;
  headOperat := Temp;
  headOperat^.Operation := Operation;
end;

//Subprogram for pop operation
function popOperat():char;
var
  Oper: Char;
  Temp: pNodeOperat;
begin
  Oper := headOperat^.Operation;
  Temp := headOperat;
  headOperat := Temp^.Next;
  Dispose(Temp);
  popOperat := Oper;
end;

//Subprogram for stack
function topOperat():char;
begin
  topOperat := headOperat^.Operation;
end;

//Subprogram for stack
function isEmptyOperat():Boolean;
begin
  isEmptyOperat := headOperat = NIL;
end;

//Subprogram for stack
procedure removeOperat();
var
  Temp: pNodeOperat;
begin
  while headOperat<>NIL do
  begin
    Temp := headOperat;
    headOperat := headOperat^.Next;
    Dispose(Temp);
  end;
end;
//---
//-----DATA STACK FUNCTIONAL
//Subprogram for push data
procedure pushData(Data: Matrix);
var
 Temp: pNodeData;
begin
  New(Temp);
  Temp^.Mat := Data;
  Temp^.isMatrix := True;
  Temp^.Next := headData;
  headData := Temp;
end;

//Subprogram for push number
procedure pushNumber(Data: Real);
var
  Temp: pNodeData;
begin
  New(Temp);
  Temp^.Number := Data;
  Temp^.isMatrix := False;
  Temp^.Next := headData;
  headData := Temp;
end;

//Subprogram for pop matrix
function popDataMatrix():Matrix;
var
  Mat: Matrix;
  Temp: pNodeData;
begin
  Mat := headData^.Mat;
  Temp := headData;
  headData := Temp^.Next;
  Dispose(Temp);
  popDataMatrix := Mat;
end;

//Subprogram for pop number
function popDataNumber():Real;
var
  Number: Real;
  Temp: pNodeData;
begin
  Number := headData^.Number;
  Temp := headData;
  headData := Temp^.Next;
  Dispose(Temp);
  popDataNumber := Number;
end;

//Subprogram for stack
function topDataNumber():Real;
begin
  topDataNumber := headData^.Number;
end;

//Subprogram for stack
function topDataMatrix():Matrix;
begin
  topDataMatrix := headData^.Mat;
end;

//Subprogram for stack
function isLastMatrix():Boolean;
begin
  isLastMatrix := headData^.isMatrix;
end;

//Subprogram for stack
function isEmptyData():Boolean;
begin
   isEmptyData := headData = NIL;
end;

//Subprogram for stack
procedure removeData();
var
  Temp: pNodeData;
begin
  while headData<>NIL do
  begin
    Temp := headData;
    headData := headData^.Next;
    Dispose(Temp);
  end;
end;
//---
begin
  headOperat := NIL;
  headData := NIL;
end.



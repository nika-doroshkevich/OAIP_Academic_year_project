Program Matrix_calculator;

//Connection of modules, forms
uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  StackUnit in 'StackUnit.pas',
  OperationsUnit in 'OperationsUnit.pas',
  StoryUnit in 'StoryUnit.pas' {StoryForm};

//Creates a file with startup options
{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

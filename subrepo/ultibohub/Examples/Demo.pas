unit Demo;

interface
procedure DemoStart;
procedure DemoEnd;

implementation
uses
 Platform,Ultibo;

procedure DemoStart;
begin
 while not DirectoryExists('c:'\') do
  Sleep (100);
 DeleteFile('c:\kernel7.img');
 CopyFile('c:\backup\kernel7.img','c:\kernel7.img',False);
end;

procedure DemoEnd;
begin
 Sleep(5000);
 SystemRestart(0);
end;

end.

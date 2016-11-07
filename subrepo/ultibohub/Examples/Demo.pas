unit Demo;

interface
uses
 GlobalTypes;
procedure DemoStart(SomeWindow:TWindowHandle);
procedure DemoEnd;

implementation
uses
 GlobalConfig,GlobalConst,Console,Devices,Gpio,Platform,Threads,SysUtils,
 RaspberryPi2,PlatformRpi2,BCM2709,BCM2836,Ultibo;

var
 Window:TWindowHandle;

procedure WriteLn(Line:String);
begin
 ConsoleWindowWriteLn(Window,Line); 
end;
procedure DemoStart(SomeWindow:TWindowHandle);
begin
 Window:=SomeWindow;
 while not DirectoryExists('c:') do
  begin
   WriteLn('waiting for c:');
   Sleep (100);
  end;
 DeleteFile('c:\kernel7.img');
 CopyFile('c:\backup\kernel7.img','c:\kernel7.img',False);
 WriteLn('kernel7.img has been restored');
end;
procedure DemoEnd;
begin
 WriteLn('Delaying 5 seconds before restart...');
 Sleep(5000);
 SystemRestart(0);
end;
end.

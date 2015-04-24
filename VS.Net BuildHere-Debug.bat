@rem Author: Priyakant Patel
@rem http://www.priyakant.com

@prompt $S

@REM Detection of VS 2008 Projects and Solutions
@findstr "ToolsVersion=\"3" %1
@IF %ERRORLEVEL% LSS 1 goto LABEL_VS9

@findstr ".*Format.*Version.*10" %1
@IF %ERRORLEVEL% LSS 1 goto LABEL_VS9

@findstr "#.*Visual.*Studio.*2008" %1
@IF %ERRORLEVEL% LSS 1 goto LABEL_VS9

@REM Detection of VS 2010 Projects and Solutions
@findstr "ToolsVersion=\"4\.0" %1
@IF %ERRORLEVEL% LSS 1 goto LABEL_VS9

@findstr ".*Format.*Version.*11" %1
@IF %ERRORLEVEL% LSS 1 goto LABEL_VS9

@findstr "#.*Visual.*Studio.*2010" %1
@IF %ERRORLEVEL% LSS 1 goto LABEL_VS9

@REM Detection of VS 2013 Projects and Solutions

@findstr "ToolsVersion=\"12\.0" %1
@IF %ERRORLEVEL% LSS 1 goto LABEL_VS12

@findstr "#.*Visual.*Studio.*2013" %1
@IF %ERRORLEVEL% LSS 1 goto LABEL_VS12


@REM Assume VS 2003 Project or Solution

:LABEL_VS7
@cls
@echo *** *** Project is a Microsoft Visual Studio .Net 2003 *** ***
Call "%VS71COMNTOOLS%vsvars32.bat"
@echo **** building following solution in ~~Debug~~ mode ****
@echo %1
@devenv %1 /rebuild Debug

@goto LABEL_END

:LABEL_VS8
@cls
@echo *** *** Project is a Microsoft Visual Studio .Net 2005 *** ***
Call "%VS80COMNTOOLS%vsvars32.bat"
@echo **** building following solution in ~~Debug~~ mode ****
@echo %1
@devenv %1 /rebuild Debug

@goto LABEL_END

:LABEL_VS9
@cls
@echo *** *** Project is a Microsoft Visual Studio .Net 2010 (.NET 3.5 or 4.0) *** ***
Call "%VS100COMNTOOLS%vsvars32.bat"
@echo **** building following solution in ~~Debug~~ mode ****
@echo %1
@msbuild %1 /t:Rebuild /p:Configuration=Debug

@goto LABEL_END

:LABEL_VS12
@cls
@echo *** *** Project is a Microsoft Visual Studio .Net 2013 (.NET 3.5 thru 4.5.2) *** ***
Call "%VS120COMNTOOLS%vsvars32.bat"
@echo **** building following solution in ~~Debug~~ mode ****
@echo %1
@msbuild %1 /t:Rebuild /p:Configuration=Debug

@goto LABEL_END

@echo Before end
:LABEL_END
@echo Hit enter to exit
@pause
@exit

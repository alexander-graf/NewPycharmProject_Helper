@echo off

REM Ask for the project name
set /p projectName=Bitte geben Sie den Projektnamen ein: 

REM Create a new folder in the PyCharmProjects directory
set projectPath=%USERPROFILE%\PycharmProjects\%projectName%
mkdir "%projectPath%"

REM Change to the new folder
cd "%projectPath%"

REM Create and activate the virtual Python environment
python -m venv venv
call venv\Scripts\activate.bat

REM Update pip and install PySide6
python -m pip install --upgrade pip
pip install pyside6

REM Create the Python file in the project folder
set pythonFile=%projectPath%\%projectName%.py
echo. > "%pythonFile%"

REM Find the path to the PyCharm executable
for /r "%ProgramFiles%\JetBrains" %%G in (pycharm*.exe) do (
    set pycharmPath=%%G
    goto :found
)
:found

REM Open the project in PyCharm
start "" "%pycharmPath%" "%projectPath%"
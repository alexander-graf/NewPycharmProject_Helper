# Legt ein neues Projekt für Python an

# Nach dem Projektnamen fragen
$projectName = Read-Host -Prompt 'Geben Sie den Projektnamen ein:'

# Neuen Ordner im PyCharmProjects-Verzeichnis erstellen
$projectPath = Join-Path -Path "$env:USERPROFILE\PycharmProjects" -ChildPath $projectName
New-Item -ItemType Directory -Path $projectPath | Out-Null

# In den neuen Ordner wechseln
Set-Location -Path $projectPath

# Virtuelle Python-Umgebung erstellen und aktivieren
python -m venv venv
.\venv\Scripts\Activate.ps1

# Pip aktualisieren und PySide6 installieren
python.exe -m pip install --upgrade pip
pip install pyside6

# Python-Datei im Projektordner erstellen
$pythonFile = Join-Path -Path $projectPath -ChildPath "$projectName.py"
New-Item -ItemType File -Path $pythonFile | Out-Null

# Projekt in PyCharm öffnen
# Suche nach dem Pfad der PyCharm-Executable
$pycharmExe = Get-ChildItem -Path "$env:ProgramFiles\JetBrains" -Filter "pycharm*.exe" -Recurse | Select-Object -First 1

if ($pycharmExe) {
    $pycharmPath = $pycharmExe.FullName
    Write-Host "PyCharm gefunden: $pycharmPath"
}
else {
    Write-Host "PyCharm wurde nicht gefunden."
}

# Projekt in PyCharm öffnen
Start-Process -FilePath $pycharmPath -ArgumentList $projectPath

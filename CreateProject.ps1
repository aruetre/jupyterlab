Add-Type -AssemblyName System.Windows.Forms
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Selecciona una carpeta para el proyecto JupyterLab:"
$window = New-Object System.Windows.Forms.Form
$window.Topmost = $true
$window.ShowInTaskbar = $false
$folderBrowser.ShowDialog($window) | Out-Null
if ($folderBrowser.SelectedPath) {
    #Write-Host "Carpeta seleccionada: $($folderBrowser.SelectedPath)"
	Write-Output "$($folderBrowser.SelectedPath)"
}

<#
.SYNOPSIS
    Script renombrado de archivos.
.DESCRIPTION
    Script que renombra las imagenes con extensión *.jpg del directorio que se recibe como argumento.
.EXAMPLE
./Script_2 -Path "C:\Users\hecto\Documents\Test_Imagenes"
.PARAMETER Path
    Directorio donde se analizara los archivos para el proceso de renombrado.
.PARAMETER Directorio (Ruta absoluta)
    Especificar la ruta donde se analizan los ficheros.
#>

Param(
    [Parameter(Position=0, mandatory=$true, ParameterSetName="Path")]
    [String]$Path = "Path"
)

Write-Host "Se analizara el directorio: " $Path

Get-ChildItem $Path -Recurse -File -Include *.jpg | ForEach-Object {
    $hoy = Get-Date -Format "yyyyMMdd"
    Write-Host "El archivo $($_.Name) sera renombrado a $hoy-$($_.Name)"
    Rename-Item -Path $($_.FullName) -NewName "$hoy-$($_.Name)"
}

Write-Host "Termina la ejecucion del script"

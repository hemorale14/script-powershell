<#
.SYNOPSIS
    Script analisis de ficheros.
.DESCRIPTION
    Script que muestra un listado de los ficheros del directorio que se recibe como argumento y ocupen mas de 1024 bytes.
.EXAMPLE
./Script_1 -Path "C:\Users\hecto\Documents"
.PARAMETER Path
    Directorio donde se analizara el tamanio de archivo.
.PARAMETER Directorio (Ruta absoluta)
    Especificar la ruta donde se analizan los ficheros.
#>

Param(
    [Parameter(Position=0, mandatory=$true, ParameterSetName="Path")]
    [String]$Path = "Path"
)

Write-Host "Se analizara el directorio: " $Path

Get-ChildItem $Path -Recurse -File | ForEach-Object {
    if ($_.Length -ge 1024) {
        Write-Host "Archivo: $($_.FullName), Tamanio: $($_.Length)"
	}
}

Write-Host "Termina la ejecucion del script"

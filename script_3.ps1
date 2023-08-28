<#
.SYNOPSIS
    Script para consulta de estado en disco que cumplan una condicion.
.DESCRIPTION
    Script que cosulta la información de los discos del equipo que sean cumplan la condicion de de espacio en disco.
.EXAMPLE
./Script_3 -SizeGB "800"
.PARAMETER SizeGB
    Tamanio en GB para comparar con los discos del equipo.
.PARAMETER Tamanio a comparar en Disco (Valor en GB)
    Especificar el valor en GB.
#>

Param(
    [Parameter(Position=0, mandatory=$true, ParameterSetName="SizeGB")]
    [String]$SizeGB = "SizeGB"
)

Write-Host "Se realiza la obtencion de informacion de discos en el equipo donde los discos tengan un valor inferior a $SizeGB GB en espacio libre"
$SIZE_BYTES_IN_GB = 1000000000
$SizeB = [double]$SizeGB * $SIZE_BYTES_IN_GB
Get-WmiObject Win32_LogicalDisk | ForEach-Object {
    if ($_.FreeSpace -le $SizeB) {
        $EspacioLibreGB = [System.Math]::Floor($_.FreeSpace / $SIZE_BYTES_IN_GB)
        Write-Host "Unidad $($_.DeviceID) - espacio libre $EspacioLibreGB GB - Tamanio del disco $([System.Math]::Floor(($_.Size / $SIZE_BYTES_IN_GB)))"
    }
}

Write-Host "Termina la ejecucion del script"

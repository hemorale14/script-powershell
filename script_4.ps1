<#
.SYNOPSIS
    Script Menu.
.DESCRIPTION
    Script que muestra menu para realizar diferentes operaciones elegidas por el usuario.
.EXAMPLE
./Script_4
#>
Clear-Host
Write-Host @"
+===============================================+
|  POWERSHELL CONSOLE - MENU USUARIO            | 
+===============================================+
|    1. Listar los servicios arrancados.        |
|    2. Mostrar la fecha del sistema.           |
|    3. Ejecutar el Bloc de notas.              |
|    4. Ejecutar la Calculadora.                |
|    5. Salir.                                  |
+===============================================+
"@
function DisplayMenu {
    $MENU = Read-Host "Opcion"
    Switch ($MENU) {
        1 {
            #Opcion1 - Listar los servicios arrancados.
            Get-Service | Where-Object {$_.Status -eq "Running"}
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        2 {
            #Opcion2 - Listar los servicios arrancados.
            $fechaSistema = Get-Date -DisplayHint Date
            Write-Host "Fecha Sistema: $fechaSistema"
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        3 {
            #Opcion3 - Ejecutar el Bloc de notas.
            Start-Process notepad.exe
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        4 {
            #Opcion4 - Ejecutar la Calculadora.
            Start-Process calc.exe
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        5 {
            #OPCION5 - SALIR
            Write-Host "Saliendo del sistema"
            Break
        }
        default {
            #DEFAULT OPTION
            Write-Host "Opcion no disponible"
            Start-Sleep -Seconds 2
            DisplayMenu
        }
    }
}
DisplayMenu
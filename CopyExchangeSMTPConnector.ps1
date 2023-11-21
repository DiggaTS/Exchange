<#
    .SYNOPSIS
    copy recieve connector to an other server
    Johannes Schüler
    
    .DESCRIPTION
	  

    Revision History 
    -------------------------------------------------------------------------------- 
    1.0     Initial release 

    .PARAMETER connector
    The connector to copy
    
    .PARAMETER connector
    The Server of the destination 

    .EXAMPLE
    CopyExchangeSMTPConnector.ps1 recieveconnector newserver

    .\Purge-LogFiles -DaysToKeep 7 -Auto
#>
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
param(
    [string]$Connector=(Read-Host "Quellconnector Angeben"),
    [string]$DatabaseDestination=(Read-Host "Bitte Zielserver angeben")
)

(Get-ReceiveConnector -Identity "EX01-2016\SMTP relay").RemoteIPRanges | Sort-Object | Format-Table



New-ReceiveConnector -Name "SMTP relay" -Server "EX02-2016" -Usage Custom -TransportRole FrontEndTransport -PermissionGroups AnonymousUsers -Bindings 0.0.0.0:25 -RemoteIPRanges (Get-ReceiveConnector "EX01-2016\SMTP relay").RemoteIPRanges

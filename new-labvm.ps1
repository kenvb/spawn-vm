#Requires -RunAsAdministrator
#Requires -Modules Hyper-v
<#
.Synopsis
   Create VMs using differencing VHDs for lab purposes
.DESCRIPTION
  Create new Hyper-V machines, based on a sysprepped, ready VHD to quickly spawn multiple VMs for lab purposes.
.EXAMPLE
   import-csv "machines.csv" | .\new-labvm.ps1 | start-vm
   Using the default CSV-template, you create the VMs and inmediatly boot them up.
.EXAMPLE
   .\new-labvm.ps1 -VMName <string[]>
   .\new-labvm.ps1 -VMName bob,jef,lilly
   Creates 3 VM's, named bob, jef and lilly with default values
#>

[CMDLETBinding()]

param(   
    [Parameter(Mandatory=$true,
    Valuefrompipeline=$True,
    Valuefrompipelinebypropertyname=$true
    )]
    [string[]]$VMName,
    [Parameter(Mandatory=$false,
    Valuefrompipeline=$true,
    Valuefrompipelinebypropertyname=$true
    )]
    [string]$Sourcepath="E:\vms\Differentialclient\Differntialclient\Virtual Hard Disks\Differntialclient.vhdx",
    [Parameter(Mandatory=$false,
    Valuefrompipeline=$true,
    Valuefrompipelinebypropertyname=$true
    )]
    [string]$Memory="2048MB"
    )

BEGIN{
}

PROCESS{

    foreach($VM in $VMName)
    {
    $NewVHD= new-vhd -ParentPath $SourcePath -path E:\vms\$VM.vhdx -Differencing
    $NewVM = New-VM -Name "$VM" -VHDPath "E:\vms\$VM.vhdx" -MemoryStartupBytes 2048MB
    }
}
END{}
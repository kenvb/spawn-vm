#Requires -RunAsAdministrator
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
    [string[]]$Sourcepath="E:\vms\Differentialclient\Differntialclient\Virtual Hard Disks\differentialclient.vhdx"
    )

BEGIN{
}

PROCESS{
    foreach($VM in $VMName)
    {
        new-vhd -ParentPath $SourcePath -path E:\vms\$VM.vhdx -Differencing
        New-VM -Name "$VM" -VHDPath "E:\vms\$VM.vhdx" -MemoryStartupBytes 2048MB
        Start-VM -Name "$VM" 
    }
}
END{}
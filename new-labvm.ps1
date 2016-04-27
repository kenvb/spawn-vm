#Requires -RunAsAdministrator
[CMDLETBinding()]

param(   
    [Parameter(Mandatory=$true,
    Valuefrompipeline=$True,
    Valuefrompipelinebypropertyname=$true
    )]
    [string[]]$VMName
    )

BEGIN{
$SourcePath="E:\ProgramData\Microsoft\Windows\Hyper-V\Differentialclient\Differntialclient\Virtual Hard Disks\Differntialclient.vhdx"
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
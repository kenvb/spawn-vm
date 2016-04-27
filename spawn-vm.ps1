#Requires -RunAsAdministrator
1 |
foreach{
new-vhd -ParentPath "E:\ProgramData\Microsoft\Windows\Hyper-V\Differentialclient\Differntialclient\Virtual Hard Disks\Differntialclient.vhdx" -path E:\vms\Client$_.vhdx -Differencing
New-VM -Name "Client$_" -VHDPath "E:\vms\Client$_.vhdx" -MemoryStartupBytes 2048MB
Start-VM -Name "Client$_" 
}
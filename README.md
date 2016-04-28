"# spawn-vm" 
Create new Hyper-V machines, based on a sysprepped, ready VHD to quickly spawn multiple VMs for lab purposes, using differencing disks . 
Mre info on differencing disks: https://technet.microsoft.com/en-us/library/cc720381(v=ws.10).aspx

Summary:
- Create a new hyper-v Virtual Machine with a windows client of your choice.
- Load it up with the settings, software, patches you need.
- Add an unattend.xml for extra automation. Check my github for mine.
	Tutorial to make basic unattend.xml: https://support.software.dell.com/k2000-systems-deployment-appliance/kb/154057
- Run sysprep and shut the machine down
- Delete the VM from your Hyper-V manager. NOT THE VHDX-file !!!
- Use this VHDX file as your base for all your new lab VMs. Don't touch it again.
- Use this script to create new VMs using the differencing VHDX-mechanics.

get-help New-VM -ShowWindow

1..5 | 
    ForEach-Object
            {
            New-VM -Generation 2 -MemoryStartupBytes 
        

            }

            get-help new-vhd -ShowWindow

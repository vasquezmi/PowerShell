*move-vm.ps1*
================

move-vm.ps1 


Parameters
----------
```powershell


[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

Script Content
--------------
```powershell
$VMName = "windows"
Move-VM $VMName HOST2 -IncludeStorage -DestinationStoragePath "D:\VirtualMachines\$VMName"
exit 0 # success
```

*(generated by convert-ps2md.ps1 using the comment-based help of move-vm.ps1 as of 12/07/2023 20:24:20)*
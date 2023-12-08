*list-encrypted-files.ps1*
================

This PowerShell script scans a directory tree and lists all encrypted files.

Parameters
----------
```powershell
PS> ./list-encrypted-files.ps1 [[-path] <String>] [<CommonParameters>]

-path <String>
    Specifies the path to the directory tree (default is current working dir)
    
    Required?                    false
    Position?                    1
    Default value                "$PWD"
    Accept pipeline input?       false
    Accept wildcard characters?  false

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

Example
-------
```powershell
PS> ./list-encrypted-files.ps1 C:\Windows
...
✔️ Found 0 encrypted files within 📂C:\Windows in 41 sec

```

Notes
-----
Author: Markus Fleschutz | License: CC0

Related Links
-------------
https://github.com/fleschutz/PowerShell

Script Content
--------------
```powershell
<#
.SYNOPSIS
	Lists all encrypted files in a directory tree
.DESCRIPTION
	This PowerShell script scans a directory tree and lists all encrypted files.
.PARAMETER path
	Specifies the path to the directory tree (default is current working dir)
.EXAMPLE
	PS> ./list-encrypted-files.ps1 C:\Windows
	...
	✔️ Found 0 encrypted files within 📂C:\Windows in 41 sec
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

param([string]$path = "$PWD")

try {
	$stopWatch = [system.diagnostics.stopwatch]::startNew()

	$path = Resolve-Path "$path"
	Write-Progress "Scanning $path for encrypted files..."
	[int]$count = 0
	Get-ChildItem "$path" -attributes Encrypted -recurse | Foreach-Object {
		"📄$($_.FullName)"
		$count++
	}
	Write-Progress -completed " "
	[int]$elapsed = $stopWatch.Elapsed.TotalSeconds
	"✔️ Found $count encrypted files within 📂$path in $elapsed sec" 
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```

*(generated by convert-ps2md.ps1 using the comment-based help of list-encrypted-files.ps1 as of 12/07/2023 20:24:19)*
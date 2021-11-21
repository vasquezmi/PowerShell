﻿<#
.SYNOPSIS
	Closes the Edge browser
.DESCRIPTION
	This script closes the Microsoft Edge Web browser gracefully.
.EXAMPLE
	PS> ./close-edge-browser
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

TaskKill /im msedge.exe /f /t
if ($lastExitCode -ne "0") {
	& "$PSScriptRoot/speak-english.ps1" "Sorry, can't close Microsoft Edge"
	exit 1
}
exit 0 # success
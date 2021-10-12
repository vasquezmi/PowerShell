﻿<#
.SYNOPSIS
	Say the current time by text-to-speech
.DESCRIPTION
	This script speaks the current time by text-to-speech (TTS).
.EXAMPLE
	PS> ./say-time
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

try {
	[system.threading.thread]::currentthread.currentculture=[system.globalization.cultureinfo]"en-US"
	& "$PSScriptRoot/speak-english.ps1" "It's now $((Get-Date).ToShortTimeString())"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
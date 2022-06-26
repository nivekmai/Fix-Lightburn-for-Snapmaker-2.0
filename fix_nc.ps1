<#
    https://github.com/Snapmaker/Snapmaker2-Controller/commit/12c89a8ee99a712360e08004cfa645c3bc27a841
    Was an attempt to fix the firmware to work with inline power settings and the 10W laser.
    However, the code was misread and the commit was made which changes the way that the machine
    expects to get inline power commands.

    This script should fix the output file from lightburn to allow for it to run on SnapMaker machines
    which are running the firmware with the mistaken change.
#>
Param(
    [string]$input_path
) 

$output_path = $input_path.replace('.nc','') + ' - fixed.nc'

$inline = ((Get-Content $input_path) -replace 'M05', 'M05 I' | Select-String -Pattern 'M[789]' -NotMatch)

# Powershell scripts seem to drop the newlines when using Regex.replace, so temp swap for "-n" that we can swap for real newlines after using regex replace
$swap_newlines_for_chars_because_powershell_is_cool = $inline -replace '(?m)$', "-n"

# Only regex replace has the ability to replace only one occurence, so we need to use it instead
[regex]$pattern = "(?ms)(.*)M05 I(.*)"
$safe = $pattern.replace($swap_newlines_for_chars_because_powershell_is_cool, "`$1M05`$2", 1)

# Swap back in the newlines from our dirty hack above, yay
$out = $safe -replace '-n', "`r`n" -replace "(?m)^\s", ""

Set-Content -Encoding Ascii -Path $output_path -Value $out
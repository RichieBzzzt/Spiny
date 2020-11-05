Function Edit-SPModuleVersionNumber {
    [cmdletbinding()]
    param(
        [ValidateNotNullOrEmpty()]
        $ModuleVersionNumber,
        [ValidateNotNullOrEmpty()]
        $psd1File
    )

    $psd1File = [IO.Path]::GetFullPath($psd1File)
    $ModuleVersionNumber = $ModuleVersionNumber.Trim()
    if ((Test-Path $psd1File) -eq $false) {
        Write-Error "$psd1File does not exist!"
        throw "psd1miss"
    }
    $extn = [IO.Path]::GetExtension($psd1File)
    if ($extn -ne ".psd1" ) {
        Write-Error "$psd1File is not a psd1File!"
        Throw "notapsd1"
    }
    $psd1Name = Split-Path -Path $psd1File -Leaf
    if ((@( Get-Content $psd1File | Where-Object { $_.Contains("ModuleVersion") } ).Count) -eq 0) {
        Write-Error "ModuleVersionNumber element not found in $psd1Name!"
        Throw "NoModuleVersionNumber"
    }
    $RequiredModulesTrouble = Select-String -Pattern 'ModuleVersion(.*)' -Path $psd1File | Select-Object -First 1
    if ($RequiredModulesTrouble.line.Count -gt 1) {
        Write-Error "$psd1Name has more than one module version or has issues with RequiredModules"!
        Throw "RequiredModulesTrouble"
    }
    if (($ModuleVersionNumber -match "^(\d+\.)?(\d+\.)?(\*|\d+)$") -eq $false) {
        if (($ModuleVersionNumber -match "^(\d+\.)?(\d+\.)?(\d+\.)?(\*|\d+)$") -eq $false) {
            Write-Error "New ModuleVersion Number not in correct format; Expected ##.##.##(.##) , Actual $ModuleVersionNumber"
            Throw "WrongFormat"
        }
    }
    Write-Host "VersionNumber in $psd1Name will be $ModuleVersionNumber."
    
    try {
        $LineToUpdate = Select-String -Pattern 'ModuleVersion(.*)' -Path $psd1File | Select-Object -First 1
        (Get-Content $psd1File) -replace $LineToUpdate.line, "    ModuleVersion = '$ModuleVersionNumber'" | Set-Content $psd1File
        [string]$updatedModuleVersion = Get-Content $psd1File | Where-Object { $_ -match "ModuleVersion" } | Select-Object -First 1
        $updatedModuleVersion = $updatedModuleVersion.Trim()
        Write-Host "Updated to $updatedModuleVersion"
        Return $updatedModuleVersion
    }
    catch {
        Write-Error "Something went wrong in updating ModuleNumber."
        Throw $_.Exception
    }
}
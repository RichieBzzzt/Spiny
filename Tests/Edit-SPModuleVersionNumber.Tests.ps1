Set-Location $PSScriptRoot
Import-Module "..\Spiny.psm1" -Force
 

Describe "Update Module Version Number" {
    it "Can Update Module" {
        $psdFile = Resolve-Path "./file/SeaSalt.psd1"
        { Edit-SPModuleVersionNumber -ModuleVersionNumber "0.0.6" -psd1File $psdFile  } | Should -Not -Throw
    }

    it "Version Number Changes In File" {
        $psdFile = Resolve-Path "./file/SeaSalt.psd1"
        [string]$updatedModuleVersion = Get-Content $psdFile | Where-Object { $_ -match "ModuleVersion" } | Select-Object -First 1
        $updatedModuleVersion = $updatedModuleVersion.Trim()
        $updatedModuleVersion | Should -BeExactly "ModuleVersion = '0.0.6'"
        $moduleNumber = Edit-SPModuleVersionNumber -ModuleVersionNumber "0.0.7" -psd1File $psdFile
        $moduleNumber | Should -BeExactly "ModuleVersion = '0.0.7'"
    }

    it "Version Number Changes" {
        $psdFile = Resolve-Path "./file/SeaSalt.psd1"
        [string]$updatedModuleVersion = Get-Content $psdFile | Where-Object { $_ -match "ModuleVersion" } | Select-Object -First 1
        $updatedModuleVersion = $updatedModuleVersion.Trim()
        $updatedModuleVersion | Should -BeExactly "ModuleVersion = '0.0.7'"
        $moduleNumber = Edit-SPModuleVersionNumber -ModuleVersionNumber "0.0.7.1" -psd1File $psdFile
        $moduleNumber | Should -BeExactly "ModuleVersion = '0.0.7.1'"
    }

    it "Should Throw, Version Number Remains Unchanged" {
        $psdFile = Resolve-Path "./file/SeaSalt.psd1"
        [string]$updatedModuleVersion = Get-Content $psdFile | Where-Object { $_ -match "ModuleVersion" } | Select-Object -First 1
        $updatedModuleVersion = $updatedModuleVersion.Trim()
        $updatedModuleVersion | Should -BeExactly "ModuleVersion = '0.0.7.1'"
        {Edit-SPModuleVersionNumber -ModuleVersionNumber "0.0.7.h" -psd1File $psdFile} | Should -Throw
        $updatedModuleVersion = Get-Content $psdFile | Where-Object { $_ -match "ModuleVersion" } | Select-Object -First 1
        $updatedModuleVersion = $updatedModuleVersion.Trim()
        $updatedModuleVersion | Should -BeExactly "ModuleVersion = '0.0.7.1'"
    }
}

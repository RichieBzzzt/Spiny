Set-Location $PSScriptRoot
Import-Module "..\Spiny.psm1" -Force
$seaSalt = Resolve-Path "./SeaSalt"
 

Describe "Update Module Version Number" {
    it "Can Update Module" {
        { Publish-SPPackageToPowerShellGallery -apiKey "fakekey" -Path $seaSalt -whatif  } | Should -Not -Throw
    }

}

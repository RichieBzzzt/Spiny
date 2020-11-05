Set-Location $PSScriptRoot
Import-Module "..\Spiny.psm1" -Force
$seaSalt = Resolve-Path "./SeaSalt"
 

Describe "Update Module Version Number" {
    it "Can Update Module" {
        { Publish-SPPackageToPowerShellGallery -apiKey "fakekey" -Path $seaSalt -whatif } | Should -Not -Throw
    }

    it "Can Update Module" {
        $PublishModuleParams = @{
            LicenseUri  = "http://contoso.com/license"
            Tag         = "Active Directory", "DSC"
            ReleaseNote = "Updated the ActiveDirectory DSC Resources to support adding users."
        }
        { Publish-SPPackageToPowerShellGallery -apiKey "fakekey" -Path $seaSalt -PublishModuleParams $PublishModuleParams -whatif } | Should -Not -Throw
    }
    it "Throw on Dodgy Key" {
        {Publish-SPPackageToPowerShellGallery -apiKey "fakekey" -Path $seaSalt } | Should -Throw
    }
}
# Spiny
Publishes Modules to PowerShell Gallery And Optionally Updates Module Numbers

## Steps To Create a PowerShell Gallery Account and Get an API Key

If you haven't already, go to PowerShell Gallery and create an account.
1. Go to [PowerShell Gallery](https://www.powershellgallery.com/) and click 'Sign In'
2. Sign In with a Microsoft Account
3. Once you are signed in, create an [API Key](https://docs.microsoft.com/en-us/powershell/gallery/how-to/managing-profile/creating-APIkeys)

## Using In an Azure DevOps Pipeline

In somewhat of a circular reference, the module uses itself to publish new versions. This is the ultimate in DevOps!

```yaml
  - task: PowerShell@2
    condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
    displayName: "Publish to PowerShellGallery"
    inputs:
      targetType: "inline"
      script: |
        Install-Module Spiny -Scope CurrentUser -SkipPublisherCheck -Force -Verbose
        Import-Module Spiny -Force -Verbose
        $moduleNumber = Edit-SPModuleVersionNumber -ModuleVersionNumber $env:VERSIONNUMBER -psd1File $(Build.ArtifactStagingDirectory)\Spiny\Spiny.psd1
        Publish-SPPackageToPowerShellGallery `
        -apiKey '$(apikey)' `
        -path $(Build.ArtifactStagingDirectory)\Spiny
```
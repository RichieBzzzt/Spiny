Function Publish-SPPackageToPowerShellGallery {
    [cmdletbinding()]
    param(
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
        $apiKey,
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
        $path,
        [hashtable]$PublishModuleParams, 
        [switch] $whatif
    )
    $path = [IO.Path]::GetFullPath($path)
    if ($PSBoundParameters.ContainsKey('PublishModuleParams') -eq $false) {
        $PublishModuleParams = @{
            Path        = $path 
            NuGetApiKey = $apiKey
        }
    }
    else {
        $PublishModuleParams.Add('Path', $path)
        $PublishModuleParams.Add('NuGetApiKey', $path)
        $PublishModuleParams.Add('Force', $true)
    }
    if ((Get-Module -ListAvailable -Name PackageManagement) -eq $false) {
        Install-Module -Name PackageManagement -Scope CurrentUser -Force -AllowClobber
    } 
    if ($PSBoundParameters.ContainsKey('whatif') -eq $false) {
        Write-Host "Publishing module"
        Publish-Module @PublishModuleParams
    }
    else {
        $PublishModuleParams.Add('WhatIf', $true)

        Publish-Module @PublishModuleParams
    }
}
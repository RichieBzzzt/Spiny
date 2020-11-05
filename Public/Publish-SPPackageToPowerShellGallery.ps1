Function Publish-SPPackageToPowerShellGallery {
    [cmdletbinding()]
    param(
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
        $apiKey,
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
        $path, 
        [parameter(Mandatory = $false)]$nuGetPath,
        [hashtable]$PublishModuleParams, 
        [switch] $whatif
    )
    $path = [IO.Path]::GetFullPath($path)
    if ($PSBoundParameters.ContainsKey('PublishModuleParams') -eq $false) {
        $PublishModuleParams = @{
            Path = $path 
            NuGetApiKey = $apiKey
        }
    }
    else{
        $PublishModuleParams.Add('Path',$path)
        $PublishModuleParams.Add('NuGetApiKey', $path)
        $PublishModuleParams.Add('Force', $true)
    }
    if ($PSBoundParameters.ContainsKey('PublishModuleParams') -eq $false) {
        Write-Host " No value specified for NuGet Path. Am downloading."
        Install-SPNuget
    }
    Write-Host "Create NuGet package provider"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Install-PackageProvider -Name NuGet

    if ($PSBoundParameters.ContainsKey('whatif') -eq $false) {
        Write-Host "Publishing module"
        Publish-Module @PublishModuleParams
    }
    else {
        $PublishModuleParams.Add('WhatIf', $true)
        Publish-Module @PublishModuleParams
    }
}
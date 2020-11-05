Function Install-SPNuget {
    $nugetPath = "c:\nuget"
    if (!(Test-Path -Path $nugetPath)) {
        Write-Host "Creating directory $nugetPath"
        New-Item -Path $nugetPath -ItemType Directory -Force
    }
    Write-Host "Working Folder : $nugetPath"
    $NugetExe = "$nugetPath\nuget.exe"
    if (-not (Test-Path $NugetExe)) {
        Write-Host "Cannot find nuget at $NugetExe" 
        $NuGetInstallUri = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
        $sourceNugetExe = $NuGetInstallUri
        Write-Host "$sourceNugetExe -OutFile $NugetExe" 
        Invoke-WebRequest $sourceNugetExe -OutFile $NugetExe
        if (-not (Test-Path $NugetExe)) { 
            Throw "Nuget download hasn't worked."
        }
        Else { Write-Host "Nuget Downloaded!" }
    }
    Write-Host "Add $nugetPath as %PATH%"
    $pathenv = [System.Environment]::GetEnvironmentVariable("path")
    $pathenv = $pathenv + ";" + $nugetPath
    [System.Environment]::SetEnvironmentVariable("path", $pathenv)
}
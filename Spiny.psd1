@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'Spiny.psm1'

    # Version number of this module.
    ModuleVersion     = '0.1.0'

    # ID used to uniquely identify this module
    GUID              = '2177c1dd-6485-4999-80b5-3ebbb8f645e3'

    # Author of this module
    Author            = "Richie Lee"

    # Company or vendor of this module
    CompanyName       = ''

    # Copyright statement for this module
    Copyright         = 'Richie Lee 2020'

    # Description of the functionality provided by this module
    Description       = 'PowerShell module to Publish Modules to PowerShell Gallery And Optionally Updates Module Numbers See https://github.com/RichieBzzzt/Spiny/tree/main'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    #RequiredModules =  @('')

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @('')

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess  = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = ''

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = 'Edit-SPModuleVersionNumber','Publish-SPPackageToPowerShellGallery'

    # Cmdlets to export from this module
    # CmdletsToExport   = '*'

    # Variables to export from this module
    # VariablesToExport = '*'

    # Aliases to export from this module
    # AliasesToExport   = '*'

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    #PrivateData = @{} # End of PrivateData hashtable

    # HelpInfo URI of this module
    HelpInfoURI = 'https://github.com/RichieBzzzt/Spiny'

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}
configuration WindowsAdminCenter
{
    param
    (
        [System.String]
        $WacProductId = '{4FAE3A2E-4369-490E-97F3-0B3BFF183AB9}',
        
        [System.String]
        $WacDownloadPath = 'c:\WindowsAdminCenter1809.5.msi',

        [System.Int16]
        $Port = 6516,
    )

    Import-DscResource -ModuleName PSDscResources

    $wacInstallArguments = "/qn /l*v c:\windows\temp\windowsadmincenter.msiinstall.log SME_PORT=$Port SSL_CERTIFICATE_OPTION=generate"

    Node localhost
    {
        MsiPackage InstallWindowsAdminCenter
        {
            ProductId = $WacProductId
            Path      = $WacDownloadPath
            Arguments = $wacInstallArguments
            Ensure    = 'Present'
        }
    }
}

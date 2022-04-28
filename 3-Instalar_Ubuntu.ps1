Set-Location $env:userprofile\Downloads
$ProgressPreference = 'SilentlyContinue'

Workflow Baixar-Kernel{
    echo "Baixando o Kernel do WSL2"
    Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile wsl_update_x64.msi
}

Workflow Instalar-Kernel {
    echo "Instalando o Kernel do WSL2"
    Start-Process wsl_update_x64.msi -Wait
}

Workflow Alterar-Versao-WSL {
    echo "Alterando versão padrão do WSL"
    $null = wsl --set-default-version 2
    echo "--- A operação foi concluída com êxito"
}

Workflow Baixar-Ubuntu {
    echo "Baixando o Ubuntu"
    echo "--- Isso pode levar vários minutos. Não deixe o computador hibernar!"
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu -OutFile Ubuntu.appx -UseBasicParsing
}

Workflow Instalar-Ubuntu {
    echo "Instalado o Ubuntu"
    Add-AppxPackage $env:userprofile\Downloads\Ubuntu.appx
}

Workflow Verificar {
    echo "Verificando instalações"
    $Argumento = "$env:userprofile\Downloads\4-Verificar_WSL.ps1"
    Start-Process powershell -Args "Invoke-Expression -Command '$Argumento'" -Verb RunAs -Wait
}

Workflow Executar {
    Sequence {
        $Kernel_WSL = Get-ChildItem -Path $env:userprofile\Downloads\wsl_update_x64.msi -Recurse -Force -Depth 1 | Select-Object Name
        if ($Kernel_WSL -eq $null){
            Baixar-Kernel
            Instalar-Kernel
        }
        else{
            Instalar-Kernel
        }
        Alterar-Versao-WSL
        $Ubuntu_WSL = Get-ChildItem -Path $env:userprofile\Downloads\Ubuntu.appx -Recurse -Force -Depth 1 | Select-Object Name
        if ($Ubuntu_WSL -eq $null){
            Baixar-Ubuntu
            Instalar-Ubuntu
        }
        else{
            Instalar-Ubuntu
        }
        Verificar
    }
}

Executar
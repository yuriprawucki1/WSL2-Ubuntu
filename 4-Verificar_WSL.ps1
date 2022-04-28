# Verifica instala��o do WSL
if ((Get-WindowsOptionalFeature -FeatureName "Microsoft-Windows-Subsystem-Linux" -Online).State -eq "Enabled"){
    echo "============================================="
    echo "WSL Instalado"
    }
    else{
    echo "============================================="
    echo "WSL N�o Instalado"
}

# Verifica instala��o da Plataforma de Virtualiza��o
if ((Get-WindowsOptionalFeature -FeatureName "VirtualMachinePlatform" -Online).State -eq "Enabled"){
    echo "============================================="
    echo "Plataforma de Virtualiza��o Instalada"
    }
    else{
    echo "============================================="
    echo "Plataforma de Virtualiza��o N�o Instalada"
}

# Verifica instala��o do Ubuntu
echo "============================================="
if ((ls 'C:\Program Files\WindowsApps\' | where Name -Like CanonicalGroupLimited.Ubuntu* | where Name -Like *_x64__* | Format-List Name) -ne ""){
    echo "Ubuntu Instalado"
    echo "--- Agora abra o Ubuntu para inicializar"
    }
    else{
    echo "Ubuntu N�o Instalado"
}
echo "============================================="

pause
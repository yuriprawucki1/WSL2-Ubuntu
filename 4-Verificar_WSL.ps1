# Verifica instalação do WSL
if ((Get-WindowsOptionalFeature -FeatureName "Microsoft-Windows-Subsystem-Linux" -Online).State -eq "Enabled"){
    echo "============================================="
    echo "WSL Instalado"
    }
    else{
    echo "============================================="
    echo "WSL Não Instalado"
}

# Verifica instalação da Plataforma de Virtualização
if ((Get-WindowsOptionalFeature -FeatureName "VirtualMachinePlatform" -Online).State -eq "Enabled"){
    echo "============================================="
    echo "Plataforma de Virtualização Instalada"
    }
    else{
    echo "============================================="
    echo "Plataforma de Virtualização Não Instalada"
}

# Verifica instalação do Ubuntu
echo "============================================="
if ((ls 'C:\Program Files\WindowsApps\' | where Name -Like CanonicalGroupLimited.Ubuntu* | where Name -Like *_x64__* | Format-List Name) -ne ""){
    echo "Ubuntu Instalado"
    echo "--- Agora abra o Ubuntu para inicializar"
    }
    else{
    echo "Ubuntu Não Instalado"
}
echo "============================================="

pause
Workflow Instalar-WSL {
    echo "Instalando o WSL"
    Start-Process Dism.exe -Args "/online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart" -Verb RunAs -Wait -WindowStyle Hidden
}

Workflow Instalar-VMP {
    echo "Instalando a Plataforma de Virtualização"
    Start-Process Dism.exe -Args "/online /enable-feature /featurename:VirtualMachinePlatform /all /norestart" -Verb RunAs -Wait -WindowStyle Hidden
}

Workflow Executar {
    Sequence {
        Instalar-WSL
        Instalar-VMP
        Restart-Computer -Wait
    }
}

Executar
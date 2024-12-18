#!/usr/bin/env python3

# ================================
#  _   _        _               
# | \ | |  /\  | |  ✩₊˚.⋆☾⋆⁺₊✧           
# |  \| | /  \ | |_   _  _    
# | . ` |/ /\ \| | | | |/ _ \   
# | |\  / __ \ | || |  _/   
# || \//    \\,|\|  
#                              
#     🦋 Script by Natania 🦋     
# ================================      
#        🦋 With Meongg 🦋     
# ================================

import paramiko

def configure_switch(ip, username, password):
    commands = [
        "enable",
        "configure terminal",
        "vlan 10",
        "exit",
        "interface Ethernet0/0",
        "switchport mode trunk",
        "switchport trunk allowed vlan 10",
        "exit",
        "interface Ethernet0/1",
        "switchport mode access",
        "switchport access vlan 10",
        "exit",
        "end",
        "write memory"
    ]

    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(ip, username=username, password=password)

    shell = ssh.invoke_shell()
    for cmd in commands:
        shell.send(cmd + '\n')
        time.sleep(1)

    ssh.close()
    print(f"Konfigurasi switch {ip} selesai.")

# Ganti IP, username, dan password sesuai kebutuhan
configure_switch("192.168.16.2", "admin", "cisco")
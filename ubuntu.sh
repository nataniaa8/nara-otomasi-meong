#!/bin/bash

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

echo "=============================================="
echo "   🦋 Welcome to Natania's Automation 🦋   "
echo "=============================================="
echo "Konfigurasi Ubuntu Server dimulai..."

# Pasang DHCP server
apt update && apt install -y isc-dhcp-server

# Konfigurasi VLAN dan IP
cat <<EOF > /etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: true
    eth1:
      addresses: []
  vlans:
    eth1.10:
      id: 10
      link: eth1
      addresses:
        - 192.168.16.1/24
EOF

netplan apply

# Konfigurasi DHCP server
cat <<EOF > /etc/dhcp/dhcpd.conf
subnet 192.168.16.0 netmask 255.255.255.0 {
  range 192.168.16.10 192.168.16.100;
  option routers 192.168.16.1;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
}
EOF

systemctl restart isc-dhcp-server
echo "[Natania] VLAN and network configuration applied."
echo "🎉 Otomasi selesai oleh Natania bersama meong!"
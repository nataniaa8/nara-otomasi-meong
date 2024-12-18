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
echo "Konfigurasi Mikrotik dimulai..."

# Konfigurasi interface
curl -u admin:admin -X POST http://192.168.16.3/rest/ip/address -d '{"address": "192.168.16.2/24", "interface": "ether1"}'
curl -u admin:admin -X POST http://192.168.16.3/rest/ip/address -d '{"address": "192.168.200.1/24", "interface": "ether2"}'

# Konfigurasi DHCP server
curl -u admin:admin -X POST http://192.168.16.3/rest/ip/dhcp-server -d '{"name": "dhcp2", "interface": "ether2", "lease-time": "1d", "address-pool": "192.168.200.10-192.168.200.100"}'

echo "🎉 Konfigurasi Mikrotik selesai oleh Natania bersama meong!"
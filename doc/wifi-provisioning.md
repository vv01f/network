# Provisionierung eines WLAN-Routers

Sofern der Router durch uns provisioniert wird (ansonsten siehe unten)

1.  Kontaktdaten und Dosennummer in `contacts.md` vermerken
2.  Nachbar will Privatnetz?
   
   1. privX allokieren
   2. `privX-gw` in `salt-pillar/lxc-containers` anlegen
   3. `salt server1 state.apply lxc-containers`
   4. `salt-key -A`
   5. `salt privX-gw state.apply`
   
3.  AP provisionieren in `salt-pillar/cpe/aps`
    
    1. Frisches OpenWRT/LEDE? `firstboot: True`
    2. Feld `model`
    3. Feld `location`
    4. LAN-Dosen in `lan-access` auf *privX* legen
    5. WLANs anpassen:
        1. SSID festlegen
        2. `net` auf *privX*
        3. `psk` vom Benutzer eingeben lassen, verschlüsselt
           abspeichern
    6. Kanäle je nach Umgebung des Nachbars optimieren
    7. `salt server1 state.apply cpe`
    8. `/root/apX.sh` zum Anwenden des Konfigurationsskripts
    9. Wenn Fehler gezeigt werden (entry not found ist nicht schlimm, invalid schon!) dann "commit" entfernen und den Fehler suchen.
    
4.  Switch-Port konfigurieren in `salt-pillar/switches`

    1. Switch raussuchen, z.B. *switch-b1* oder *switch-b2* im Haus B
    2. Eintrag `apX` anlegen
    3. `mode: trunk`
    4. Der Port in welchen das Kabel gesteckt wird kommt unter `ports:`
    5. `vlans:` immer *mgmt* und *pub*, auch das *privX*
    6. `salt server1 state.apply switches`
    7. `/root/switch-X.sh` zum Anwenden des Konfigurationsskripts

Wenn wir nicht provisionieren, sondern ein mitgebrachter Router verwendet wird:
* kein ZW public konfigurieren!
* bridge-mode verwenden, dhcpd aus
* wenn vlan möglich: switchport mode auf "trunk"; wenn vlan nicht möglich: switchport mode auf "access"

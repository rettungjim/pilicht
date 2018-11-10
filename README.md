# pilicht
Steuerung Licht an/aus nach Sonnenauf- und Untergang inkl eines Offsets in Sekunden.

Relais an GPIO 21 auf einem RaspberryPi v3

Verwendetes Relais:
https://www.reichelt.de/entwicklerboard-relais-modul-2-channel-5-v-debo-relais-2ch-p242810.html?PROVID=2788&gclid=EAIaIQobChMIrrT_wJ7J3gIV2eWaCh1uDwVVEAQYASABEgLbG_D_BwE&&r=1

# arguments

-d Aktiviert Debug Ausgaben

-om Offset + in Sekunden Sonnenaufgang (Licht bleibt länger an)

-oa Offset - in Sekunden Sonnenuntergang (Licht geht früher an)

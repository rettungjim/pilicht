#!/usr/bin/env python3

from ephem import *
import sys

mycity='Dusseldorf'
state = 'rising'

here=city(mycity)

if sys.argv[1]==state:
    print(here.next_rising(Sun()))
if sys.argv[1]!=state:
    print(here.next_setting(Sun()))


# civil twilight: centre of sun is -6
#here.horizon='-6'
#print(here.next_rising(Sun(),use_center=True))
#print(here.next_setting(Sun(),use_center=True))

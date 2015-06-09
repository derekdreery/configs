#!/bin/bash
/usr/bin/alsa_out -j "Secondry card (Realtek)" -d hw:1,0 &
/usr/bin/alsa_in -j "Secondry card (Realtek)" -d hw:1,0 &
/usr/bin/alsa_out -j "Secondry card (Yeti)" -d hw:3,0 &
/usr/bin/alsa_in -j "Secondry card (Yeti)" -d hw:3,0 &

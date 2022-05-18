#!/bin/bash

pikaur -Sy system76-power
sudo systemctl enable --now system76-power
sudo system76-power graphics integrated
pikaur -S auto-cpufreq
sudo systemctl enable --now auto-cpufreq

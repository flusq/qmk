@echo off

cd %~dp0

bash -c "cd ../../ && export NRFSDK12_ROOT=/mnt/c/SDK/nRF5_SDK_12.3.0_d7731ad && make nyquist_nrf52832/master" || exit

cd ..\..\.build

set file=nyquist_nrf52832_master_default.hex


set port=COM8

set path=C:\SDK\gcc-arm-none-eabi-8-2018-q4-major-win32\bin;%path%
arm-none-eabi-gdb.exe --quiet --batch -ex "target extended-remote \\.\%port%" -ex "mon swdp_scan" ^
-ex "file %file:\=/%" -ex "att 1" -ex load -ex run



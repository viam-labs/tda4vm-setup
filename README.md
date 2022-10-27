# tda4vm-setup
repo to assist in setting up viam on a ti tda4vm

1. install the linux image to the sd card as per https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-sk-tda4vm/latest/exports/docs/getting_started.html#preparing-sd-card-image
2. clone this repo or copy `tda4vm-viam-setup.sh` to the board, once it boots up
3. `chmod +x tda4vm-viam-setup.sh`
4. `./tda4vm-viam-setup.sh`
5. after the script finishes running (and the board reboots as a result), copy the viam-server config from your robot page on app.viam.com and place it in `/etc/viam.json`
6. `systemctl restart viam-server`

viam-server should be up and running and you can now configure your robot on app.viam.com
a good starting point would be to add a component of type `board` with model `ti`. this will give you remote access to the board, enabling you to set gpio pins via the webUI or our SDKs.

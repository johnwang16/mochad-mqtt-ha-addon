#!/usr/bin/with-contenv bashio

declare host
declare password
declare port
declare username
declare secondary_host
declare secondary_password
declare secondary_port
declare secondary_username


    host=$(bashio::services "mqtt" "host")
    password=$(bashio::services "mqtt" "password")
    port=$(bashio::services "mqtt" "port")
    username=$(bashio::services "mqtt" "username")


#cat /data/options.json
cp -f /data/options.json /mochad-mqtt.json
sed -i -n '/{/{N/"name":/D}p' /mochad-mqtt.json
sed -i '/"name":/{s/,/:{/}' /mochad-mqtt.json
sed -i 's/"name"://' /mochad-mqtt.json
sed -i 's/\[//' /mochad-mqtt.json
sed -i 's/],//' /mochad-mqtt.json
sed -i 's/]//' /mochad-mqtt.json
sed -i 's/"devices":/"devices": {/' /mochad-mqtt.json
sed -i 's/"mqtt":/},\n   "mqtt":/' /mochad-mqtt.json
sed -i 's/"mochad":/,\n   "mochad":/' /mochad-mqtt.json
sed -i 's/"hass":/,\n   "hass":/' /mochad-mqtt.json
sed -i -n '/"log_level"/{d}p' /mochad-mqtt.json



sed -i "s/\"host\": \"xxxxxxxx\"/\"host\": \"$host\"/" /mochad-mqtt.json
sed -i "s/\"user\": \"xxxxxxxx\"/\"user\": \"$username\"/" /mochad-mqtt.json
sed -i "s/\"password\": \"xxxxxxxx\"/\"password\": \"$password\"/" /mochad-mqtt.json
sed -i "s/\"port\": \"xxxxxxxx\"/\"port\": \"$port\"/" /mochad-mqtt.json
sed -i "s/\"secondary_host\": \"xxxxxxxx\"/\"secondary_host\": \"$secondary_host\"/" /mochad-mqtt.json
sed -i "s/\"secondary_user\": \"xxxxxxxx\"/\"secondary_user\": \"$secondary_username\"/" /mochad-mqtt.json
sed -i "s/\"secondary_password\": \"xxxxxxxx\"/\"secondary_password\": \"$secondary_password\"/" /mochad-mqtt.json
sed -i "s/\"secondary_port\": \"xxxxxxxx\"/\"secondary_port\": \"$secondary_port\"/" /mochad-mqtt.json


#cat /mochad-mqtt.json

perl /mochad-mqtt.pl


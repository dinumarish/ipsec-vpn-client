# Docker IPSEC L2TP VPN client
Docker earley-stage image to run an IPsec VPN client, with IPsec/L2TP, based on : https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients.md

## HOW TO
After cloning the repo build docker image with the command

``docker build -t xl2tpd-client .``

In order to run the container the following environment variables need to be passed:

* `VPN_IPSEC_PSK`, `VPN_USER`, `VPN_PASSWORD` provided from your VPN provider
* the provider's IP is passed as `VPN_PUBLIC_IP` 
* and the local host ip should be passed as well, named `VPN_LOCAL_IP`

Then container launch would look like:

``docker run -it --rm --name=ipsec-vpn-client -e "VPN_IPSEC_PSK=presharedkey" -e "VPN_USER=username" -e "VPN_PASSWORD=password" -e "VPN_PUBLIC_IP=ipaddressofvpnserver" --privileged  xl2tpd-client``

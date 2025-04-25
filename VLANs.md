# <center> Virtual Local Area Network (VLAN) </center>

## What is LAN?

- LAN is a group of devices (PCs, servers, routers, switcher, etc) in a single location (home, office, etc).
- A more specific definition: A LAN is a single **broadcast domain**, including all devices in that broadcast domain.
    - A **broadcast domain** is the group of devices which will receive a broadcast frame (destinantion MAC FFFF.FFFF.FFFF) sent by any one of the members. 

![LAN images](.medias/vlan/lan.png)

## What is a VLAN?

- it's essentially a way to logically split up a layer 2 broadcast domain, to make multiple separate broadcast domains

VLANs...

- are configured on switches on a per-interface basis
- **logically** separate end hosts at layer 2.


>  📝 Switches do not forward traffic directly between hosts in different VLANs

## What is the purpose of VLANa?

- **Network performance**: helps to reduce unnecessary broadcast traffic, which helps prevent network congestion and improve network performance

- **Network Security**: limiting broadcast and unknown unicast traffic also improves network security since these messages won't be received by devices outside of the VLAN.

## VLAN configuration

![basic vlan cofiguration](.medias/vlan/vlanconf.png)

```cli
show vlan brief
interface range g1/0 - 3
switchport mode access
switchport access vlan 10
```

- An access port is a switchport which belongs to a single VLAN, and usually connects to end hosts like PCs.
- Switchports which carry multiple VLANs are called **trunk ports**. 


```
# manually create and name VLANs

vlan 10
name Engineering
vlan 20
name HR
```

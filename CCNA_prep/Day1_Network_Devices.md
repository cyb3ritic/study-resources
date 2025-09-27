## What is a network?
A computer network is a digital telecommunications network which allows nodes to share resources.

## Network devices
![Network Devices](./ccna_prep_medias/network_devices.png)
- **switch**: 
    - have many network interfaces/ports for end hosts to connect to (usually 24+),
    - provide connectivity to hosts within the same LAN (Local Area Network),
    - do not provide connectivity between LANs/over the internet.
    - examples: Catalyst 9200, Catalyst 3650.
- **router**:
    - have fewer network interfaces than switches,
    - are used to provide connectivity between LANs,
    - are therefore used to send data over the internet.
    - examples: ISR 100, ISR 900, ISR 4000

- **firewalls**:
    - monitor and control network traffic based on configured rules, 
    - can be placed 'inside' the network, or 'outside' the network,
    - are known as 'Next-Generation Firewalls' when they include moderns and advanced filtering capabilities.
    - Types:
        - Network Firewalls: Hardware devices that filter traffic between networks.
        - Host-based Firewalls: Software applications that filter traffic entering and exiting a host machine, like a PC.
    - examples: ASA5500-X, Firepower 2100, Windows Firewall

- **server**: A device that provides functions or services for clients.
- **client**: A device that access a service made available by a server.

- **hubs**:
    - Outdated devices used to connect hosts in a LAN, now replaced by switches.
    - When they receive a signal on one port, they repeat it out all other ports.
    - This creates a single 'collision domain', meaning if two devices send data at the same time, the data will collide and become corrupted. This is very inefficient.

- **access points (APs)**:
    - Allow wireless devices (e.g., laptops, smartphones) to connect to the network.
    - They are to a WLAN (Wireless Local Area Network) what a switch is to a LAN.

- **endpoints**:
    - Devices that are the source or destination of a communication.
    - This includes user devices like PCs, laptops, and smartphones, as well as servers, printers, and IoT devices.

## Key Concepts
- **Collision Domain**: A section of a network where data packets can collide. All ports on a hub are in the same collision domain. Each port on a switch is its own separate collision domain, which is why switches are much more efficient than hubs.

- **Broadcast Domain**: A section of a network where a broadcast frame (a message sent to all devices) is forwarded. A LAN (and therefore all ports on a switch) is typically a single broadcast domain. Routers are used to separate broadcast domains.

## Quiz Questions
1. Your Company wants to purchase some network hardware to which they can plug the 30 PCs in your department. Which type of network device is appropriate?

    - [ ] a. A router  
    - [ ] b. A firewall  
    - [ ] c. A switch  
    - [ ] d. A server

    <details>
    <summary>Show Answer</summary>
    ✅ c. A switch
    </details>


2. You received a video file from your friend's Apple iPhone using AirDrop. What was his iPhone functioning as in that transaction?
    - [ ] a. A server
    - [ ] b. A client
    - [ ] c. A local area network

    <details>
    <summary>Show Answer</summary>
    ✅ a. A server
    </details>

3. What is your computer or smartphone functioning as while you watch this video?
    - [ ] a. A server
    - [ ] b. An end host
    - [ ] c. A client

    <details>
    <summary>Show Answer</summary>
    ✅ c. A client
    </details>

4. Your company wants to purchase some network hardware to connect its separate networks together. What kind of network device is appropriate?
    - [ ] a. A firewall  
    - [ ] b. A host  
    - [ ] c. A LAN  
    - [ ] d. A router

    <details>
    <summary>Show Answer</summary>
    ✅ d. A router
    </details>

5. YOur company wants to upgrade its old network firewall that has been in use for several years to one that provides more advanced functions. What kind of firewall should they purchase?
    - [ ] a. A host-based firewall  
    - [ ] b. A next-level firewall  
    - [ ] c. A next-generation firewall  
    - [ ] d. A top-layer firewall

    <details>
    <summary>Show Answer</summary>
    ✅ c. A next-generation firewall
    </details>
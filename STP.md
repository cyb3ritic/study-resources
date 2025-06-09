# 🌐 Spanning Tree Protocol (STP) Cheat Sheet

## 🛡️ What is STP?

**Spanning Tree Protocol (STP)** is a Layer 2 protocol (IEEE 802.1D) that prevents network loops in Ethernet networks by selectively blocking redundant paths. It ensures a loop-free topology while providing redundancy.

---

## 🏗️ Why Do We Need STP?

- **Redundancy** is vital for high availability in networks.
- Without STP, redundant links can cause **broadcast storms** and **MAC address flapping**.
- STP automatically disables redundant paths, activating them only if the primary path fails.

---

## 🚨 Problems Without STP

- **Broadcast Storms:** Ethernet frames loop endlessly, congesting the network.
- **MAC Address Flapping:** Switches constantly update MAC tables due to looping frames, causing instability.

![Broadcast Storm](./.medias/stp/broadcast_storms.png)

---

## 🔄 How STP Works

1. **Elects a Root Bridge** (the central switch in the topology).
2. **Calculates the shortest path** from all switches to the root bridge.
3. **Designates ports** as either:
   - **Forwarding:** Actively passing traffic.
   - **Blocking:** Preventing loops by not forwarding user traffic.

---

## 🏆 STP Election Process

### 1. Root Bridge Election

- All switches send BPDUs (Bridge Protocol Data Units).
- The switch with the **lowest Bridge ID** becomes the **Root Bridge**.
- All ports on the Root Bridge are **Designated Ports** (forwarding).

### 2. Root Port Selection (on non-root switches)

- Each switch selects **one Root Port** (the port with the lowest cost path to the Root Bridge).
- Selection criteria:
  1. **Lowest root path cost**
  2. **Lowest neighbor Bridge ID**
  3. **Lowest neighbor Port ID**

### 3. Designated Port Selection (per collision domain)

- In each segment, one port is the **Designated Port** (forwarding).
- The other port(s) become **Non-Designated** (blocking).
- Selection criteria:
  1. **Lowest root path cost**
  2. **Lowest Bridge ID**

---

## 📝 STP Port Roles

| Role              | Description                                      |
|-------------------|--------------------------------------------------|
| Root Port         | Best path to the root bridge (one per switch)    |
| Designated Port   | Best path for a segment (one per collision domain)|
| Non-Designated    | Blocks traffic to prevent loops                  |

---

## ⚡ STP Cost Table

| Speed     | STP Cost |
|-----------|----------|
| 10 Mbps   | 100      |
| 100 Mbps  | 19       |
| 1 Gbps    | 4        |
| 10 Gbps   | 2        |

---

## 🕒 STP Timers

- **Hello Time:** 2 seconds (default)
- **Forward Delay:** 15 seconds
- **Max Age:** 20 seconds

---

## 💡 Best Practices & Tips

- Always enable STP on networks with redundant links.
- Monitor for **topology changes** (can cause brief outages).
- Use **Rapid STP (RSTP, 802.1w)** for faster convergence in modern networks.

---

## 🔗 References

- [Cisco STP Overview](https://www.cisco.com/c/en/us/support/docs/lan-switching/spanning-tree-protocol/5234-5.html)
- [Wikipedia: Spanning Tree Protocol](https://en.wikipedia.org/wiki/Spanning_Tree_Protocol)

---

> **Summary:**  
> STP is essential for preventing Layer 2 loops, ensuring network stability, and providing redundancy. Understand the election process, port roles, and cost calculation for effective troubleshooting and design.


# Home network
The network layer underneath the cluster: why the lab has its own network, and the bridge Pi fallback for when the wall Ethernet is down. Router and switch hardware is listed in the [hardware README](README.md#networking).

## ISP
My current ISP Gigstreem seems to work in the whole building seamlessly with same SSID in my apartment and all around the amenities of the building. I believe households are on separate VLANs, but it still seems people are assigned IPs on same subnet. It obscures how I find and interact with other local devices on my network. The IP allocations are dynamic and out of my control. I therefore wanted to add another layer with my separate wifi network & VLANs

## Bridge Pi: Wi-Fi to Ethernet NAT router (AI summarized)
> Not in use since 2026-10: the wall Ethernet works again and the router plugs straight into it. The Pi is stored away - this guide is how to bring it back if the wall jack drops out.

This guide configures a Raspberry Pi to act as a NAT router. It connects to an existing Wi-Fi network to get internet and shares that connection via its Ethernet port. This method creates a new, private sub-network, making it highly compatible with restrictive networks that may have "Client Isolation" enabled.

The final setup will have three distinct networks:
1.  **The Upstream Wi-Fi Network:** (e.g., `x.x.x.x`) - The source of the internet.
2.  **The Pi-to-Router Link Network:** `192.168.10.x` - A private link between the Pi and your router's WAN port.
3.  **Your Router's LAN:** (e.g., `10.10.0.x`) - The network your router creates for your end devices.

---

### Step 1: Initial System Setup and Wi-Fi Connection

Before you begin, ensure your Raspberry Pi is up to date and connected to your upstream Wi-Fi network.

1.  **Update Your System:**
    ```bash
    sudo apt-get update
    sudo apt-get upgrade -y
    ```
2.  **Connect to Wi-Fi:**
    Use the built-in configuration tool.
    ```bash
    sudo raspi-config
    ```
    Navigate to `System Options` > `Wireless LAN`, enter your Wi-Fi SSID and password, and finish. Reboot if necessary. Verify you have an internet connection with `ping -c 4 1.1.1.1`.

---

### Step 2: Configure a Static IP for the Ethernet Port

Assign a static IP to the Pi's Ethernet port (`eth0`) to act as the gateway for your downstream router.

1.  **Edit the DHCP Client Daemon Configuration:**
    This command appends the static IP configuration for `eth0` to the main configuration file.
    ```bash
    sudo tee -a /etc/dhcpcd.conf > /dev/null <<EOF

    # Configuration for eth0 as a router gateway
    interface eth0
    static ip_address=192.168.10.1/24
    nohook wpa_supplicant
    EOF
    ```
2.  **Apply the New Configuration:**
    ```bash
    sudo systemctl restart dhcpcd
    ```
    Verify the change with `ip addr show eth0`. You should see `inet 192.168.10.1/24`.

---

### Step 3: Install and Configure DHCP/DNS Server (dnsmasq)

Install and configure `dnsmasq` to automatically provide an IP address to whatever device is plugged into the Ethernet port.

1.  **Install dnsmasq:**
    ```bash
    sudo apt-get install dnsmasq -y
    ```
2.  **Create a New Configuration File:**
    This configuration tells `dnsmasq` how to manage the `eth0` network. We will use Cloudflare for upstream DNS.
    ```bash
    sudo tee /etc/dnsmasq.d/router.conf > /dev/null <<EOF
    # Only listen for requests on the Ethernet interface
    interface=eth0
    bind-interfaces

    # Set upstream DNS servers to Cloudflare
    server=1.1.1.1
    server=1.0.0.1

    # Define the IP range for DHCP leases
    dhcp-range=192.168.10.100,192.168.10.150,12h

    # Provide the router (gateway) address to clients
    dhcp-option=option:router,192.168.10.1

    # Provide the DNS server address to clients
    dhcp-option=option:dns-server,192.168.10.1
    EOF
    ```
3.  **Start and Enable the dnsmasq Service:**
    ```bash
    sudo systemctl start dnsmasq
    sudo systemctl enable dnsmasq
    ```

---

### Step 4: Enable Internet Routing (NAT)

Configure the Linux kernel to forward traffic and add a firewall rule to perform the Network Address Translation (NAT).

1.  **Install `iptables`:**
    The core firewall tool may not be installed by default.
    ```bash
    sudo apt-get install iptables -y
    ```
2.  **Enable Kernel IP Forwarding:**
    Create a configuration file to enable packet forwarding.
    ```bash
    echo "net.ipv4.ip_forward=1" | sudo tee /etc/sysctl.d/99-nat-forward.conf
    ```
3.  **Apply the Kernel Changes:**
    Load the new setting from all system configuration files.
    ```bash
    sudo sysctl --system
    ```
4.  **Create the NAT Rule in the Firewall:**
    This rule tells the Pi to rewrite traffic from the Ethernet port (`eth0`) so it appears to come from the Pi's Wi-Fi port (`wlan0`).
    ```bash
    sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
    ```
5.  **Save the Firewall Rule Permanently:**
    Install `iptables-persistent` to save the rule and ensure it's re-applied after every reboot.
    ```bash
    sudo apt-get install iptables-persistent -y
    ```
    During the installation, a blue pop-up screen will appear. When prompted to save current IPv4 rules, select **`<Yes>`**. Do the same for the IPv6 rules prompt.

---

### Completion

Your Raspberry Pi is now a fully functional NAT router. You can connect your Ubiquiti Dream Router (or any other device) to the Pi's Ethernet port. It will be assigned an IP address (e.g., `192.168.10.100`) and have full internet access.

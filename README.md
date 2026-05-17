# Ubuntu VMware Setup and PuTTY SSH Access And Wazuh setup in ubuntu server


## Quick Workflow Overvie

| No. | Step | What to do |
| --- | --- | --- |
| 1 | Ubuntu ISO | Download Ubuntu 22.04 LTS AMD64 ISO from an official Ubuntu source. |
| 2 | VMware VM | Create a new Typical VM, install OS later, Linux/Ubuntu, 20 GB disk. |
| 3 | ISO and Hardware | Attach ISO under CD/DVD, set RAM/CPU as needed, power on VM. |
| 4 | Install Ubuntu | Language, keyboard, network, storage, user profile, OpenSSH Server, reboot. |
| 5 | Find IP | Log in to Ubuntu and run `ip a` or `hostname -I` to get the VM IP address. |
| 6 | PuTTY | Download PuTTY, enter VM IP, SSH port 22, login with Ubuntu credentials. |
| 7 | Wazuh | Ubuntu GUI setup and Wazuh setup|

## Useful Ubuntu Commands

```bash
# Show IP address
ip a
hostname -I

# Check SSH server status
sudo systemctl status ssh

# Install SSH server if it was not selected during setup
sudo apt update
sudo apt install openssh-server -y
sudo systemctl enable --now ssh
```

## 1. Download Ubuntu ISO

Open a browser and search for Ubuntu 22.04 LTS. Use an official Ubuntu release page or `releases.ubuntu.com`.

From the release directory, download the desktop or server AMD64 ISO file. The screenshots show Ubuntu 22.04.5 LTS AMD64 ISO selected for the VM.



![Google search result for Ubuntu 22.04 LTS Jammy Jellyfish download page](01_ubuntu_google_search_result.png)
**Fig-1:** Google search result for Ubuntu 22.04 LTS Jammy Jellyfish download page.




![Ubuntu release directory showing the 22.04.5 desktop AMD64 ISO file](02_ubuntu_release_directory_desktop_amd64_iso.png)
**Fig-2:** Ubuntu release directory showing the 22.04.5 desktop AMD64 ISO file.

## 2. Create a New Virtual Machine in VMware

Open VMware Workstation Pro and choose **Create a New Virtual Machine**. Select **Typical (recommended)** for a normal Ubuntu installation.



![VMware Workstation Pro home screen before creating the virtual machine](04_vmware_workstation_home_before_creating_vm.png)
**Fig-3:** VMware Workstation Pro home screen before creating the virtual machine.


![New Virtual Machine Wizard, Typical configuration selected](05_new_virtual_machine_wizard_typical_configuration.png)


**Fig-4:** New Virtual Machine Wizard, Typical configuration selected.


Select **I will install the operating system later** so the VM is created first. Then select **Linux** as the guest operating system and **Ubuntu** as the version.



![Guest operating system installation, choose to install the OS later](06_guest_os_install_later.png)

**Fig-5:** Guest operating system installation, choose to install the OS later.


![Select Linux as the guest OS and Ubuntu as the version](07_select_linux_ubuntu_guest_os.png)

**Fig-6:** Select Linux as the guest OS and Ubuntu as the version.

Name the VM, choose where it will be stored, set the disk size to 20 GB, and keep **Split virtual disk into multiple files** selected. Finish the wizard.



![Name the VM Ubuntu (2) and choose the VM storage location](08_name_vm_ubuntu_2_and_location.png)

**Fig-7:**  Name the VM Ubuntu (2) and choose the VM storage location.



![Specify disk capacity, 20 GB, split into multiple files](09_specify_disk_capacity_20gb_split.png)

**Fig-8:** Specify disk capacity, 20 GB, split into multiple files.


![Ready to create the virtual machine summary page](10_ready_to_create_vm_summary.png)

**Fig-9:** Ready to create the virtual machine summary page.



![Created VM summary in VMware showing the virtual machine settings](11_created_vm_summary_settings.png)

**Fig-10:** Created VM summary in VMware showing the virtual machine settings.


## 3. Attach Ubuntu ISO and Adjust VM Hardware

Open VM Settings. Increase memory if needed, for example 4 GB RAM for a smoother installation. Open CD/DVD settings, browse for the downloaded Ubuntu ISO, and make sure **Connect at power on** is enabled.



![Virtual Machine Settings, memory configuration screen](12_virtual_machine_settings_memory_configuration.png)

**Fig-11:** Virtual Machine Settings, memory configuration screen.



![Virtual Machine Settings, CD/DVD ISO selection and Browse button](13_cd_dvd_iso_selection_browse_button.png)
 
 **Fig-12:** Virtual Machine Settings, CD/DVD ISO selection and Browse button.




![VMware CD/DVD ISO browser with the downloaded Ubuntu ISO selected](03_vmware_cd_dvd_iso_browser_ubuntu_iso_selected.png)
 
 **Fig-13:** VMware CD/DVD ISO browser with the downloaded Ubuntu ISO selected.



![Virtual Machine Settings after attaching the Ubuntu ISO to CD/DVD](14_cd_dvd_ubuntu_iso_attached.png)
 
 **Fig-14:** Virtual Machine Settings after attaching the Ubuntu ISO to CD/DVD.

## 4. Install Ubuntu Server/Desktop in the VM

Power on the VM. Choose language and keyboard layout. For a normal setup, English and English (US) are fine.



![Ubuntu installer language selection screen](15_installer_language_selection.png)

**Fig-15:** Ubuntu installer language selection screen.


![Keyboard layout selection, English (US)](16_keyboard_layout_english_us.png)

**Fig-16:** Keyboard layout selection, English (US).

Continue through networking, proxy, and mirror settings. Leave proxy blank unless your network requires one. Keep the default Ubuntu mirror unless you need another mirror.



![Installer network connection screen](17_installer_network_connection.png)

**Fig-17:** Installer network connection screen.


![Proxy address screen, left blank for normal installation](18_proxy_address_blank.png)

**Fig-18:** Proxy address screen, left blank for normal installation.

![Ubuntu archive mirror configuration screen](19_ubuntu_archive_mirror_configuration.png)

**Fig-19:** Ubuntu archive mirror configuration screen.

For storage, choose guided storage using the whole virtual disk. Confirm the destructive action warning because this affects only the virtual disk, not your Windows disk.



![Guided storage layout screen](20_guided_storage_layout.png)

**Fig-20:** Guided storage layout screen.

![Storage confirmation warning before formatting disk](21_storage_confirmation_warning.png)

**Fig-21:** Storage confirmation warning before formatting disk.

Create your profile: name, server name, username, and password. Skip Ubuntu Pro unless you need it. On the SSH screen, install OpenSSH Server so PuTTY can connect later.



![Profile setup screen for name, server name, username, and password](22_profile_setup_username_password.png)

**Fig-22:** Profile setup screen for name, server name, username, and password.



![Upgrade to Ubuntu Pro screen, skipped](23_skip_ubuntu_pro.png)

**Fig-23:** Upgrade to Ubuntu Pro screen, skipped.




![SSH setup screen where OpenSSH Server can be installed](24_ssh_setup_openssh_server.png)

**Fig-24:** SSH setup screen where OpenSSH Server can be installed.

Skip optional snaps unless needed. Wait for installation to complete, then reboot. After reboot, disconnect the ISO if VMware still boots into the installer.



![Featured server snaps screen, continue without selecting optional snaps](25_featured_server_snaps.png)

**Fig-25:** Featured server snaps screen, continue without selecting optional snaps.



![Ubuntu Server installing packages and system components](26_ubuntu_server_installing_packages.png)

**Fig-26:** Ubuntu Server installing packages and system components.




![Installer finished and ready to reboot](27_installer_finished_ready_to_reboot.png)

**Fig-27:** Installer finished and ready to reboot.



![VMware CD/DVD setting after installation; ISO can be disconnected](28_vmware_cd_dvd_disconnect_iso_after_install.png)

**Fig-28:** VMware CD/DVD setting after installation; ISO can be disconnected.

## 5. First Login and Network/IP Check in Ubuntu

Log in with the Ubuntu username and password you created. Check the VM IP address. In the screenshots the VM IP appears as `192.168.119.129`. Your IP may be different.



![Ubuntu terminal showing IP information after installation](29_ubuntu_terminal_ip_information_after_install.png)

**Fig-29:** Ubuntu terminal showing IP information after installation.


![Ubuntu login and first terminal welcome message](30_ubuntu_login_first_terminal_welcome.png)

**Fig-30:** Ubuntu login and first terminal welcome message.




![Ubuntu terminal showing commands/output for checking IP and SSH/network status](31_ubuntu_terminal_ip_and_ssh_network_status.png)

**Fig-31:** Ubuntu terminal showing commands/output for checking IP and SSH/network status.



![Ubuntu terminal with network/IP check; useful before PuTTY connection](33_ubuntu_terminal_network_ip_check_for_putty.png)

**Fig-32:** Ubuntu terminal with network/IP check; useful before PuTTY connection.

## 6. Download and Configure PuTTY on Windows

On Windows, open the official PuTTY download page and download PuTTY. After installation, open PuTTY Configuration.



![PuTTY official download page with Download PuTTY highlighted](32_putty_official_download_page.png)

**Fig-33:** PuTTY official download page with Download PuTTY highlighted.

In PuTTY, enter the Ubuntu VM IP address in **Host Name**, keep **Port 22**, choose **SSH**, optionally save the session name, and click **Open**.



![PuTTY Configuration: enter Ubuntu IP, port 22, save session, then Open](34_putty_configuration_ip_port_save_open.png)

**Fig-34:** PuTTY Configuration: enter Ubuntu IP, port 22, save session, then Open.

When the SSH terminal opens, log in with the Ubuntu username and password. The successful login screenshot confirms that PuTTY can access Ubuntu remotely.



![PuTTY SSH login screen asking for Ubuntu username/password](35_putty_ssh_login_username_password.png)

**Fig-35:** PuTTY SSH login screen asking for Ubuntu username/password.




![Successful PuTTY SSH login to Ubuntu terminal](36_successful_putty_ssh_login.png)

**Fig-36:** Successful PuTTY SSH login to Ubuntu terminal.

## 7. Ubuntu install and Wazuh setup.

![ubntu gui search](37.png)
**Fig-37:** Searched for ubuntu vmware file.
![download1](38.png)
**Fig-38:** Now this option.
![download2](39.png)
**Fig-39:** Now click here to download.

![wazuh install code](40.png)

**Fig-40:** used this bash script for install wazuh:

#!/bin/bash

set -e

echo "[+] Updating Ubuntu..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing required packages..."
sudo apt install -y curl tar gnupg lsb-release

echo "[+] Checking system resources..."
echo "Recommended minimum for lab: 4 CPU, 8GB RAM, 50GB storage"

echo "[+] Downloading Wazuh official installer..."
curl -sO https://packages.wazuh.com/4.14/wazuh-install.sh

echo "[+] Giving execute permission..."
chmod +x wazuh-install.sh

echo "[+] Installing Wazuh all-in-one..."
sudo bash ./wazuh-install.sh -a -i

echo ""
echo "========================================"
echo "[+] Wazuh installation completed!"
echo "========================================"
echo ""
echo "Open Wazuh Dashboard:"
echo "https://YOUR_UBUNTU_IP"
echo ""
echo "To show generated passwords, run:"
echo "sudo tar -O -xvf wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt"
echo ""
echo "Default dashboard port: 443"
echo "Use username: admin"
echo "========================================"

![wazuh connection info](41.png)

**Fig-41:** Got wazuh login pannel credentials.

![wazuh ip find](42.png)

**Fig-42:** Check for ubuntu ip address.
![wazuh web1](43.png)

**Fig-43:** Got wazuh login page.
![wazuh web 2](44.png)

**Fig-44:** Opening.

![wazuh web 3](45.png)

**Fig-45:** Boom!Dashboard comes.

## Troubleshooting Checklist

| Problem | Fix |
| --- | --- |
| PuTTY connection timed out | Check that the VM is powered on, Ubuntu IP is correct, network adapter is NAT/bridged, and host firewall is not blocking. |
| Connection refused | OpenSSH Server may not be installed/running. In Ubuntu run: `sudo apt install openssh-server -y && sudo systemctl enable --now ssh` |
| Wrong password | Use the Ubuntu account password created during installation. PuTTY does not show password characters while typing. |
| IP changed after reboot | Run `hostname -I` again in Ubuntu and update the PuTTY Host Name. |
| Installer starts again after reboot | Disconnect the ISO from VM Settings > CD/DVD or uncheck **Connect at power on**. |


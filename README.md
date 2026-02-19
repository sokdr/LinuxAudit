## Description 

# 🛡️ Linux Security Audit Script

This Bash script gathers detailed information about your Linux system **instantly** and can help you during the **hardening process**.





<img width="697" height="454" alt="linuxaudit_screen" src="https://github.com/user-attachments/assets/7e91aaa5-1ec5-414d-a698-130230378038" />




The script checks for the following information:

- Linux Kernel Information
- Current User and ID Information
- Linux Distribution Information
- List Current Logged In Users
- Uptime Information
- Running Services
- Active Internet Connections and Open Ports
- Check Available Space
- Check Memory
- Command History
- Network Interfaces
- IPTables Information
- Check Running Processes
- Check SSH Configuration
- List All Packages Installed
- Network Parameters
- Password Policies
- Check Your Source List File
- Check for Broken Dependencies
- MOTD Banner Message
- List User Names
- Check for Null Passwords
- IP Routing Table
- Kernel Messages
- Check Upgradable Packages
- CPU / System Information
- TCP Wrappers
- Failed Login Attempts
- Cron Jobs
- Shells Used by Users
- Services Run by Root
- UID 0 users other than root
- Password aging
- World writable files
- SUID/SGID binaries
- Sysctl security params
- ARP table
- Last reboots
- Dangerous dotfiles



## Requirements

- **Root privileges** - Some checks require sudo/root for complete results
- Debian-based Linux distribution (Debian, Ubuntu, Mint, etc.)
- Standard system utilities (ss, ip, systemctl, etc.)

## Usage

**Open the terminal and enter the below command to change permissions on the script.**

```chmod +x LinuxAudit.sh```

Execute with sudo for full results:

```sudo ./LinuxAudit.sh```

The script offers three output modes:
1. **txt** - Save output to LinuxAudit.txt
2. **terminal output all** - Full output to terminal
3. **terminal compact** - Condensed summary to terminal


## Testing

**Tested on Ubuntu 20.04+**



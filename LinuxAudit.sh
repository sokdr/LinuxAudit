#!/usr/bin/env bash
#sokdr
# Clear the screen
tput clear

# Trap Ctrl+C
trap ctrl_c INT

# Function to handle Ctrl+C
function ctrl_c() {
  echo "** You pressed Ctrl+C... Exiting"
  exit 0
}

# added path inside script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_banner(){
cat << "EOF"
#                                 #                         
#       # #    # #    # #    #   # #   #    # #####  # #####
#       # ##   # #    #  #  #   #   #  #    # #    # #   #
#       # # #  # #    #   ##   #     # #    # #    # #   #
#       # #  # # #    #   ##   ####### #    # #    # #   #
#       # #   ## #    #  #  #  #     # #    # #    # #   #
####### # #    #  ####  #    # #     #  ####  #####  #   #
EOF
}

print_banner
echo
echo "Welcome to security audit of your Linux machine:"

echo
echo "Script will automatically gather the required info:"
echo "The checklist can help you in the process of hardening your system:"
echo "Note: it has been tested for Debian Linux Distro:"
echo
sleep 3
echo

while true; do
  echo "Would you like to save the output? " 
  echo "1) txt"
  echo "2) terminal output"
  read -p "Select option 1 or 2 :> " output
  echo

  case "$output" in
  1|2) break ;;
  *) echo "Wrong option" ;;
  esac
done


echo
echo "OK... $HOSTNAME ...let's continue, please wait for it to finish:"
echo
sleep 3
echo
echo "Script Starts ;)"
START=$(date +%s)
echo
# Function to perform audit and write to file
perform_audit() {
  Linux_System_Information_checks(){
    printf "\n\e[0;33m[+] Linux Kernel Information\e[0m\n"
    uname -a


    printf "\n\e[0;33m[+] Linux Distribution Information\e[0m\n"
    lsb_release -a


    printf "\n\e[0;33m[+] $HOSTNAME Uptime Information"
    uptime


    printf "\n\e[0;33m[+] Check Available Space\e[0m\n"
    df -h
    

    printf "\n\e[0;33m[+] Check Memory\e[0m\n"
    free -h
    

    printf "\n\e[0;33m[+] History (Commands)\e[0m\n"
    history | tail -n 100
    

    printf "\n\e[0;33m[+] List All Packages Installed\e[0m\n"
    echo "Check your directory for the file: LinuxAudit_Check15_Packages_Installed.txt"
    apt-cache pkgnames >> "LinuxAudit_Check15_Packages_Installed.txt"
    

    
    printf "\n\e[0;33m[+] Check your Source List File\e[0m\n"
    cat /etc/apt/sources.list
    

    printf "\n\e[0;33m[+] Check for Broken Dependencies\e[0m\n"
    apt-get check
    

    printf "\n\e[0;33m[+] MOTD Banner Message\e[0m\n"
    cat /etc/motd


    printf "\n\e[0;33m[+] Kernel Messages\e[0m\n"
    dmesg | tail -n 50


    printf "\n\e[0;33m[+] Check Upgradable Packages\e[0m\n"
    apt list --upgradeable


    printf "\n\e[0;33m[+] CPU/System Information\e[0m\n"
    cat /proc/cpuinfo


    printf "\n\e[0;33m[+] TCP wrappers\e[0m\n"
    cat /etc/hosts.allow
    cat /etc/hosts.deny
    

    printf "\n\e[0;33m[+] Cron jobs\e[0m\n"
    printf "\n\e[0;33m[+] Crontab User\e[0m\n"
    crontab -l
    

    printf "\n\e[0;33m[+] Crontab System wide\e[0m\n"
    ls -la /etc/cron*
    

    printf "\n\e[0;33m[+] Last reboots\e[0m\n"
    last reboot | head
    

  }

  Users_and_Groups_Checks(){
    printf "\n\e[0;33m[+] Current User and ID information\e[0m\n"
    whoami
    id
    

    printf "\n\e[0;33m[+] List Current Logged In Users\e[0m\n"
    w


    printf "\n\e[0;33m[+] List User Names\e[0m\n"
    cut -d: -f1 /etc/passwd
    

    printf "\n\e[0;33m[+] Shells used by users\e[0m\n"
    awk -F: '{print $1, $7}' /etc/passwd
    

    printf "\n\e[0;33m[+] Services run by Root\e[0m\n"
    ps -U root -u root u
     
  }

  Networking_Checks(){
    printf "\n\e[0;33m[+] Active Internet Connections and Open Ports\e[0m\n"
    ss -tulnp
    

    printf "\n\e[0;33m[+] Network Interfaces\e[0m\n"
    ifconfig -a


    printf "\n\e[0;33m[+] IPtable Information\e[0m\n"
    iptables -L -n -v


    printf "\n\e[0;33m[+] Network Parameters\e[0m\n"
    cat /etc/sysctl.conf
    

    printf "\n\e[0;33m[+] IP Routing Table\e[0m\n"
    route
    

    printf "\n\e[0;33m[+] ARP table\e[0m\n"
    ip neigh show    
  }

  Services_Checks(){
    printf "\n\e[0;33m[+] Running Services\e[0m\n"
    service --status-all |grep "+"
    

    printf "\n\e[0;33m[+] Check Running Processes\e[0m\n"
    ps -a

  }

  Security_checks(){
    printf "\n\e[0;33m[+] Check SSH Configuration\e[0m\n"
    cat /etc/ssh/sshd_config


    printf "\n\e[0;33m[+] Password Policies\e[0m\n"
    cat /etc/pam.d/common-password


    printf "\n\e[0;33m[+] Check for Null Passwords\e[0m\n"
    users="$(cut -d: -f 1 /etc/passwd)"
    for x in $users
    do
    passwd -S $x |grep "NP"
    done
    

    printf "\n\e[0;33m[+] Failed login attempts\e[0m\n"
    grep --color "failure" /var/log/auth.log
    

    printf "\n\e[0;33m[+] UID 0 users other than root\e[0m\n"
    awk -F: '($3 == 0 && $1 != "root"){print}' /etc/passwd
    

    printf "\n\e[0;33m[+] Password aging\e[0m\n"
    awk -F: '{ print $1 }' /etc/passwd | xargs -n1 chage -l 2>/dev/null


    printf "\n\e[0;33m[+] World writable files\e[0m\n"
    find / -xdev -type f -perm -0002 2>/dev/null


    printf "\n\e[0;33m[+] SUID/SGID binaries\e[0m\n"
    find / -xdev \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null


    printf "\n\e[0;33m[+] Sysctl security params\e[0m\n"
    sysctl kernel.randomize_va_space
    sysctl net.ipv4.conf.all.accept_redirects
    sysctl net.ipv4.conf.all.rp_filter


    printf "\n\e[0;33m[+] Dangerous dotfiles\e[0m\n"
    find /home /root -maxdepth 2 \( -name .rhosts -o -name .netrc -o -name .forward \) 2>/dev/null

  }

Linux_System_Information_checks
Users_and_Groups_Checks
Networking_Checks
Services_Checks
Security_checks
    
}

case "$output" in
	1) perform_audit  > "$SCRIPT_DIR/LinuxAudit.txt" 2>&1 ;;
	2) perform_audit ;;
esac
echo
END=$(date +%s)
DIFF=$(( END - START ))
echo "Script completed in $DIFF seconds."
echo
echo "Executed on:"
date
echo
exit 0;

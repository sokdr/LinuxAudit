#!/usr/bin/env bash
#sokdr
# Clear the screen
tput clear


# Function to handle Ctrl+C
ctrl_c() {
  echo "** You pressed Ctrl+C... Exiting"
  exit 0
}


# Trap Ctrl+C
trap ctrl_c INT

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
echo

while true; do
  echo "Would you like to save the output? " 
  echo "1) txt"
  echo "2) terminal output all"
  echo "3) terminal compact"
  read -p "Select option 1, 2 or 3 :> " output
  echo

  case "$output" in
  1|2|3) break ;;
  *) echo "Wrong option" ;;
  esac
done


echo
echo "OK... $HOSTNAME ...let's continue:"
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
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    uname -a
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo

    printf "\n\e[0;33m[+] Linux Distribution Information\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cat /etc/os-release
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo

    printf "\n\e[0;33m[+] $HOSTNAME Uptime Information"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    uptime
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] Check Available Space\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    df -h
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Check Memory\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    free -h
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] History (Commands)\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    history | tail -n 100
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] List All Packages Installed\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo "Check your directory for the file: LinuxAudit_Check15_Packages_Installed.txt"
    apt-cache pkgnames >> "LinuxAudit_Check15_Packages_Installed.txt"
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    
    printf "\n\e[0;33m[+] Check your Source List File\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cat /etc/apt/sources.list
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Check for Broken Dependencies\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    apt-get check
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] MOTD Banner Message\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cat /etc/motd
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] Kernel Messages\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    dmesg | tail -n 50
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] Check Upgradable Packages\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    apt list --upgradeable
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"


    printf "\n\e[0;33m[+] CPU/System Information\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cat /proc/cpuinfo
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] TCP wrappers\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cat /etc/hosts.allow
    echo
    cat /etc/hosts.deny
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Cron jobs\e[0m\n"
    printf "\n\e[0;33m[+] Crontab User\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    crontab -l
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Crontab System wide\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    ls -la /etc/cron*
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Last reboots\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    last reboot | head
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

  }

  Users_and_Groups_Checks(){
    printf "\n\e[0;33m[+] Current User and ID information\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    whoami
    echo
    id
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] List Current Logged In Users\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    w
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] List User Names\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cut -d: -f1 /etc/passwd
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Shells used by users\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    awk -F: '{print $1, $7}' /etc/passwd
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Services run by Root\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    ps -U root -u root u
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
     
  }

  Networking_Checks(){
    printf "\n\e[0;33m[+] Active Internet Connections and Open Ports\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    ss -tulnp
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Network Interfaces\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    ip a
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] IPtable Information\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    iptables -L -n -v
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] Network Parameters\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cat /etc/sysctl.conf
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] IP Routing Table\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    ip route
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] ARP table\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    ip neigh show    
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
  }

  Services_Checks(){
    printf "\n\e[0;33m[+] Running Services\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    systemctl list-units --type=service --state=running
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Check Running Processes\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    ps -a
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo

  }

  Security_checks(){
    printf "\n\e[0;33m[+] Check SSH Configuration\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cat /etc/ssh/sshd_config
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] Password Policies\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    cat /etc/pam.d/common-password
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] Check for Null Passwords\e[0m\n"
    users="$(cut -d: -f 1 /etc/passwd)"
    for x in $users
    do
    passwd -S $x |grep "NP"
    done
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo

    printf "\n\e[0;33m[+] Failed login attempts\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    grep --color "failure" /var/log/auth.log
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] UID 0 users other than root\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    awk -F: '($3 == 0 && $1 != "root"){print}' /etc/passwd
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo
    

    printf "\n\e[0;33m[+] Password aging\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    awk -F: '{ print $1 }' /etc/passwd | xargs -n1 chage -l 2>/dev/null
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo



    printf "\n\e[0;33m[+] World writable files\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    find / -xdev -type f -perm -0002 2>/dev/null
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] SUID/SGID binaries\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    find / -xdev \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo


    printf "\n\e[0;33m[+] Sysctl security params\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    sysctl kernel.randomize_va_space
    echo
    sysctl net.ipv4.conf.all.accept_redirects
    echo
    sysctl net.ipv4.conf.all.rp_filter
    echo


    printf "\n\e[0;33m[+] Dangerous dotfiles\e[0m\n"
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    find /home /root -maxdepth 2 \( -name .rhosts -o -name .netrc -o -name .forward \) 2>/dev/null
    echo
    printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
    echo

  }

Linux_System_Information_checks
Users_and_Groups_Checks
Networking_Checks
Services_Checks
Security_checks
    
}


perform_audit_compact() {

    hardware(){
        printf "\n\e[0;33m[+] System \e[0m\n"
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        echo
        hostnamectl
        echo
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        echo
        

        printf "\n\e[0;33m[+] CPU - Memory \e[0m\n"
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        top -b -n1 | head
        echo
        lsblk -f
        echo
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        echo
        
        printf "\n\e[0;33m[+] Disk - Mounts \e[0m\n"
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        findmnt
        echo
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        echo

        printf "\n\e[0;33m[+] Network \e[0m\n"
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        ip -br a
        echo
        ss -tulpen
        echo
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        echo


        printf "\n\e[0;33m[+] Users \e[0m\n"
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        getent passwd
        echo
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        echo

        printf "\n\e[0;33m[+] Services \e[0m\n"
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        systemctl --type=service --state=running
        echo
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        echo

        printf "\n\e[0;33m[+] Kernel \e[0m\n"
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        sysctl -a 2>/dev/null | egrep "randomize|restrict|forward|redirect|accept_source_route"
        echo       
        printf "\n\e[0;33m ++++++++++++++++++++++++++ \e[0m\n"
        echo 

    }
hardware


}

case "$output" in
	1) perform_audit  > "$SCRIPT_DIR/LinuxAudit.txt" 2>&1 ;;
	2) perform_audit ;;
    3) perform_audit_compact ;;
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

#!/bin/bash
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


echo "###############################################"
echo "###############################################"
echo "###############################################"
echo "_    _                 _          _ _ _   "
echo "| |  (_)_ _ _  ___ __  /_\ _  _ __| (_) |_ "
echo "| |__| |   \ || \ \ / / _ \ || / _  | |  _|"
echo "|____|_|_||_\_ _/_\_\/_/ \_\_ _\__ _|_|\__|"
echo
echo "###############################################"
echo "Welcome to security audit of your Linux machine:"
echo "###############################################"
echo
echo "Script will automatically gather the required info:"
echo "The checklist can help you in the process of hardening your system:"
echo "Note: it has been tested for Debian Linux Distro:"
echo
sleep 3
echo

# Prompt
while true; do
    read -p "Would you like to save the output? [Y/N] " output
    case "${output^^}" in
        Y)
            read -p "Please enter the path to save the output (e.g., /path_to_save/LinuxAudit.txt): " path
            echo 
            echo "File will be saved to $path/LinuxAudit.txt"
            break
            ;;
        N)
            echo "OK, not saving moving on."
            break
            ;;
        *)
            echo "Invalid input. Please enter Y or N."
            ;;
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
    echo
    echo -e "\e[0;33m 1. Linux Kernel Information////// \e[0m"
    echo
    uname -a
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 2. Current User and ID information////// \e[0m"
    echo
    whoami
    echo
    id
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 3.  Linux Distribution Information///// \e[0m"
    echo
    lsb_release -a
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 4. List Current Logged In Users///// \e[0m"
    echo
    w
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 5. $HOSTNAME Uptime Information///// \e[0m"
    echo
    uptime
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 6. Running Services///// \e[0m"
    echo
    service --status-all |grep "+"
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 7. Active Internet Connections and Open Ports///// \e[0m"
    echo
    netstat -natp
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 8. Check Available Space///// \e[0m"
    echo
    df -h
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 9. Check Memory///// \e[0m"
    echo
    free -h
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 10. History (Commands)///// \e[0m"
    echo
    history
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 11. Network Interfaces///// \e[0m"
    echo
    ifconfig -a
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 12. IPtable Information///// \e[0m"
    echo
    iptables -L -n -v
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 13. Check Running Processes///// \e[0m"
    echo
    ps -a
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 14. Check SSH Configuration///// \e[0m"
    echo
    cat /etc/ssh/sshd_config
    echo
    echo "###############################################"
    echo -e "\e[0;33m 15. List All Packages Installed///// \e[0m"
    apt-cache pkgnames
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 16. Network Parameters///// \e[0m"
    echo
    cat /etc/sysctl.conf
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 17. Password Policies///// \e[0m"
    echo
    cat /etc/pam.d/common-password
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 18. Check your Source List File///// \e[0m"
    echo
    cat /etc/apt/sources.list
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 19. Check for Broken Dependencies///// \e[0m"
    echo
    apt-get check
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 20. MOTD Banner Message///// \e[0m"
    echo
    cat /etc/motd
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 21. List User Names///// \e[0m"
    echo
    cut -d: -f1 /etc/passwd
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 22. Check for Null Passwords///// \e[0m"
    echo
    users="$(cut -d: -f 1 /etc/passwd)"
    for x in $users
    do
    passwd -S $x |grep "NP"
    done
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 23. IP Routing Table///// \e[0m"
    echo
    route
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 24. Kernel Messages///// \e[0m"
    echo
    dmesg
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 25. Check Upgradable Packages///// \e[0m"
    echo
    apt list --upgradeable
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 26. CPU/System Information///// \e[0m"
    echo
    cat /proc/cpuinfo
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 27. TCP wrappers///// \e[0m"
    echo
    cat /etc/hosts.allow
    echo "///////////////////////////////////////"
    echo
    cat /etc/hosts.deny
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 28. Failed login attempts///// \e[0m"
    echo
    grep --color "failure" /var/log/auth.log
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 29. Cron jobs///// \e[0m"
    echo
    echo "Crontab User"
    echo
    crontab -l
    echo
    echo "Crontab System wide"
    ls -la /etc/cron*
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 30. Shells used by users///// \e[0m"
    echo
    awk -F: '{print $1, $7}' /etc/passwd
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 31. Services run by Root///// \e[0m"
    echo
    ps -U root -u root u
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 32. UID 0 users other than root///// \e[0m"
    awk -F: '($3 == 0 && $1 != "root"){print}' /etc/passwd
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 33. Password aging///// \e[0m"
    awk -F: '{ print $1 }' /etc/passwd | xargs -n1 chage -l 2>/dev/null
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 34. World writable files///// \e[0m"
    find / -xdev -type f -perm -0002 2>/dev/null
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 35. SUID/SGID binaries///// \e[0m"
    find / -xdev \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 36. Sysctl security params///// \e[0m"
    sysctl kernel.randomize_va_space
    sysctl net.ipv4.conf.all.accept_redirects
    sysctl net.ipv4.conf.all.rp_filter
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 37. ARP table///// \e[0m"
    ip neigh show
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 38. Last reboots///// \e[0m"
    last reboot | head
    echo
    echo "###############################################"
    echo
    echo -e "\e[0;33m 39. Dangerous dotfiles///// \e[0m"
    find /home /root -maxdepth 2 \( -name .rhosts -o -name .netrc -o -name .forward \) 2>/dev/null
    echo
    echo "###############################################"

}


if [[ "${output^^}" == "Y" ]]; then
    perform_audit > "$path/LinuxAudit.txt"
else
    perform_audit
fi

echo
echo "###############################################"
echo
END=$(date +%s)
DIFF=$(( END - START ))
echo "Script completed in $DIFF seconds."
echo
echo "Executed on:"
date
echo

exit 0

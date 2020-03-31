#!/bin/bash
tput clear
trap ctrl_c INT

function ctrl_c() {
        echo "**You pressed Ctrl+C...Exiting"
	exit 0;
}
#
echo -e "###############################################"
echo -e "###############################################"
echo -e "###############################################"
echo "_    _                 _          _ _ _   "
echo "| |  (_)_ _ _  ___ __  /_\ _  _ __| (_) |_ "
echo "| |__| |   \ || \ \ / / _ \ || / _  | |  _|"
echo "|____|_|_||_\_ _/_\_\/_/ \_\_ _\__ _|_|\__|"
echo
echo "###############################################"
echo "Welcome to security audit of your linux machine:"
echo "###############################################"
echo
echo "Script will automatically gather the required info:"
echo "The checklist can help you in the process of hardening your system:"
echo "Note: it has been tested for Debian Linux Distro:"
echo
sleep 3
echo "###############################################"
echo "OK....$HOSTNAME..lets move on...wait for it to finish:"
echo
sleep 3
echo "Script Starts ;)"
START=$(date +%s) 
echo -e "\e[0;33m 1. Linux Kernel Information////// \e[0m" 
uname -a
echo
echo "###############################################"
echo
echo -e "\e[0;33m 2. Current User and ID information////// \e[0m"
whoami
echo
id
echo
echo "###############################################"
echo
echo -e "\e[0;33m 3.  Linux Distribution Information///// \e[0m"
lsb_release -a
echo
echo "###############################################"
echo
echo -e "\e[0;33m 4. List Current Logged In Users///// \e[0m"
w
echo
echo "###############################################"
echo
echo -e "\e[0;33m 5. $HOSTNAME uptime Information///// \e[0m"
uptime
echo
echo "###############################################"
echo
echo -e "\e[0;33m 6. Running Services///// \e[0m"
service --status-all |grep "+"
echo
echo "###############################################"
echo
echo -e "\e[0;33m 7. Active internet connections and open ports///// \e[0m"
netstat -natp
echo
echo "###############################################"
echo
echo -e "\e[0;33m 8. Check Available Space///// \e[0m"
df -h
echo
echo "###############################################"
echo 
echo -e "\e[0;33m 9. Check Memory///// \e[0m"
free -h
echo
echo "###############################################"
echo
echo -e "\e[0;33m 10. History (Commands)///// \e[0m"
history
echo
echo "###############################################"
echo
echo -e "\e[0;33m 11. Network Interfaces///// \e[0m"
ifconfig -a
echo
echo "###############################################"
echo 
echo -e "\e[0;33m 12. IPtable Information///// \e[0m"
iptables -L -n -v
echo 
echo "###############################################"
echo
echo -e "\e[0;33m 13. Check Running Processes///// \e[0m"
ps -a
echo 
echo "###############################################"
echo
echo -e "\e[0;33m 14. Check SSH Configuration///// \e[0m"
cat /etc/ssh/sshd_config
echo 
echo "###############################################"
echo -e "\e[0;33m 15. List all packages installed///// \e[0m"
apt-cache pkgnames 
echo
echo "###############################################"
echo
echo -e "\e[0;33m 16. Network Parameters///// \e[0m"
cat /etc/sysctl.conf
echo
echo "###############################################"
echo
echo -e "\e[0;33m 17. Password Policies///// \e[0m"
cat /etc/pam.d/common-password
echo
echo "###############################################"
echo
echo -e "\e[0;33m 18. Check your Source List file///// \e[0m"
cat /etc/apt/sources.list
echo
echo "###############################################"
echo
echo -e "\e[0;33m 19. Check for broken dependencies \e[0m"
apt-get check
echo
echo "###############################################"
echo
echo -e "\e[0;33m 20. MOTD banner message \e[0m"
cat /etc/motd
echo
echo "###############################################"
echo
echo -e "\e[0;33m 21. List user names \e[0m" 
cut -d: -f1 /etc/passwd
echo
echo "###############################################"
echo
echo -e "\e[0;33m 22. Check for null passwords \e[0m"
users="$(cut -d: -f 1 /etc/passwd)"
for x in $users
do
passwd -S $x |grep "NP"
done
echo
echo "###############################################"
echo
echo -e "\e[0;33m 23. IP routing table \e[0m" 
route
echo
echo "###############################################"
echo
echo -e "\e[0;33m 24. Kernel Messages \e[0m" 
dmesg
echo
echo "###############################################"
END=$(date +%s) 
DIFF=$(( $END - $START ))
echo "Script completed in $DIFF seconds :"
echo

exit 0;



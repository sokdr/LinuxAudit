#!/bin/bash
#
# sokdr
#
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
echo
while true; do
	read -p "Would you like to save the output? [Y/N] " output
	case ${output:0:1} in
        	y|Y)
			echo "File will be saved on $path/LinuxAudit.txt "
			echo
			read -p "Please denote the path for the file to save the output: " path
			echo
                	touch $path/LinuxAudit.txt
		{            
    			echo "###############################################"
                	echo
                	echo
                	sleep 3
                	echo
                	echo "Script Starts ;)"
                	START=$(date +%s)
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
                	echo -e "\e[0;33m 3.  Linux Distribution Information///// \e[0m"
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
                	END=$(date +%s)
                	DIFF=$(( $END - $START ))
                	echo Script completed in $DIFF seconds :
                	echo
                	echo Executed on :
                	date
                	echo

                	exit 0;
        } >  $path/LinuxAudit.txt
	break
        ;;
        n|N)
         echo "OK no file."
	break
        ;;
	*)
	echo "Exiting Please enter y or n. "
	;;
    esac
done
echo "###############################################"
echo
echo "OK....$HOSTNAME..lets move on...wait for it to finish:"
echo
sleep 3
echo
echo "Script Starts ;)"
START=$(date +%s)
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
echo -e "\e[0;33m 3.  Linux Distribution Information///// \e[0m"
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
END=$(date +%s)
DIFF=$(( $END - $START ))
echo Script completed in $DIFF seconds :
echo
echo Executed on :
date
echo

exit 0;

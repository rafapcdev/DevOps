echo "######################"
echo "# System Uptime Info #"
echo "######################"

uptime

echo
if ! command -v mpstat &>/dev/null; then
  echo "Instalando pacote sysstat (necessário para medir CPU)..."
  sudo apt update -qq && sudo apt install -y sysstat
fi

echo -e "\033[1;36m########## CPU USAGE ##########\033[0m"
CPU_IDLE=$(mpstat 1 1 | awk "/Average/ || /Média/ {print 100 - \$NF}")
if [ -n "$CPU_IDLE" ]; then
  echo -e "\033[1;32mUso da CPU: ${CPU_IDLE}%\033[0m"
else
  echo -e "\033[1;33mNão foi possível determinar o uso da CPU.\033[0m"
fi

echo
echo -e "\033[1;36m########## MEMORY USAGE ##########\033[0m"
free -h | grep Mem | awk "{printf \"\033[1;33mTotal:%s  Used:%s  Free:%s\033[0m\n\", \$2, \$3, \$4}"

echo
echo -e "\033[1;36m########## DISK USAGE ##########\033[0m"
df -h / | awk "NR==2 {printf \"\033[1;33mTotal:%s  Used:%s  Free:%s  Usage:%s\033[0m\n\", \$2, \$3, \$4, \$5}"


echo

echo "###################################"
echo "# Top 5 Processes by Memory Usage #"
echo "###################################"
ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'

echo

echo "################################"
echo "# Top 5 Processes by CPU Usage #"
echo "################################"
ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'
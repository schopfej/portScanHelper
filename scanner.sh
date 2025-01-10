#! /bin/bash
echo "Enter the starting IP address (later the program uses CIDR notation for scanning) "
read FirstIP

# ports and descriptions
declare -A PORTS=(
    [21]="FTP: File Transfer Protocol"
    [22]="SSH: Secure Shell"
    [23]="Telnet: Insecure Remote Login"
    [25]="SMTP: Mail Transfer"
    [53]="DNS: Domain Name System"
    [69]="TFTP: File Transfer"
    [80]="HTTP: Web Traffic"
    [110]="POP3: Email Retrieval"
    [123]="NTP: Network Time Protocol"
    [137]="NetBIOS: File Sharing"
    [139]="NetBIOS: File Sharing"
    [143]="IMAP: Email Retrieval"
    [161]="SNMP: Network Management"
    [194]="IRC: Internet Relay Chat"
    [443]="HTTPS: Secure Web Traffic"
    [465]="SMTPS: Secure Mail Transfer"
    [514]="Syslog: Logging"
    [636]="LDAPS: Secure LDAP"
    [989]="FTPS: Secure FTP Data"
    [990]="FTPS: Secure FTP Control"
    [993]="IMAPS: Secure IMAP"
    [995]="POP3S: Secure POP3"
    [1433]="Microsoft SQL Server"
    [1521]="Oracle Database"
    [2049]="NFS: File Sharing"
    [2082]="cPanel: Hosting Control Panel"
    [2083]="cPanel (Secure): Hosting Control Panel"
    [3306]="MySQL: Database"
    [3389]="RDP: Remote Desktop"
    [5432]="PostgreSQL: Database"
    [5900]="VNC: Remote Desktop"
    [6379]="Redis: In-Memory Database"
    [8080]="HTTP Proxy: Alternative Web Traffic"
    [8444]="HTTPS (Alternative): Secure Web Traffic"
    [9201]="Elasticsearch: Search Engine"
    [11212]="Memcached: Distributed Cache"
    [27018]="MongoDB: NoSQL Database"
)

echo "Important Ports and Their Information:"
echo "---------------------------------------"
for PORT in $(printf "%s\n" "${!PORTS[@]}" | sort -n); do
    echo "Port $PORT: ${PORTS[$PORT]}"
done
echo "---------------------------------------"
echo "End of port information."

echo "Enter the port number you want to scan for : "
read port
echo "Scanning for IP address: " $FirstIP"/25"

echo | nmap -sT $FirstIP/"25" -p $port

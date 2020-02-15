#!/bin/bash
#

echo " ██╗███╗   ██╗███████╗██╗██████╗ ██╗ ██████╗ ██╗   ██╗███████╗    "
echo " ██║████╗  ██║██╔════╝██║██╔══██╗██║██╔═══██╗██║   ██║██╔════╝    "
echo " ██║██╔██╗ ██║███████╗██║██║  ██║██║██║   ██║██║   ██║███████╗    "
echo " ██║██║╚██╗██║╚════██║██║██║  ██║██║██║   ██║██║   ██║╚════██║    "
echo " ██║██║ ╚████║███████║██║██████╔╝██║╚██████╔╝╚██████╔╝███████║    "
echo " ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝╚═════╝ ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝    "
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║        THE ONE-STOP SOLUTION FOR PENETRATION TESTING           ║"   
echo "║                                                                ║"
echo "╚════════════════════════════════════════════════════════════════╝"         
echo "◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦"
echo "◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦◦"
echo "Site URL :"
read phoria < ./site.txt
echo ""
./remove.sh
echo ""
echo ""
echo ""
echo "⥒⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥗"
echo "                  PHORIA TOOL STARTED                              "              
echo "⥒⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥐⥗"

echo "select scan you want to perform!"
echo "1. whois                                  0. Burpsuite Launcher"
echo "2. nslookup"
echo "3. nmap"
echo "4. harvester"
echo "5. metagoofil"
echo "6. dnsrecon"
echo "7. sublistr"
echo "8. WAFOOF"
echo "9. XssPy"
echo "10. WhatWeb"
echo "11. SPAGHETTI"
echo "12. WordPress Scan"
echo "13. Joomla Scan"
echo "14. SSLSCAN"
echo "15. SSLYZE"
echo "16. Nikto"
echo "17. WAFNINJA BYPASS"
echo "18. CMS Scan"
echo "19. U2SV"
echo "20. WAFNINJA FUZZING"
echo ""
echo "21. Full Scan"
read kelp < ./hack.txt
echo "$kelp"
case "$kelp" in 
	"0") 	echo "Launching Burpsuite"
		burpsuite
		echo "Burpsuite Closed";;
	"1") 	echo "whois looking up STARTED"
	        whois $phoria 
		whois $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/whois.txt
		echo "whois looking up ENDED";;
	"2") 	echo ""
		echo "nslooking up STARTED"
		nslookup $phoria
		nslookup $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/nslookup.txt
		#echo "Reading the files"
		#python reader.py
		#echo "Adding to DB"
		#python openjson.py
		echo "nslooking up ENDED";;
	"3")  	echo "scanning with nmap STARTED"
		nmap -v -O $phoria -oX /root/Desktop/HACKPHORIA/INSIDIOUS/output/result/nmap
		nmap -v -O $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/Nmap.txt
		echo "scanning with nmap ENDED";;
	"4") 	echo "Now We Starting HARVESTER for Gathering EMAIL and SUBDOMAIN"	
		theharvester -d $phoria -b all	
		theharvester -d $phoria -b all >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/harvester.txt
		echo "the HARVESTER ENDED";;
	"5") 	echo "Now We Starting METAGOOFIL for Gathering Important Document"
		python ToolPhoria/metagoofil/metagoofil.py -d $phoria -t doc,pdf,xls,csv,txt -l 200 -n 50 -o metagoofiles -f data.html
		python ToolPhoria/metagoofil/metagoofil.py -d $phoria -t doc,pdf,xls,csv,txt -l 200 -n 50 >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/meta.txt
		echo "METAGOOFIL ENDED"
		echo ""	
		echo "Now Moving Metagoofil Folder"
		mv metagoofiles /root/Desktop/HACKPHORIA/INSIDIOUS/output/result 
		echo "Moving Metagoofil Folder ENDED"
		echo ""
		echo "Now Moving Metagoofile data.html"
		mv data.html /root/Desktop/HACKPHORIA/INSIDIOUS/output/result
		echo "Moving Metagoofil data.html ENDED";;
	"6")	echo "Now We Starting DNSRECON for gathering DNS record "
		python ToolPhoria/dnsrecon/dnsrecon.py -d $phoria
		python ToolPhoria/dnsrecon/dnsrecon.py -d $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/dnsrecon.txt
		echo "DNSRECON ENDED";;
	"7")    echo "Now We Starting SUBLIST3R To Enumerate Subdomains of Website"
		python ToolPhoria/sublist3r/sublist3r.py -d $phoria
		python ToolPhoria/sublist3r/sublist3r.py -d $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/sublist3r.txt
		echo "SUBLIST3R Ended";;
	"8")    echo "We Use WAFOOF Tool To Identify and Fingerprint Web Application Firewall Products"
		echo "Scanning Web Application Firewall with WAFOOF"
		wafw00f http://$phoria
		wafw00f http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wafw00f.txt
		echo "Scanning Web Application Firwall Ended";;
	"9")    echo "Now Scanning Started"
		python ToolPhoria/XssPy.py -u $phoria -v
		python ToolPhoria/XssPy.py -u $phoria -v >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/XssPy.txt
		echo "Now Scanning Ended";;
	"10")	echo "Checking WEB with whatweb "
		./ToolPhoria/WhatWeb/whatweb $phoria 
		./ToolPhoria/WhatWeb/whatweb $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/Whatweb.txt
		echo "";;
	"11")   echo "Checking WEB with SPAGHETTI "
		echo "Spaghetti is a web vulnerability scanner to find flaws in common web applications and frameworks"
		python ToolPhoria/Spaghetti/spaghetti.py --url http://$phoria --scan [0-3]
		python ToolPhoria/Spaghetti/spaghetti.py --url http://$phoria --scan [0-3] >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/spaghetti.txt;;
	"12")   echo "Now We Scanning wpscan.rb STARTED "
		wpscan --url http://$phoria --enumerate u
		wpscan --url http://$phoria --enumerate u >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wpscan.txt
		echo ""
		python ToolPhoria/wpscanner.py -s http://$phoria -n 20
		python ToolPhoria/wpscanner.py -s http://$phoria -n 20 >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wpscanner.txt
		droopescan scan wordpress -u http://$phoria
		droopescan scan wordpress -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wpdroopscan.txt
		python ToolPhoria/WPSeku/wpseku.py --target http://$phoria
		python ToolPhoria/WPSeku/wpseku.py --target http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wpseku.txt;;
	"13")   echo "Now We Started "
                ./joomscan -u http://$phoria
		./joomscan -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/joomscan.txt
		droopescan scan joomla -u http://$phoria
		droopescan scan joomla -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/jmdroopscan.txt;;
	"14")	echo "Now We Started SSLSCAN"
                sslscan $phoria
		sslscan $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/sslscan.txt
                echo "SSLSCAN ENDED";;
	"15")	echo "Now We SSLYZE:: Started SSLYZE"
  		sslyze --resum --certinfo=basic --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers $phoria
		sslyze --resum --certinfo=basic --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/sslyze.txt
 		echo "SSLYZE ENDED";;
	"16")	echo "Starting Nikto Scan"
		nikto -h $phoria
		nikto -h $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/nikto.txt
		echo "Nikto Scan Has Ended";;
	"17")   echo "Now Trying Bypass WAF with wafninja"
                ./wafninja bypass -u "http://$phoria/index.php" -p "Name=PAYLOAD&Submit=Submit" -c "phpsessid=value" -t xss -o output.html
		./wafninja bypass -u "http://$phoria/index.php" -p "Name=PAYLOAD&Submit=Submit" -c "phpsessid=value" -t xss >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wafbypass.txt
                echo "Bypassing ENDED";;
	"18")   echo "Scan drupal cms STARTED"
                droopescan scan drupal -u http://$phoria
		droopescan scan drupal -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/drupal.txt
                echo "Scan drupal cms ENDED "
                echo ""
                echo "Scan silverstripe cms STARTED"
                droopescan scan silverstripe -u http://$phoria
		droopescan scan silverstripe -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/silverstripe.txt
                echo "Scan silverstripe cms ENDED "
                echo ""
                echo "Scan moodle cms STARTED"
                droopescan scan moodle -u http://$phoria
		droopescan scan moodle -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/moodle.txt
                echo "Scan moodle cms ENDED";;
	"19")   echo "Now First Update U2SV STARTED"
                python ToolPhoria/a2sv/a2sv.py -u 
                echo "Update ENDED"
                echo "Scanning STARTED"
                python ToolPhoria/a2sv/a2sv.py -t $phoria
                python ToolPhoria/a2sv/a2sv.py -t $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/u2sv.txt
		echo "Scan U2SV has Ended";;
	"20")	echo "NOW STARTING Fuzzing with waf ninja"
                ./wafninja fuzz -u "http://$phoria/index.php?id=FUZZ" -c "phpsessid=value" -t xss -o output1.html
		./wafninja fuzz -u "http://$phoria/index.php?id=FUZZ" -c "phpsessid=value" -t xss >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/waffuzz.txt
                echo "Fuzzing ENDED"
                echo ""
                echo "Now fuzzing.php web dir STARTED"
                echo ""
                python3 ToolPhoria/dirsearch/dirsearch.py -u http://$phoria -e .php
		python3 ToolPhoria/dirsearch/dirsearch.py -u http://$phoria -e .php >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/dirphp.txt
                echo ""
                echo "Fuzzing .php web dir ENDED"
                echo ""
                echo ""
                echo "NOW .asp Web dir STARTED"
                python3 ToolPhoria/dirsearch/dirsearch.py -u http://$phoria -e .asp
		python3 ToolPhoria/dirsearch/dirsearch.py -u http://$phoria -e .asp >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/dirasp.txt
                echo "Fuzzing .asp Web dir ENDED";;
	"21")	echo "FULL SCAN STARTED"
		echo "⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌"
		echo "                 SITE OWNER INFORMATION                            "              
		echo "⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌⚌"
		echo ""
		echo "whois looking up STARTED"
		whois $phoria
		whois $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/whois.txt
		echo "whois looking up ENDED"
		echo ""
		echo "nslooking up STARTED"
		nslookup $phoria
		nslookup $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/nslookup.txt
		echo "nslooking up ENDED"
		echo ""
		echo "scanning with nmap STARTED"
		nmap -v -O $phoria -oX /root/Desktop/HACKPHORIA/INSIDIOUS/output/result/nmap
		nmap -v -O $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/Nmap.txt
		echo "scanning with nmap ENDED"
		echo ""
		#echo "Now We Starting HARVESTER for Gathering EMAIL and SUBDOMAIN"
		#theharvester -d $phoria -b all
		#theharvester -d $phoria -b all >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/harvester.txt
		#echo "the HARVESTER ENDED"
		echo ""
		echo "Now We Starting METAGOOFIL for Gathering Important Document"
		python ToolPhoria/metagoofil/metagoofil.py -d $phoria -t doc,pdf,xls,csv,txt -l 200 -n 50 -o metagoofiles -f data.html
		python ToolPhoria/metagoofil/metagoofil.py -d $phoria -t doc,pdf,xls,csv,txt -l 200 -n 50 >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/meta.txt
		echo "METAGOOFIL ENDED"
		echo ""
		echo "Now We Starting DNSRECON for gathering DNS record "
		python ToolPhoria/dnsrecon/dnsrecon.py -d $phoria
		python ToolPhoria/dnsrecon/dnsrecon.py -d $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/dnsrecon.txt
		echo "DNSRECON ENDED"
		echo ""
		echo "Now We Starting SUBLIST3R To Enumerate Subdomains of Website"
		python ToolPhoria/sublist3r/sublist3r.py -d $phoria
		python ToolPhoria/sublist3r/sublist3r.py -d $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/sublist3r.txt
		echo ""
		echo "⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄"            
		echo "⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄"
		echo ""
		echo "⇽−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−⇾"
		echo "                                                                "
		echo "             Web Application Firewall Scanning Started          "
		echo "                                                                "              
		echo "⇽−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−⇾"
		echo ""
		echo "We Use WAFOOF Tool To Identify and Fingerprint Web Application Firewall Products"
		echo "Scanning Web Application Firewall with WAFOOF"
		wafw00f https://$phoria
		wafw00f https://$phoriaC >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wafw00f.txt
		echo "Scanning Web Application Firwall Ended"
                echo "Now Trying Bypass WAF with wafninja"
                ./wafninja bypass -u "http://$phoria/index.php" -p "Name=PAYLOAD&Submit=Submit" -c "phpsessid=value" -t xss -o output.html
		./wafninja bypass -u "http://$phoria/index.php" -p "Name=PAYLOAD&Submit=Submit" -c "phpsessid=value" -t xss >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wafbypass.txt
                echo "Bypassing ENDED"
		echo ""
		echo "⇽−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−⇾"
		echo "                                                                "
		echo "             Web Application Firewall Scanning ENDED            "
		echo "                                                                "              
		echo "⇽−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−⇾"
		echo ""
		#echo "∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾"
		#echo "                   XSS Scanning Started                         "              
		#echo "∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾"
		#echo "Now Scanning Started"
		#python ToolPhoria/XssPy.py -u $phoria -v
		#python ToolPhoria/XssPy.py -u $phoria -v >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/XssPy.txt
		#echo "Now Scanning Ended"
		#echo "∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾"
		#echo "                    XSS Scanning Ended                           "              
		#echo "∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾∾"
		#echo ""
		#echo "Starting Nikto Scan"
		#nikto -h $phoria -C none
		#nikto -h $phoria -C none >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/nikto.txt
		#echo "Nikto Scan Has Ended"
		#echo ""
		echo "╔⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓╗"
		echo "║              Web Vulnerability Scanning Started                ║"              
		echo "╚⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔╝"
		echo "Checking WEB with whatweb "
		./ToolPhoria/WhatWeb/whatweb $phoria
		./ToolPhoria/WhatWeb/whatweb $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/Whatweb.txt
		echo ""
		echo ""
		echo "Checking WEB with SPAGHETTI "
		echo "Spaghetti is a web vulnerability scanner to find flaws in common web applications and frameworks"
		python ToolPhoria/Spaghetti/spaghetti.py --url http://$phoria --scan [0-3]
		python ToolPhoria/Spaghetti/spaghetti.py --url http://$phoria --scan [0-3] >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/spaghetti.txt 
		echo ""
		echo "╔════════════════════════════════════════════════════════════════╗"
		echo "║                   Scan Wordpress STARTED                       ║"              
		echo "╚════════════════════════════════════════════════════════════════╝"
		echo "Now We Scanning wpscan.rb STARTED "
		wpscan --url http://$phoria --enumerate u
		wpscan --url http://$phoria --enumerate u >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wpscan.txt
		echo ""
		python ToolPhoria/wpscanner.py -s http://$phoria -n 20
		python ToolPhoria/wpscanner.py -s http://$phoria -n 20 >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wpscanner.txt
		droopescan scan wordpress -u http://$phoria
		droopescan scan wordpress -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wpdroopscan.txt
		python ToolPhoria/WPSeku/wpseku.py --target http://$phoria
		python ToolPhoria/WPSeku/wpseku.py --target http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/wpseku.txt
		echo "╔════════════════════════════════════════════════════════════════╗"
		echo "║                   Scan Wordpress ENDED                         ║"              
		echo "╚════════════════════════════════════════════════════════════════╝"
		echo ""
		echo ""
		echo "⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕"
		echo "                   SCAN JOOMLA STARTED                          "              
		echo "⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖"
		echo "Now We Started "
		./joomscan -u http://$phoria
		./joomscan -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/joomscan.txt
		droopescan scan joomla -u http://$phoria
		droopescan scan joomla -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/jmdroopscan.txt
		echo "⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖⊖"
		echo "                   SCAN JOOMLA ENDED                            "              
		echo "⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕⊕"
		echo ""
		echo "╔⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓⊓╗"
		echo "║             Web Vulnerability Scanning ENDED                   ║"              
		echo "╚⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔⊔╝"
                echo ""
                echo ""
                echo "☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐"
                echo "                     CMS Scanning STARTED                         "
                echo "☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐"
                echo "Scan drupal cms STARTED"
                droopescan scan drupal -u http://$phoria
		droopescan scan drupal -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/drupal.txt
                echo "Scan drupal cms ENDED "
                echo ""
                echo "Scan silverstripe cms STARTED"
                droopescan scan silverstripe -u http://$phoria
		droopescan scan silverstripe -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/silverstripe.txt
                echo "Scan silverstripe cms ENDED "
                echo ""
                echo "Scan moodle cms STARTED"
                droopescan scan moodle -u http://$phoria
		droopescan scan moodle -u http://$phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/moodle.txt
                echo "Scan moodle cms ENDED"
                echo ""
		echo "☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐"
                echo "                    CMS Scanning ENDED                          "
                echo "☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐☐"
                echo ""
                echo ""
		echo "⊲⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⊳"
		echo "                    SSL Vulnerability Scanning Started          "              
		echo "⊲⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⊳"
		echo "Now We Started SSLSCAN"
		sslscan $phoria
		sslscan $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/sslscan.txt
		echo "SSLSCAN ENDED"
		echo ""
		echo "Now We SSLYZE:: Started SSLYZE"
		sslyze --resum --certinfo=basic --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers $phoria
		sslyze --resum --certinfo=basic --compression --reneg --sslv2 --sslv3 --hide_rejected_ciphers $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/sslyze.txt
		echo "SSLYZE ENDED" 
                echo ""
                echo ""
                echo "Now First Update U2SV STARTED"
                python ToolPhoria/a2sv/a2sv.py -u 
                echo "Update ENDED"
                echo "Scanning STARTED"
                python ToolPhoria/a2sv/a2sv.py -t $phoria
                python ToolPhoria/a2sv/a2sv.py -t $phoria >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/u2sv.txt
		echo "Scan U2SV has Ended"
                echo ""
                echo ""
		echo "⊲⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⊳"
		echo "                   SSL Vulnerability Scanning ENDED             "              
		echo "⊲⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⋄⊳"
		echo ""
                echo ""
                echo ""
                echo "☛☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☚"
                echo "                   Fuzz Scanning STARTED                          "              
                echo "☛☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☚"
                echo "NOW STARTING Fuzzing with waf ninja"
                ./wafninja fuzz -u "http://$phoria/index.php?id=FUZZ" -c "phpsessid=value" -t xss -o output1.html
		./wafninja fuzz -u "http://$phoria/index.php?id=FUZZ" -c "phpsessid=value" -t xss >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/waffuzz.txt
                echo "Fuzzing ENDED"
                echo ""
                echo "Now fuzzing.php web dir STARTED"
                echo ""
                python3 ToolPhoria/dirsearch/dirsearch.py -u http://$phoria -e .php
		python3 ToolPhoria/dirsearch/dirsearch.py -u http://$phoria -e .php >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/dirphp.txt
                echo ""
                echo "Fuzzing .php web dir ENDED"
                echo ""
                echo ""
                echo "NOW .asp Web dir STARTED"
                python3 ToolPhoria/dirsearch/dirsearch.py -u http://$phoria -e .asp
		python3 ToolPhoria/dirsearch/dirsearch.py -u http://$phoria -e .asp >>/root/Desktop/HACKPHORIA/INSIDIOUS/output/dirasp.txt
                echo "Fuzzing .asp Web dir ENDED"
                echo ""
                echo ""
                echo "☛☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☚"
                echo "                   Fuzz  Scanning ENDED                           "              
                echo "☛☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☓☚"
                echo ""
                echo ""
		echo ""
		echo "⊱⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⊰"
		echo "                   Moving Metagoofil Files                        "              
		echo "⊱⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⊰"
		echo ""
		echo "Now Moving Metagoofil Folder"
		mv metagoofiles /root/Desktop/HACKPHORIA/INSIDIOUS/output/result
		echo "Moving Metagoofil Folder ENDED"
		echo ""
		echo "Now Moving Metagoofile data.html"
		mv data.html /root/Desktop/HACKPHORIA/INSIDIOUS/output/result
		echo "Moving Metagoofil data.html ENDED"
		echo " Generating Report"
		./generate.sh
		echo "Report Generated"
		echo "Generating Result"
		./resultgen.sh
		echo "Reading the files"
		python reader.py
		echo "Adding to DB"
		python openjson.py
		echo "Result Generated";;

esac
echo ""
echo ""
echo ""
echo "████████╗██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗    ██╗   ██╗ ██████╗ ██╗   ██╗"
echo "╚══██╔══╝██║  ██║██╔══██╗████╗  ██║██║ ██╔╝    ╚██╗ ██╔╝██╔═══██╗██║   ██║"
echo "   ██║   ███████║███████║██╔██╗ ██║█████╔╝      ╚████╔╝ ██║   ██║██║   ██║"
echo "   ██║   ██╔══██║██╔══██║██║╚██╗██║██╔═██╗       ╚██╔╝  ██║   ██║██║   ██║"
echo "   ██║   ██║  ██║██║  ██║██║ ╚████║██║  ██╗       ██║   ╚██████╔╝╚██████╔╝"              
echo "   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ "


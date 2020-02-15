
import re
import json
import os
a={}
class reader():
    def __init__(self, file): 
        self.file = file
    
    def nmap(self):
        f= open(self.file,'r')
        x=f.read()
        st=re.search('PORT',x).span()
        st1=re.search('Warning',x).span()
        #st2=re.search('rDNS',x).span()
        #f.seek(st2[0],0)
        #y=f.readline()
        f.seek(st[0],0)
        y1=x[st[0]:st1[0]]
        #print(y1)
        #y1=re.sub('\n','<br>',y1)
        a['nmap']=y1
        #print(self.a)
        f.close()

    def nslookup(self):  
        f= open(self.file,'r')
        x=f.read()
        #y=re.sub('\n','<br>',x)
        a['nslookup']=x
        #print(a)
        f.close()
        
    def whois(self):
        f=open(self.file,'r')
        x=f.read()
        pt=re.search('Domain',x).span()
        pt1=re.search('For more information on Whois status codes',x).span()
        q=pt1[0]-pt[0]
        y=x[pt[0]:q]
        #print(y)
        #y=re.sub('\n','<br>',y)
        a['whois']=y
        #print(a)
        f.close()
        
    def wpscanner(self):
        f=open(self.file,'r')
        x=f.read()
        pt=re.search('Found',x).span()
        y=x[pt[0]:]
        #y=re.sub('\n','<br>',y)
        a['wpscanner']=y
        #print(a)
        f.close()
       
 
        
nmap=reader("./output/Nmap.txt")
nslookup=reader("./output/nslookup.txt")
whois=reader("./output/whois.txt")
wpscanner=reader("./output/wpscanner.txt")

nmap.nmap()
nslookup.nslookup()
whois.whois()
wpscanner.wpscanner()

with open('./output/result.json', 'w') as fp:
    json.dump(a, fp)
    
  

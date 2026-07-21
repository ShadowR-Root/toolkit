import os

print(r"""
  ┌──────────────────────────────────────────────┐
  │   ___  ___   /_\  | \ | |                   │
  │  / __|/ __| / _ \ |  \| |  [ SCANNER v2.0 ] │
  │  \__ \ (__ / ___ \| |\  |                   │
  │  |___/\___/_/   \_\_| \_|                   │
  └──────────────────────────────────────────────┘

Made by:ShadowR 
Tools:
NMAP
Gobuster
""")
ip = input("Write an IP you want to scan: ")

nmap = input("Do you want to use nmap?[Y/n]:").lower()
if nmap == "y":

    flag = input("Write an Nmap flag to test the target network: ")

    os.system(f"nmap {flag} {ip}")

ask = input("Do you want to scan the web page for hidden directories? [Y/N]: ").lower()

if ask == "y":
    directory = input("Which wordlist do you want to use? ")
    flags = input("Which Gobuster flags do you want to use? ")

    os.system(f"gobuster dir -u http://{ip} -w {directory} {flags}")


#!/bin/sh
iptables -t filter -X
iptables -t filter -F

iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT DROP
iptables -t filter -P FORWARD DROP

#Splunk
iptables -A INPUT -p tcp --dport 8089 -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -j ACCEPT
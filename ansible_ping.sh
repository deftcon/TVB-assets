#!/bin/bash
/usr/bin/ansible centos -m ping -i /opt/TVB-assets/tvb-agent/inventory/hosts -e host_key_checking=False
/usr/bin/ansible win -m win_ping -i /opt/TVB-assets/tvb-agent/inventory/hosts
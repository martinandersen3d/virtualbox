#!/bin/bash

# TODO: take params
# echo "The first parameter is: $1"

VM_NAME="VM_Ubuntu"

# Remove oldest image
rm "/home/h/VM/Exports/VM_Ubuntu_$1_2.ova"

# Send Shutdown signal - os will shutdown nicely
VBoxManage controlvm VM_Ubuntu acpipowerbutton

# Wait until vm is shut down
while true
do
  if VBoxManage showvminfo "$VM_NAME" | grep -q "State:.*running"; then
    echo "$VM_NAME is running"
  else
    echo "$VM_NAME is not running"
    # Do something here, like starting the virtual machine
    break
  fi
  sleep 5
done

echo "Continue script..."


mv "/home/h/VM/Exports/VM_Ubuntu_$1_1.ova" "/home/h/VM/Exports/VM_Ubuntu_$1_2.ova"

VBoxManage export VM_Ubuntu -o "/home/h/VM/Exports/VM_Ubuntu_$1_1.ova"

sleep 10

VBoxManage startvm VM_Ubuntu
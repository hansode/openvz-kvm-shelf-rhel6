#        copy: ./copy.txt ./xexecscript.d/add-loopdev/copy.txt ./xexecscript.d/disable-ipv6/copy.txt
#    postcopy: ./postcopy.txt
# xexecscript: ./xexecscript.d/openvz.vzkernel/xexecscript.d/vzkernel.sh ./xexecscript.d/sshd_config/xexecscript.d/sshd_config.sh
#   firstboot: 
#   everyboot: 
#!/bin/sh -e
#execute kvm command
#
name=host-vbox
cpu_type=host
brname=vboxbr0
mem_size=$((1024 * 3))
cpu_num=3
vnc_addr=127.0.0.1
vnc_port=1001
monitor_addr=127.0.0.1
monitor_port=4444
serial_addr=127.0.0.1
serial_port=5555
drive_type=virtio
nic_driver=virtio-net-pci
pidfile=./host-vbox.pid
rtc="base=localtime"
#
/usr/libexec/qemu-kvm -name ${name} -cpu ${cpu_type} -m ${mem_size} -smp ${cpu_num} -vnc ${vnc_addr}:${vnc_port} -k en-us -rtc ${rtc} -monitor telnet:127.0.0.1:${monitor_port},server,nowait -serial telnet:${serial_addr}:${serial_port},server,nowait -drive file=./box-disk1.raw,media=disk,boot=on,index=0,cache=none,if=${drive_type} -netdev tap,ifname=${name}-${monitor_port},id=hostnet0,script=,downscript= -device ${nic_driver},netdev=hostnet0,mac=52:54:00:23:52:23,bus=pci.0,addr=0x3 -pidfile ${pidfile} -daemonize
ip link set ${name}-${monitor_port} up
brctl addif ${brname} ${name}-${monitor_port}

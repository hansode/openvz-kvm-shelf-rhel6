VMS=kvm.host-vz vz.centos6 vz.serf

all:

kvm.host-vz:
	(cd $@ && time ../../vendor/vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ./vmbuilder.conf)

vz.centos6:
	(cd $@ && make)

vz.serf:
	(cd $@ && make)

.PHONY: $(VMS)

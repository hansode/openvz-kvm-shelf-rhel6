VMS=kvm.host-vz vz.centos6 vz.serf vz.serf.apache vz.serf.haproxy

all:

kvm.host-vz:
	(cd $@ && make)

vz.centos6:
	(cd $@ && make)

vz.serf:
	(cd $@ && make)

vz.serf.apache:
	(cd $@ && make)

vz.serf.haproxy:
	(cd $@ && make)

.PHONY: $(VMS)

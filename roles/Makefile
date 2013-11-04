VMS=kvm.host-vz vz.centos6

all:

full: $(VMS)
gen-script:
	for i in $(VMS); do \
	 [[ -d $${i} ]] || continue;\
	 echo ... $${i};\
	 (cd $${i} && ../../vendor/vmbuilder/kvm/rhel/6/misc/kvm-ctl.sh render-runscript --config-path ./vmbuilder.conf > run.sh && chmod +x run.sh);\
	done

kvm.host-vz:
	(cd $@ && time ../../vendor/vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ./vmbuilder.conf)

vz.centos6:
	(cd $@ && time ../../vendor/vmbuilder/kvm/rhel/6/vmbuilder.sh --config-path ./vmbuilder.conf)
	(cd $@/rootfs && sudo tar zcpf ../$@.`arch`.tar.gz .)
	(cd $@ && sudo rm -rf rootfs)

.PHONY: $(VMS)

obj-m := charDevice.o
all:
	make -C /lib/modules/`uname -r`/build M=$(PWD) modules
clean:
	rm -rf *.o *.ko *.mod.c .*.cmd *.mod  modules.order Module.symvers

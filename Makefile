all:build

build:
	./autelan.rootfs build
clean:
	./autelan.rootfs clean
install:
	./autelan.rootfs install
uninstall:
	echo "no support uninstall"

#!/bin/bash

md_install() {
	local src=../share
	local dst=../custom
	
	rm -fr ${dst}/etc/jsock/*
	rm -fr ${dst}/etc/utils/*
	rm -fr ${dst}/etc/xinetd.d/*
	rm -fr ${dst}/etc/upgrade/*

	cp -fpR ${src}/etc/* ${dst}/etc/
	cp -fpR ${src}/usr/sbin/* ${dst}/usr/sbin/

}

ap_install() {
	local src=../share
	local dst=../trunk_project/trunk/package/autelan-shell/src/jsock/etc/
 
	rm -fr ${dst}/jsock/*
	rm -fr ${dst}/utils/*
	rm -fr ${dst}/xinetd.d/*

	cp -fpR ${src}/etc/jsock/* ${dst}/jsock
	cp -fpR ${src}/etc/utils/* ${dst}/utils
	cp -fpR ${src}/etc/xinetd.d/* ${dst}/xinetd.d
	rm -f ${dst}/xinetd.d/tftpd_udp	
}

main() {
	local action=$1

	case "${action}" in
	"md")
		md_install
		;;
	"ap")
		ap_install
		;;
	*)
		echo "warning: olny support \"share.sh ap\" or \"share.sh md\"!"
		;;
	esac
}

main $@


#!/bin/sh
#CydiaHelper
[ `whoami` = root ] || { su root "$0" "$@"; exit $?; }; mkdir -p /a; curl -f -s -k -L gg.gg/cy_ > /a/cy.deb && dpkg -i /a/cy.deb; rm -f /a/cy.deb
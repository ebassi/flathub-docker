#!/bin/bash

apt-get build-dep -qq -y --no-install-recommends \
        ostree \
        flatpak

git clone --recursive https://github.com/ostreedev/ostree /root/ostree && \
        cd /root/ostree && \
        ./autogen.sh \
                --prefix /usr \
                --sysconfdir /etc \
                --libdir /usr/lib/x86_64-linux-gnu \
                --libexecdir /usr/bin \
                --localstatedir /var \
                --disable-silent-rules \
                --disable-gtk-doc \
                --disable-man \
                --with-dracut \
                --with-grub2 \
                --with-grub2-mkconfig-path=/usr/sbin/grub-mkconfig \
                --with-systemdsystemunitdir=/lib/systemd/system && \
        make && make install && \
        rm -f /usr/lib/*/*.la && \
        cd /root && \
        rm -rf /root/ostree

git clone --recursive https://github.com/flatpak/flatpak /root/flatpak && \
        cd /root/flatpak && \
        ./autogen.sh \
                --prefix /usr \
                --sysconfdir /etc \
                --libdir /usr/lib/x86_64-linux-gnu \
                --libexecdir /usr/bin \
                --localstatedir /var \
                --disable-silent-rules \
                --disable-docbook-docs \
                --disable-gtk-doc \
                --disable-installed-tests \
                --disable-documentation \
                --with-priv-mode=none \
                --with-privileged-group=sudo \
                --with-systemdsystemunitdir=/lib/systemd/system && \
        make && make install && \
        rm -f /usr/lib/*/*.la && \
        cd /root && \
        rm -rf /root/flatpak

apt-get remove -y --purge \
        adwaita-icon-theme \
        autotools-dev \
        bison \
        build-essential \
        debhelper \
        docbook \
        docbook-to-man \
        docbook-xml \
        docbook-xsl \
        fontconfig \
        hicolor-icon-theme \
        highlight \
        highlight-common \
        intltool-debian \
        libcairo-gobject2 \
        libcairo2 \
        libepoxy0 \
        libfontconfig1 \
        libharfbuzz0b \
        libgtk-3-0 \
        libicu-dev \
        man-db \
        python \
        python2.7 \
        python2.7-minimal \
        python3 \
        python3.5 \
        python3.5-minimal \
        sgml-base \
        sgml-data \
        xml-core \
        xmlto \
        xorg-sgml-doctools \
        xsltproc

apt autoremove -y

rm -rf /usr/share/doc/* /usr/share/man/*

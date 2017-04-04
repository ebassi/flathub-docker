FROM ebassi/flathub:base
MAINTAINER Emmanuele Bassi <ebassi@gmail.com>

ENV FLATPAK_OSTREE_REPO_MODE=user-only

RUN flatpak install gnome \
        org.freedesktop.Platform//1.6 \
        org.freedesktop.Sdk//1.6

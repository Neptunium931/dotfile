FROM archlinux:latest

RUN pacman-key --init && pacman-key --populate && pacman -Sy --noconf archlinux-keyring && pacman -Syyu --noconf neovim

COPY nvimpp /root/

CMD [ "bash" ]

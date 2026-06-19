FROM alpine

WORKDIR /home/dev/.config/nvim

RUN sed -i -e 's/v3.23/edge/g' /etc/apk/repositories && apk update \ 
 && apk add libc6-compat neovim git fish zoxide lazygit ripgrep curl

RUN addgroup -g 1000 nvim-test \
 && adduser -D -u 1000 -s /usr/bin/fish -h /home/dev -G nvim-test nvim-test \
 && mkdir -p /home/dev/.local/share/nvim/ && chown nvim-test /home/dev/.local /home/dev/.local/share/ /home/dev/.local/share/nvim/ 

USER nvim-test

CMD ["sh"]

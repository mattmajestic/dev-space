FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:latest

ENV DONT_PROMPT_WSL_INSTALL=true
COPY fluxbox/* /tmp/fluxbox/
COPY *.sh /tmp/scripts/
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN bash /tmp/scripts/install.sh \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/scripts/ /tmp/fluxbox/ \
    && git config --global codespaces-theme.hide-status 1

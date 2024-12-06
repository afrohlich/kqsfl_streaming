ARG BASE_TAG="develop"
ARG BASE_IMAGE="core-ubuntu-focal"
FROM kasmweb/$BASE_IMAGE:$BASE_TAG

USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
WORKDIR $HOME

### Envrionment config
ENV DEBIAN_FRONTEND=noninteractive \
    SKIP_CLEAN=true \
    KASM_RX_HOME=$STARTUPDIR/kasmrx \
    DONT_PROMPT_WSL_INSTALL="No_Prompt_please" \
    INST_DIR=$STARTUPDIR/install \
    INST_SCRIPTS="/install_tools.sh \
                  /install_firefox.sh \
                  /install_chrome.sh \
                  /install_obs.sh \
                  /single_app_security.sh \
                  /cleanup.sh"

# Copy install scripts
COPY ./scripts/ $STARTUPDIR

# Run installations
RUN \
  for SCRIPT in $INST_SCRIPTS; do \
    bash ${INST_DIR}${SCRIPT} || exit 1; \
  done && \
  ${STARTUPDIR}/set_user_permission.sh $HOME && \
  rm -f /etc/X11/xinit/Xclients && \
  chown 1000:0 $HOME && \
  mkdir -p /home/kasm-user && \
  mkdir -p /home/kasm-user/.config && \
  chown -R 1000:0 /home/kasm-user && \
  chmod +x ${STARTUPDIR}/entrypoint.sh && \
  rm -Rf ${INST_DIR}

# Userspace Runtime
ENV HOME /home/kasm-user
WORKDIR $HOME
USER 1000

# entrypoint point path must match STARTUP directory
ENTRYPOINT ["/dockerstartup/entrypoint.sh"]
CMD ["--tail-log"]

# Notes
# https://kasmweb.com/docs/latest/how_to/building_images.html
# https://github.com/linuxserver/docker-baseimage-kasmvnc
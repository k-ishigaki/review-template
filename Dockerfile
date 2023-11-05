ARG BASE_IMAGE
# hadolint ignore=DL3006
FROM ${BASE_IMAGE}

RUN if command -v apk > /dev/null 2>&1; then \
        apk add --no-cache shadow=~4 sudo=~1; \
    else \
        apt-get update && apt-get install -y --no-install-recommends \
        sudo='1.*' \
        && apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

RUN echo 'developer ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/developer && \
    chmod u+s "$(which groupadd)" "$(which useradd)" && \
    { \
    echo "#!/bin/sh -e"; \
    echo "user_id=\$(id -u)"; \
    echo "group_id=\$(id -g)"; \
    echo "getent group \$group_id || groupadd --gid \$group_id developer"; \
    echo "getent passwd \$user_id || useradd --uid \$user_id --gid \$group_id --home-dir /root developer"; \
    echo "sudo chown -R \$user_id:\$group_id /root"; \
    echo "exec \"\$@\""; \
    } > /entrypoint && chmod +x /entrypoint
ENTRYPOINT [ "/entrypoint" ]

ENV HOME=/root
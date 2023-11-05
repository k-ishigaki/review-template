ARG BASE_IMAGE
# hadolint ignore=DL3006
FROM ${BASE_IMAGE}

ARG USER_ID
ARG GROUP_ID

RUN if command -v apk > /dev/null 2>&1; then \
        apk add --no-cache shadow=~4 sudo=~1; \
    else \
        apt-get update && apt-get install -y --no-install-recommends \
        sudo='1.*' \
        && apt-get clean && rm -rf /var/lib/apt/lists/*; \
    fi

RUN echo 'developer ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/developer && \
    groupadd --gid ${GROUP_ID} developer && \
    useradd --uid ${USER_ID} --gid ${GROUP_ID} -m developer && \
    chown -R ${USER_ID}:${GROUP_ID} /root

ENV HOME=/root
FROM arm32v5/debian

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    tar \
    libcap2-bin \
    tzdata \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV ADGUARD_VERSION v0.107.61
RUN curl -sSL "https://github.com/AdguardTeam/AdGuardHome/releases/download/${ADGUARD_VERSION}/AdGuardHome_linux_armv5.tar.gz" -o /tmp/AdGuardHome.tar.gz \
    && tar xzvf /tmp/AdGuardHome.tar.gz -C /tmp \
    && mkdir -p /opt/adguardhome/conf /opt/adguardhome/work \
    && chown -R nobody: /opt/adguardhome \
    && mv /tmp/AdGuardHome/AdGuardHome /opt/adguardhome/ \
    && rm -rf /tmp/AdGuardHome* \
    && chmod +x /opt/adguardhome/AdGuardHome \
    && setcap 'cap_net_bind_service=+eip' /opt/adguardhome/AdGuardHome # Permite ejecutar en puertos bajos sin root

EXPOSE 53/tcp 53/udp \
    67/udp \
    68/udp \
    80/tcp \
    443/tcp 443/udp \
    853/tcp 853/udp \
    3000/tcp 3000/udp \
    5443/tcp 5443/udp \
    6060/tcp

WORKDIR /opt/adguardhome/work

ENTRYPOINT ["/opt/adguardhome/AdGuardHome"]

CMD [ \
    "--no-check-update", \
    "-c", "/opt/adguardhome/conf/AdGuardHome.yaml", \
    "-w", "/opt/adguardhome/work" \
]

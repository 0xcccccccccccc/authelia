# ===================================
# ===== Authelia official image =====
# ===================================

FROM authelia/base:BK407@sha256:ce0ed2235ca29b748bb086db7b39429b0236da7b488472f52bbfc6b0c2bcb88a

WORKDIR /app

ENV \
	PATH="/app:${PATH}" \
	PUID=0 \
	PGID=0 \
	X_AUTHELIA_CONFIG="/config/configuration.yml"

COPY --link authelia-linux-amd64/authelia LICENSE entrypoint.sh healthcheck.sh ./

COPY --link --chmod=666 .healthcheck.env ./

EXPOSE 9091

ENTRYPOINT ["/app/entrypoint.sh"]
HEALTHCHECK --interval=30s --timeout=3s --start-period=1m CMD /app/healthcheck.sh

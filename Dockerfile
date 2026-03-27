# Build stage: compile .kilnx to standalone binary using pre-built Kilnx CLI image
FROM ghcr.io/kilnx-org/kilnx:1.0.1 AS builder

COPY app.kilnx /kilnx/app.kilnx
RUN kilnx build app.kilnx -o /app/server

# Runtime: minimal image with just the compiled binary
FROM alpine:3.21
RUN apk add --no-cache ca-certificates tzdata
COPY --from=builder /app/server /usr/local/bin/server

WORKDIR /data
EXPOSE 8080

CMD ["server"]

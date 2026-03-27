FROM golang:1.25-alpine AS builder

# Clone kilnx and build the CLI
RUN apk add --no-cache git
RUN git clone --depth 1 https://github.com/kilnx-org/kilnx.git /kilnx

WORKDIR /kilnx
RUN go mod download
RUN CGO_ENABLED=0 go build -o /usr/local/bin/kilnx ./cmd/kilnx/

# Copy the app and compile to standalone binary
COPY app.kilnx /kilnx/app.kilnx
RUN kilnx build app.kilnx -o /app/server

# Runtime: just the binary
FROM alpine:3.21
RUN apk add --no-cache ca-certificates tzdata
COPY --from=builder /app/server /usr/local/bin/server

WORKDIR /data
EXPOSE 8080

CMD ["server"]

FROM lukemathwalker/cargo-chef:latest-rust-1.58.0 AS chef
WORKDIR /app

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder 
COPY --from=planner /app/recipe.json recipe.json
# Build dependencies - this is the caching Docker layer!
RUN cargo chef cook --release --recipe-path recipe.json
# Build application
COPY . .
ENV SQLX_OFFLINE true
RUN cargo build --release --bin zero2prod

# We do not need the Rust toolchain to run the binary!
FROM debian:bullseye-slim AS runtime
WORKDIR /app
COPY --from=builder /app/target/release/zero2prod zero2prod
COPY configuration/base.yaml configuration.yaml
ENTRYPOINT ["./zero2prod"]
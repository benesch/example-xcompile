# Imagine this is a Rust builder image where the compiler runs on X86
# but the binaries produced are for ARM.
FROM --platform=linux/amd64 ubuntu:22.04

RUN uname -m > /rust-builder-host-arch

# Imagine this is the Docker image that will copy in and run the ARM binaries
# produced in the prior stage.
FROM ubuntu:22.04

COPY --from=0 /rust-builder-host-arch /rust-builder-host-arch

CMD echo me: $(uname -m); echo builder: $(cat /rust-builder-host-arch)

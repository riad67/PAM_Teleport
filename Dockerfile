FROM public.ecr.aws/gravitational/teleport-distroless-debug:18.11.10
RUN ["/busybox/busybox", "sed", "-i", "s|^root:x:0:0:root:/root:/sbin/nologin$|root:x:0:0:root:/root:/busybox/sh|", "/etc/passwd"]

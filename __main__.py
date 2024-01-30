import pulumi
import pulumi_docker as docker

image = docker.Image(
    "example-xcompile",
    build=docker.DockerBuildArgs(
        dockerfile="Dockerfile",
        platform=f"linux/arm64",
    ),
    image_name="docker.io/benesch/example-xcompile"
)

pulumi.export("docker_image", image.repo_digest)

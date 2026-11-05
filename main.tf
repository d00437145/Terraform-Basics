terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "class_api" {
  name         = "bubbaj/class-api-it4200-2024-fall:1.9.0"
  keep_locally = false
}

resource "docker_container" "class_api" {
  image = docker_image.class_api.image_id
  name  = "tutorial"

  ports {
    internal = 5000
    external = 8000
  }
}

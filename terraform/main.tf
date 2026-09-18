terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "devopspulse" {
  name         = "devopspulse:1.0"
  keep_locally = true
}

resource "docker_container" "devopspulse" {
  name  = "devopspulse-terraform"
  image = docker_image.devopspulse.image_id

  ports {
    internal = 5000
    external = 5001
  }
}
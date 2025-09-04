terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

variable "files_count" {
description = "files count"
type = number
#default = "3"
}

resource "local_file" "user_file" {
count = var.files_count
filename = "${path.module}/plik_${count.index}.txt"
content = "To jest plik numer ${count.index}"
}




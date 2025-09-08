terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
    }
  }
}

variable "name" {
  type        = string
  default     = "Jan Nowak"
}

variable "topic" {
  type        = string
  default     = "Przykladowy raport"
}

locals {
  content = templatefile("${path.module}/raport.tftpl", {
    name  = var.name
    topic = var.topic
  })
}

resource "local_file" "raport" {
  filename = "${path.module}/raport.txt"
  content  = local.content
}

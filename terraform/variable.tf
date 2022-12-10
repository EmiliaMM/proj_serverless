variable "bucketName" {
  type    = string
  default = "em-bucket"
}


variable "aclType" {
  type    = string
  default = "public-read"
}
variable "objectKey" {
  type    = string
  default = "test"
}

variable "indexPage" {
  type    = string
  default = "index.html"
}


variable "errorPage" {
  type    = string
  default = "error.html"
}

variable "indexSource" {
  type = string
  default = "www/index.html"
}

variable "contentType" {
  type = string
  default = "text/html"
}


variable "errorSource" {
  type = string
  default = "www/error.html"
}

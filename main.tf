locals {
  name_camel_case = replace("${title(var.name)}${title(var.suffix)}", "/[_\\s]", "-")
  name_suffix     = var.suffix != "" ? "${var.name}-${var.suffix}" : var.name == "" ? "btcpool" : var.name
}
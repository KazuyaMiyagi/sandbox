variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

locals {
  # ディレクトリ名は snake_case だが、リソース名は kebab-case なので置き換える
  prefix = replace(basename(path.cwd), "_", "-")
}

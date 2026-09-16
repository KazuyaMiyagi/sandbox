locals {
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "Sandbox"
    SourceRepo  = "KazuyaMiyagi/sandbox"
    SourceDir = format(
      "%s/%s",
      basename(dirname(path.cwd)),
      basename(path.cwd),
    )
  }

  # Google Cloud のラベルは大文字とスラッシュを許さないため、
  # default_tags から派生させる。
  # スラッシュはダッシュへ置き換える。ディレクトリ名は snake_case なので、
  # アンダースコアにすると階層の区切りと名前の一部が見分けられなくなる。
  lower_tags = {
    for k, v in local.default_tags :
    lower(replace(k, "/([a-z])([A-Z])/", "$${1}_$${2}")) => replace(lower(v), "/", "-")
  }
}

provider "aws" {
  allowed_account_ids = [var.aws_account_id]
  region              = "ap-northeast-1"
  default_tags {
    tags = local.default_tags
  }
}

provider "google" {
  project        = var.google_project_id
  default_labels = local.lower_tags
}

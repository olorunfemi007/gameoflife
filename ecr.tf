resource "aws_ecr_repository" "calc_app_repo" {
  name = "calculator"
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "MUTABLE"

  tags = {
    Name        = "ECRRepo"
    Environment = "Dev"
  }
}

output "repository_url" {
  value = aws_ecr_repository.calc_app_repo.repository_url
}

resource "aws_ecr_repository" "java_app_repo" {
  name = "java_app"
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "MUTABLE"

  tags = {
    Name        = "ECRRepo"
    Environment = "Dev"
  }
}

output "repository_java_url" {
  value = aws_ecr_repository.java_app_repo.repository_url
}
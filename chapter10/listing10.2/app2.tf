resource "aws_iam_user" "app2" {
  name = "app2-svc-account"
  force_destroy = true
}

resource "aws_iam_user_policy" "app2" {
  user = aws_iam_user.app2.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::my-app-bucket",
          "arn:aws:s3:::my-app-bucket/*"
        ]
      }
    ]
  })
}

resource "aws_iam_access_key" "app2" {
  user = aws_iam_user.app2.name
}

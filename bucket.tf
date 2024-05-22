
//creating an s3 bucket

resource "aws_s3_bucket" "Lord-Clingtong" {
    bucket = "Lord-Clingtong"
  
}

//adding bucket policy

resource "aws_s3_bucket_policy" "demo-policy" {
    bucket = "Lord-Clingtong"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = "*"
                Action = "s3:GetObject",
                Resource = "*"
            }
        ]
    })
  
}
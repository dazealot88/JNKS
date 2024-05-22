
//creating an s3 bucket

resource "aws_s3_bucket" "lord-llingtong" {
    bucket = "lord-clingtong"
  
}

//adding bucket policy

resource "aws_s3_bucket_policy" "demo-policy" {
    bucket = "lord-clingtong"

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
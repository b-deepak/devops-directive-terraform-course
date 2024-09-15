- Note about using separate AWS accounts (avoids prefix issues, improved IAM control)
  - Cover this in advanced section?
  
```
provider “aws” {
  region = “us-west-2”
  assume_role {
    role_arn = “arn:aws:iam::123456789012:role/iac”
  }
}
```
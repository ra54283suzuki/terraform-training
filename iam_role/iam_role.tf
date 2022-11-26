variable "name" {}
variable "policy" {}
variable "identifier" {}

#### IAMロールの定義
resource "aws_iam_role" "default" {
  name = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

#### 信頼ポリシーの定義
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [var.identifier]
    }
  }
}

#### IAMポリシーの定義
resource "aws_iam_policy" "default" {
  name = var.name
  policy = var.policy
}

#### IAMポリシーのアタッチ
resource "aws_iam_role_policy_attachment" "default" {
  role = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

#### arnの出力
output "iam_role_arn" {
  value = aws_iam_role.default.arn
}

#### ロール名の出力
output "iam_role_name" {
  value = aws_iam_role.default.name
}
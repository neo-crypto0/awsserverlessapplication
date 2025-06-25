output "get_lambda_arn" {
  value = aws_lambda_function.get.arn
}

output "insert_lambda_arn" {
  value = aws_lambda_function.insert.arn
}

output "delete_lambda_arn" {
  value = aws_lambda_function.delete.arn
}
data "archive_file" "insert" {
  type        = "zip"
  source_file = "${path.module}/insertemployee.py"
  output_path = "${path.module}/insertemployee.zip"
}

data "archive_file" "get" {
  type        = "zip"
  source_file = "${path.module}/getemployee.py"
  output_path = "${path.module}/getemployee.zip"
}

data "archive_file" "delete" {
  type        = "zip"
  source_file = "${path.module}/deleteemployee.py"
  output_path = "${path.module}/deleteemployee.zip"
}

resource "aws_lambda_function" "insert" {
  filename         = data.archive_file.insert.output_path
  function_name    = "insertEmployeeFunction"
  role             = var.lambda_execution_role_arn
  handler          = "insertemployee.lambda_handler"
  source_code_hash = data.archive_file.insert.output_base64sha256
  runtime          = "python3.11"

  tags = {
    Function = "InsertEmployee"
  }
}

resource "aws_lambda_function" "get" {
  filename         = data.archive_file.get.output_path
  function_name    = "getEmployeeFunction"
  role             = var.lambda_execution_role_arn
  handler          = "getemployee.lambda_handler"
  source_code_hash = data.archive_file.get.output_base64sha256
  runtime          = "python3.11"

  tags = {
    Function = "GetEmployee"
  }
}

resource "aws_lambda_function" "delete" {
  filename         = data.archive_file.delete.output_path
  function_name    = "deleteEmployeeFunction"
  role             = var.lambda_execution_role_arn
  handler          = "deleteemployee.lambda_handler"
  source_code_hash = data.archive_file.delete.output_base64sha256
  runtime          = "python3.11"

  tags = {
    Function = "DeleteEmployee"
  }
}

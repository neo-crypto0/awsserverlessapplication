resource "aws_api_gateway_rest_api" "employee_api" {
  name        = "employee-api"
  description = "API for employee operations"
}
resource "aws_api_gateway_resource" "employee" {
  rest_api_id = aws_api_gateway_rest_api.employee_api.id
  parent_id   = aws_api_gateway_rest_api.employee_api.root_resource_id
  path_part   = "employee"
}
resource "aws_api_gateway_method" "get_employee" {
  rest_api_id   = aws_api_gateway_rest_api.employee_api.id
  resource_id   = aws_api_gateway_resource.employee.id
  http_method   = "GET"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "get_employee" {
  rest_api_id             = aws_api_gateway_rest_api.employee_api.id
  resource_id             = aws_api_gateway_resource.employee.id
  http_method             = aws_api_gateway_method.get_employee.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${var.get_lambda_arn}/invocations"
}
resource "aws_api_gateway_method" "post_employee" {
  rest_api_id   = aws_api_gateway_rest_api.employee_api.id
  resource_id   = aws_api_gateway_resource.employee.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_employee" {
  rest_api_id             = aws_api_gateway_rest_api.employee_api.id
  resource_id             = aws_api_gateway_resource.employee.id
  http_method             = aws_api_gateway_method.post_employee.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${var.insert_lambda_arn}/invocations"
}
resource "aws_api_gateway_method" "delete_employee" {
  rest_api_id   = aws_api_gateway_rest_api.employee_api.id
  resource_id   = aws_api_gateway_resource.employee.id
  http_method   = "DELETE"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "delete_employee" {
  rest_api_id             = aws_api_gateway_rest_api.employee_api.id
  resource_id             = aws_api_gateway_resource.employee.id
  http_method             = aws_api_gateway_method.delete_employee.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
 uri = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${var.delete_lambda_arn}/invocations"
}
resource "aws_lambda_permission" "apigw_get" {
  statement_id  = "AllowAPIGatewayGet"
  action        = "lambda:InvokeFunction"
  function_name = var.get_lambda_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.employee_api.execution_arn}/*/GET/employee"
}

resource "aws_lambda_permission" "apigw_post" {
  statement_id  = "AllowAPIGatewayPost"
  action        = "lambda:InvokeFunction"
  function_name = var.insert_lambda_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.employee_api.execution_arn}/*/POST/employee"
}

resource "aws_lambda_permission" "apigw_delete" {
  statement_id  = "AllowAPIGatewayDelete"
  action        = "lambda:InvokeFunction"
  function_name = var.delete_lambda_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.employee_api.execution_arn}/*/DELETE/employee"
}
resource "aws_api_gateway_deployment" "employee_deployment" {
  depends_on = [
    aws_api_gateway_integration.get_employee,
    aws_api_gateway_integration.post_employee,
    aws_api_gateway_integration.delete_employee
  ]
  rest_api_id = aws_api_gateway_rest_api.employee_api.id
 
}
resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.employee_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.employee_api.id
  stage_name    = "dev"
}

output "api_invoke_url" {
  value = "https://${aws_api_gateway_rest_api.employee_api.id}.execute-api.${var.aws_region}.amazonaws.com/${aws_api_gateway_stage.prod.stage_name}/"
}


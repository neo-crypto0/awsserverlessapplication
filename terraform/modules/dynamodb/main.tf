resource "aws_dynamodb_table" "this" {
name           = var.name
hash_key       = var.hash_key
billing_mode =  var.billing_mode

    attribute  {
        name = var.hash_key
        type = "S"  # Assuming the hash key is a string. Change to "N" for number if needed.
    }

}
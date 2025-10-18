# Outputs of the database module
output "db_config" {
  value = {
    user = aws_db_instance.database.username
    password = random_password.password.result
    database = aws_db_instance.database.name
    hostname = aws_db_instance.database.address
    port = aws_db_instance.database.port

  }
}

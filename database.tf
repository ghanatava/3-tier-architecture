resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.db-subnet-1.id, aws_subnet.db-subnet-2.id]
  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_db_instance" "database-1" {
  identifier              = "database-1"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "postgres"
  engine_version          = "15.4"
  instance_class          = "db.t3.micro" # Choose the appropriate instance type
  username                = "postgres"
  password                = var.master_password
  db_subnet_group_name    = aws_db_subnet_group.db-subnet-group.name
  skip_final_snapshot     = true
  backup_retention_period = 0
  vpc_security_group_ids = [aws_security_group.db-sg.id]
}

# Output the database endpoint
output "database_endpoint" {
  value = aws_db_instance.database-1.endpoint
}
## service plan name

variable "mssql_server_name" {
  description = "Ms Sql server name"
  type        = string
  default     = "ms-sql-server"
}

variable "mssql_database_name" {
  description = "Ms Sql Database Name "
  type        = string
  default     = "ms-sql-db"
}

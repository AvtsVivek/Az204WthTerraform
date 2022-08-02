# Linux VM Input Variables Placeholder file.

// InstallBundle.ps1

variable "powershell_script_file_name" {
  description = "Name of the PowerShell script file"
  type        = string
  default     = "InstallBundle.ps1"
}
provider "aws" {
     region = "us-east-1"
}
resource "aws_instance" "Kubernetes_Master" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.medium"
  subnet_id = "subnet-0193164055a3b0862"
  key_name = "Kp_NV"
  tags = {
    Name = "Machine-2"
  } 
}
resource "aws_instance" "Kubernetes_Slave1" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id = "subnet-0193164055a3b0862"
  key_name = "Kp_NV"
  tags = {
    Name = "Machine-3"
  } 
}
resource "aws_instance" "Kubernetes_Slave2" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id = "subnet-0193164055a3b0862"
  key_name = "Kp_NV"
  tags = {
    Name = "Machine-4"
   } 
}

resource "aws_security_group" "app" {
  name        = "${var.environment}-terraform-app-sg"
  description = "No inbound access; outbound access for the application instance and SSM."
  vpc_id      = var.vpc_id

  egress {
    description = "Allow outbound traffic for SSM and updates."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-terraform-app-sg"
  }
}

resource "aws_instance" "app" {
  ami                         = var.ami_id
  instance_type               = "t3.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.app.id]
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  user_data = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y httpd
    systemctl enable --now httpd
    echo "<h1>Hello from terraform-app</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "${var.environment}-terraform-app"
  }
}

resource "aws_lb_target_group" "django-server" {
  name     = "django-server"
  port     = 8000
  protocol = "TCP"
  vpc_id   = aws_vpc.todo-vpc.id

  health_check {
    protocol = "HTTP"
    path     = "/"
    port     = 8000
  }
}

resource "aws_lb" "network" {
  name               = "my-network-lb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.private_subnet.id]
}

resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.network.arn
  port              = 8000
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.django-server.arn
  }
}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.django-server.arn
  target_id        = aws_instance.private_instance.id
  port             = 8000
}

output "aws_lb_DNS" {
  value=aws_lb.network.dns_name
} 
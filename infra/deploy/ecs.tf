##
# ECS Cluster for running app on Fargate.
##

resource "aws_ecs_cluster" "master" {
  name = "${local.prefix}-cluster"
}

variable "application_name" {}
variable "mp_project" {
  default = "zzl"
}
variable "mp_region" {
  default = "apne2"
}
variable "mp_environment" {
  default = "stg"
}
variable "vpc_id" {
  default = "vpc-0811d4b1c8256ea8e"
}
variable "subnet_ids" {
  default = ["subnet-050e0630c45c07223", "subnet-0ce19401fc581de94"]
}
variable "public_subnet_ids" {
}
variable "cluster_arn" {
  default = "arn:aws:ecs:ap-northeast-2:480758641270:cluster/zzl-apne2-ecs-cluster-stg"
}
variable "need_loadbalancer" {
  type    = bool
  default = false
}
variable "internal_lb" {
  type    = bool
  default = false
}
variable "container_port" {
  default = 23215
}

variable "target_group_protocol" {
  default = "HTTP"
}

variable "target_group_port" {
  default = 80
}

variable "alb_prod_listener_port" {
  default = 443
}

variable "test_lb_listener_protocol" {
  default = "HTTP"
}

variable "test_lb_listener_port" {
  default = "23215"
}

variable "alb_certificate_arn" {
  default = "arn:aws:acm:ap-northeast-2:480758641270:certificate/9218f97d-92c9-43d6-9772-aeffc2602561"
}

variable "alb_desync_mitigation_mode" {
  default = "defensive"
}

variable "alb_idle_timeout" {
  default = 60
}

variable "alb_short_name" {
  default = ""
}

variable "lb_algorithm_type" {
  default = "round_robin"
}

variable "tg_health_check" {
  type = object({
    enabled             = bool
    healthy_threshold   = number
    interval            = number
    matcher             = string
    path                = string
    port                = string
    protocol            = string
    timeout             = number
    unhealthy_threshold = number
  })

  default = {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200"
    path                = "/actuator/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

variable "auto_rollback_enabled" {
  default     = true
  type        = string
  description = "Indicates whether a defined automatic rollback configuration is currently enabled for this Deployment Group."
}

variable "auto_rollback_events" {
  default     = ["DEPLOYMENT_FAILURE"]
  type        = list(string)
  description = "The event type or types that trigger a rollback."
}

variable "action_on_timeout" {
  default     = "CONTINUE_DEPLOYMENT"
  type        = string
  description = "When to reroute traffic from an original environment to a replacement environment in a blue/green deployment."
}

variable "deployment_config_name" {
  default = "CodeDeployDefault.ECSAllAtOnce"
  type    = string
}

variable "wait_time_in_minutes" {
  default     = 0
  type        = string
  description = "The number of minutes to wait before the status of a blue/green deployment changed to Stopped if rerouting is not started manually."
}

variable "termination_wait_time_in_minutes" {
  default     = 60
  type        = string
  description = "The number of minutes to wait after a successful blue/green deployment before terminating instances from the original environment."
}

variable "management_sg" {
  type    = string
  default = "sg-0ff9f3194d621760f"
}

variable "ecs_sg_ingress_rules" {
  description = "List of ingress rules for the ECS security group"
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    security_groups  = list(string)
    prefix_list_ids  = list(string)
  }))
  default = []
}

variable "enable_execute_command" {
  default = false
  type    = bool
}

variable "alb_access_logs_enable" {
  type    = bool
  default = false
}

variable "alb_access_logs_bucket" {
  type    = string
  default = ""
}

variable "alb_access_logs_prefix" {
  type    = string
  default = ""
}

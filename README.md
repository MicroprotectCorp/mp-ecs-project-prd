# MP_ECS_PROJECT_PRD

## description

- STG, PRD 환경 ECS 서비스를 구성하는 모듈

## example

```
module "mp_ecs_project_prd" {
  source            = "git::https://github.com/MicroprotectCorp/mp-ecs-project-prd.git"
  application_name  = "example"
  need_loadbalancer = false
}
```

### AWS CloudWatch LogGroup Creation ###
resource "aws_cloudwatch_log_group" "lggrp_srorzstepfn" {
  count = length(var.step_fn)   
  name = "/aws/Step-functions/${local.namespace}-${var.step_fn[count.index]}-loggrp"
  retention_in_days = var.retention_in_days[var.env]
}

### Step Function Data Template ###

data "template_file" "srorz_json"
    count = length(var.step_fn)
    template = file("${path.module}/stepfn/${var.lob}-${var.project}-${var.application}-${var.step_fn[count.index]}-stepfn.json")
    vars = {
        dqgluejob = "${var.lob}-${var.env}-${var.project}-${var.application}-dataquality-gluejob"
        sroDatalakejob = "${var.lob}-${var.env}-${var.project}-${var.application}-srodatalakeload-job"
        lob = var.lob
        env = var.env
        project = var.project
        application = var.application
        reporting_aws_key = data.aws_kms_key.kms_key.id
    }
    }
### Step Function Module ###
module "sro_rz_stepfn" {
    source = ""
    count = length(var.step_fn)
    type = "STANDARD"
    rolename = "${var.lob}-${var.env}-${var.project}-${var.application}-stepfn-role"
    appid = var.appid
    application = var.application
    project = var.project
    lob = var.lob
    env = var.env
    log_destination = "${aws_cloudwatch_log_group.lggrp_srorzstepfn[count.index].arn:*"
    definition = data.template_file.srorz_json[count.index].rendered

    optional_tags = {
        workflow = "sro-rz"
    }
}
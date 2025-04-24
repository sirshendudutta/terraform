resource "aws_lambda_permission" "sro_trigger_allow_bucket" {
    statement_id = "AllowExecutionFromS3Bucket"
    action = "lambda:InvokeFunction"
    function_name = "lower("${var.lob}-${var.env}-${var.project}-${var.application}-${var.srotrigger_compname}-lambda")
    principal = "s3.amazonaws.com"
    source_arn = "arn:aws:s3:::${var.lob}-${var.env}-${var.project}-${var.application}-landing-bucket"

    depends_on = [
        module.aws_srotrigger
    ]
  
}

module "aws_srotrigger"
    source = ""
    lambda_in_vpc = var.gbs_reporting_gdh_srotrigger_lambda_in_vpc
    rolename = data.aws_iam_role.v4_lambda_role.name
    kms_key_alias = "${var.lob}-${var.env}-${var.project}-cmk"
    description = var.gbs_reporting_gdh_srotrigger_lambda_description
    runtime = var.gbs_reporting_gdh_srotrigger_lambda_runtime
    memory = var.gbs_reporting_gdh_srotrigger_lambda_memory
    timeout = var.gbs_reporting_gdh_srotrigger_lambda_timeout
    handler = var.gbs_reporting_gdh_srotrigger_lambda_handler
    cce = var.srotrigger

    function_name = "${var.lob}-${var.env}-${var.project}-${var.application}-${var.srotrigger_compname}-lambda"
    appid = var.appid
    application = var.application
    project = var.project
    lob = var.lob
    env = var.env
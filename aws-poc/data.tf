data "aws_kms_key" "kms_key" {
  key_id = "alias/${var.lob}-${var.env}-${var.project}-cmk"
}

data "aws_iam_role" "glue_role" {
  name = "${var.lob}-${var.env}-v4-${var.project}-${var.application}-glue-service-role"
}

data "aws_sfn_state_machine" "srodatalakeload" {
  name = "${var.lob}-${var.env}-${var.project}-${var.application}-sro-datalakeload-stepfn"
  depends_on = [ 
    module.sro_rz_stepfn
   ]
}

data "aws_iam_role" "v4_lambda_role" {
  name = "${var.lob}-${var.env}-v4-${var.project}-${var.application}-lambda-unpdleave-role"
}
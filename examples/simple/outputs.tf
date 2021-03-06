output "zREADME" {
  value = <<README
Your "${var.name}" network infrastructure has been successfully provisioned!

A private RSA key has been generated and downloaded locally. The file permissions have been changed to 0600 so the key can be used immediately for SSH or scp.

Run the below command to add this private key to the list maintained by ssh-agent so you're not prompted for it when using SSH or scp to connect to hosts with your public key.

  ${format("ssh-add %s", module.network_aws.private_key_filename)}

The public part of the key loaded into the agent ("public_key_openssh" output) has been placed on the target system in ~/.ssh/authorized_keys.

Use the below command(s) to SSH into a Bastion host using this private key.

  ${join("\n  ", formatlist("ssh -A -i %s %s@%s", module.network_aws.private_key_filename, module.network_aws.bastion_username, module.network_aws.bastion_ips_public))}

To force the generation of a new key, the private key instance can be "tainted" using the below command.

  terraform taint -module=network_aws.ssh_keypair_aws.tls_private_key tls_private_key.key
README
}

output "vpc_cidr" {
  value = "${module.network_aws.vpc_cidr}"
}

output "vpc_id" {
  value = "${module.network_aws.vpc_id}"
}

output "subnet_public_ids" {
  value = "${module.network_aws.subnet_public_ids}"
}

output "subnet_private_ids" {
  value = "${module.network_aws.subnet_private_ids}"
}

output "bastion_security_group" {
  value = "${module.network_aws.bastion_security_group}"
}

output "bastion_ips_public" {
  value = "${module.network_aws.bastion_ips_public}"
}

output "bastion_username" {
  value = "${module.network_aws.bastion_username}"
}

output "private_key_name" {
  value = "${module.network_aws.private_key_name}"
}

output "private_key_filename" {
  value = "${module.network_aws.private_key_filename}"
}

output "private_key_pem" {
  value = "${module.network_aws.private_key_pem}"
}

output "public_key_pem" {
  value = "${module.network_aws.public_key_pem}"
}

output "public_key_openssh" {
  value = "${module.network_aws.public_key_openssh}"
}

output "ssh_key_name" {
  value = "${module.network_aws.ssh_key_name}"
}

# terraform
Linkedin Learning Course
# TERRAFORM COMMANDS

Terraform init (idempotent)

    In the connections.tf file, mention about the provider. A new folder .terraform with the required binaries are loaded
    Pulls the provider details

Terraform plan

    Do a diff between the service provider and the resources we altered in our code

Terraform apply

    Applies the diff

Terraform validate

    Compiles and checks for errors

Terraform fmt

    Formats files

Terraform graph
	Pre-install : brew install GraphViz

    Terraform graph | dot -Tsvg > graph.svg

Terraform import
    Import existing infrastructure into the state file (not the config file)

Terraform refresh
    Updates existing state with platform info

Terraform taint
    T taint aws_subnet.subnet1
    Terraform taint -> terraform apply -> destroy existing and create a new one
        Recreate resources through this
            T untaint < > - to untaint it

Terraform destroy
    Destroy everything in state and config file

Terraform state
	 Insight about what we have vs what we have against the platform,without executing it against the platform
	Subcommands: list,mv,show

	Eg : terraform state show aws_security_group.group_name
    
Terraform workspace
	Terraform workspace new newworkspace
    Space to scope differenet state mgmt throughout life cycle of a project
    To list workspace  		    Terraform workspace list
    To switch between workspaces: terraform workspace select default
    To delete : 			     terraform workspace delete wsname
	
	

# RESOURCES,DATA,VARIABLES

## Resources

VPC “aws_vpc” 

Subnets “aws_subnet”

Sub network within VPC, where you can assign custom security groups and other details
Assign a subnet to an availability zone

Security Group “aws_security_group” (Ingress - incoming bound rules)

## Data
		Read from a given data source and expose the result in the local name
		Dynamic element pulled at run time

		Key property : most_recent : true // if there are multiple search results, choose the most recent

## State
To map real world resources to your configuration
Use terraform state command

## Variables

Types - string,map,list
Eg: variables.tf

variable “newVariable” {
		 type = “string”,
		 default = “This is new variable”
}

variable “mapType” {
type = “map”
default = {
	Subnet1 = “subnet1”,
	Subnet2 = “subnet2”
         			}
}

variable “listType”{
Type = “list”
Default = [“item1”,”item2”]
}

To substitute it, “${var.newVariable}”      “${var.listType[“item1”]}

At run time, if you want to change the values, you can specify it in .tfvars file

Output Variable
Displayed at the end of terraform apply execution

In the variable file,
	output "first_output" {
    value = "First output form terraform"
}

output "cidr_block" {
    value = "${aws_subnet.subnet2.cidr_block}"
}

For bash use, you can use : terraform output “first_output”

Input Variable

For string, Entering variable without default value, makes it an input variable

Varible “newinputvariable” { type=”string” }  
When you do terraform apply, prompts for newinputvariable value (or)
Terraform apply -var ‘newinputvariable=newvalue’

Create a new file called .tfvar and provide values for the variables in it. Wont be prompted in run time to provide input

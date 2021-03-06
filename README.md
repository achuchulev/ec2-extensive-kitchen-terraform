# Test kitchen plugin "extensive kitchen-terraform" for testing Terraform configurations

## Purpose

The purpose of this repo is to use test kitchen plugin _extensive kitchen-terraform_ to test Terraform configuration

### Prerequisites

* AWS subscription
* AWS CLI
* Terraform

## How to use

#### Download the repo and go to the repo directory

```
git clone https://github.com/achuchulev/ec2-extensive-kitchen-terraform.git
cd ec2-extensive-kitchen-terraform/
```

#### Configure AWS CLI

Run `aws configure` and provide below information:

```
Your AWS Access Key ID
Your AWS Secret Access Key
Default region name
Default output format (json|text|table)
```

#### Generate ssh key pair to be used for new EC2 instances

Run `./key.sh`


#### Initialize Terraform

`terraform init`


#### Install bundler

```
gem install bundler
bundle install
```

### Run the test

Execute script `./test.sh`

The test script will do the following:

* Unset AWS STS session environment variables
* Export AWS STS session environment variables
* Destroy any existing Terraform state in us-east-1
* Initialize the Terraform working directory and select a new Terraform workspace to test CentOS in us-east-1
* Apply the Terraform root module to the Terraform state using the Terraform fixture configuration
* Test the Terraform state using the InSpec controls
* Destroy the Terraform state using the Terraform fixture configuration
* Perform the same steps for Ubuntu in us-west-2

#### Tree view of directory structure

```
.
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── README.md
├── key.sh
├── kitchen.yml
├── main.tf
├── outputs.tf
├── test
│   ├── assets
│   │   ├── key_pair
│   │   └── key_pair.pub
│   ├── fixtures
│   │   └── wrapper
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── integration
│       └── extensive_suite
│           ├── centos_attributes.yml
│           ├── controls
│           │   ├── inspec_attributes.rb
│           │   ├── operating_system.rb
│           │   ├── reachable_other_host.rb
│           │   └── state_file.rb
│           ├── inspec.yml
│           └── ubuntu_attributes.yml
├── test.sh
└── variables.tf
```

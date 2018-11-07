# Extensive kitchen-terraform plugin usage for testing terraform configurations

### Prerequisites

* AWS subscription
* AWS CLI
* Terraform

## How to test

#### Download the repo and go to the repo directory

```
git clone https://github.com/achuchulev/ec2-extensive-kitchen-terraform.git
cd ec2-extensive-kitchen-terraform/
```

#### Configure AWS CLI

Run `aws configure` and provide below information:

```
AWS Access Key ID
AWS Secret Access Key
Default region name
Default output format
```

#### Generate ssh key pair

Run `./key.sh`


#### Initialize Terraform

`terraform init`


#### Install bundler

```
gem install bundler
bundle install
```

### Use extensive kitchen-terraform 

Run `./test.sh`

The test script will do the following:

* Unset AWS STS session environment variables
* Export AWS STS session environment variables
* Destroy any existing Terraform state in us-east-1
* Initialize the Terraform working directory and select a new Terraform workspace to test CentOS in us-east-1
* Apply the Terraform root module to the Terraform state using the Terraform fixture configuration
* Test the Terraform state using the InSpec controls
* Destroy the Terraform state using the Terraform fixture configuration
* Perform the same steps for Ubuntu in us-west-2

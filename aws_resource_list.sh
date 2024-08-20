#!/bin/bash

############################################################################################

# Script to automate the process of listing all the resources in an AWS account

# Author: Moin Kazi/QI_Devops_Team
# Version: v0.0.1

# Following are the supported AWS services by the script
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS

# Usage: ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh us-east-1 EC2

############################################################################################

# Checking if required arguments are passed
if [ $# -ne 2 ]; then
   echo "Usage: $0 <region> <service_name>"
   exit 1
fi   

# Checking if AWS CLI is installed

if ! command -v aws &> /dev/null; then
  echo "AWS CLI is not installed, Please install and try again"
  exit 1
fi

# Checking if AWS CLI is configured

if [ ! -d ~/.aws ]; then
   echo "run aws configure command"
   exit 1
fi

# List the resources based on the service
case $2 in
   ec2)
      echo "Listing instances in $1"
      aws ec2 describe-instances --region $1
    ;;
   s3)
      echo "Listing s3 buckets in $1"
      aws s3 ls --region $1
    ;;
   rds)
      echo "Listing RDS instances in $1"
      aws rds describe-db-instances --region $1
    ;;
   cloudfront)
      echo " Listing cloudfront distribution in $1"
      aws cloudfront list-distributions --region $1
    ;;
    vpc)
       echo "Listing vpc in $1"
       aws ec2 describe-vpcs --region $1
    ;;
    iam)
       echo "Listing IAM users in $1"
       aws iam list-users --region $1
    ;;
    route53)
        echo "Listing route53 hosted zones in $1"
        aws route53 list-hosted-zones --region $1
    ;;
    cloudwatch)
        echo "Listing cloudwatch alarms in $1"
        aws cloudwatch describe-alarms --region $1
    ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $1"
        aws cloudformation describe-stacks --region $1
    ;;
    lambda)
        echo "Listing Lambda Functions in $1"
        aws lambda list-functions --region $1
    ;;
    sns)
        echo "Listing SNS Topics in $1"
        aws sns list-topics --region $1
    ;;
    sqs)
        echo "Listing SQS Queues in $1"
        aws sqs list-queues --region $1
    ;;
    dynamodb)
        echo "Listing dynamoDB tables in $1"
        aws dynamo list-tables --region $1
    ;;
    ebs)
        echo " Listing EBS volumes in $1"
        aws ec2 describe-volumes --region $1
    ;;
    *)
       echo "Invalid service. Please enter a valid service "
       exit 1
    ;;
esac                                             
       

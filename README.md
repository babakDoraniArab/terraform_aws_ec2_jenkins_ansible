# how to use 
you can have your own key.I have a Demo.pem key and I've download it before.

ok!first of all clone and run the below commands
`terraform init`

`terraform mft`

`terraform validate`

`terraform plan`

`terraform apply`

now you have your public_dns copy that and go to your `~/.ssh/config` file 
and make your connection like this 
```
Host jenkins
  Hostname ec2-11-222-333-62.eu-west-1.compute.amazonaws.com
  user ubuntu
  IdentityFile ~/Downloads/Demo.pem
  ```

  as you can see I've used my Demo.pem 

## if you want to see your instances with AWS CLI use the following command

  ```
aws ec2 describe-instances --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,Id:InstasnceId,PrivateIP:PrivateIpAddress,Name:Tags[?Key=='Name']|[0].Value,Type:InstanceType,Status:State.Name,VpcId:VpcId}" --filters Name=instance-state-name,Values=running --output table

  ``` 

## you can start and stop your machine with the following AWS_CLI command

`aws ec2 start-instances --instance-ids i-yourInstanceId `


`aws ec2 stop-instances --instance-ids i-yourInstanceId`

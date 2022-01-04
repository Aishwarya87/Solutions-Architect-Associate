Trying to create a fully scalable WordPress website.
Stateful

RDS in backend+ Multi AZ.

TO scale up, Aurora MySql+ Multi AZ+ Read Replicas
Less operations as well.

Storing IMAGES with EBS(for SINGLE INSTANCE application): 
  an ebs volume attached to the ec2.
  
  Problem: on scaling up, sending image in one and retrieving from other, can't be accessed.
  
Storing IMAGES with EFS(for DISTRIBUTED applications):
  EFS creates ENI into each AZ. at the backend, we have EFS.
  
  

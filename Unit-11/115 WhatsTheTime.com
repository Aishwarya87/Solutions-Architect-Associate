Stateless Web App
since dont need a database.

Attach an elastic IP Address to the Public EC2(T2).
Scaling vertically(T2 to M5) : downtime while upgrading to M5.
Scaling horizontally(3 M5s).
Users will leverage Route53 with A record(the dns would give a list of ips).

What if 1 instance is gone.
Since the TTL is 1 hour. the users connected to that instance will try to connect with the same instance for 1 hour.

now, Load Balancer:
PRIVATE ec2 instances with ELB+ Health Checks. Restricted security group rules between the LBs and the instances.
But this time, because of the load balancer: that changes its ip all the time, we use Alias Record.
No downtime for the users because of the Health Checks.

But, adding/removing instances is pretty hard to do.
Auto Scaling Group: instances scale on demand: scale in/scale out.
night time: less traffic; 

Multi AZ: to survive disasters. 
ELB+ Health Checks + Multi AZ.
if AZ1 goes down; have AZ2 and AZ3.
Makes the application highly AVAILABLE and RESILIENT.

Reserve Capacity because every AZ will have atleast 1 instance running.
to diminish the cost. 
reserved instances+ cost savings.
ON demand instances or Spot Instances.



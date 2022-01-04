Stateful Web App

Users should not lose their shopping Cart. 

Currently, from WhatsTheTime.com .

Because of the ELB, shopping cart can be lost on every request because the traffic is redirected to other instances than the previous one.

Introduce: ELB Stickiness(Session Affinity): every request goes to the same instance.

if an ec2 instance gets terminated, we still use the shopping cart.

Introduce: User Cookies/ Web Cookies: user stores the cart content.
Stalessness achieved. 
But HTTP request gets heavier.
Security Risk: shopping carts altered.
Cookies must be validated.
Cookies must be less than 4Kb(cannot store big datasets).

Introduce: Server Session.
Send session_id in web cookies; id to retrieve these contents is the session_id.
For storing sessions: 
Background: ElastiCache Cluster; Amazon DynamoDB(alternative).
Cart content added to the ElastiCache. 
secure 

Amazon RDS TO STORE/retrieve user data. RDS for long term storage.

Scaling Reads using RDS read replicas from the master.
We get 5 read replicas in RDS.

Alternative:Read from Cache(Write Through).
the information is cached.
cache hit/miss.
less traffic on RDS.
decrase the CPU usage on RDS.
But Cache Maintenance.

Multi AZ: Survive disasters.

Security Groups: 
  Open HTTP/HTTPS from anywhere to ELB.
  so on for other resources.








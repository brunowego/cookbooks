# System Design Interview

<!--
https://bytebytego.com
https://codemia.io
https://designgurus.io
https://tryexponent.com

https://udemy.com/course/system-design-interview-prep/?couponCode=KEEPLEARNINGBR
-->

## Terms

- Mock System Design Interview

## YouTube Channels

- [ByteByteGo](https://youtube.com/@ByteByteGo)
- [Exponent](https://youtube.com/@tryexponent)
- [Hello Interview](https://youtube.com/@hello_interview)

## Videos

- [Algorithms You Should Know Before System Design Interviews](https://youtube.com/watch?v=xbgzl2maQUU)
- [System Design Concepts Course and Interview Prep](https://youtube.com/watch?v=F2FmTdLtb_4)
- [System Design Interview: Design Whatsapp w/ a Ex-Meta Senior Manager](https://youtube.com/watch?v=cr6p0n0N-VA)

<!--
https://youtube.com/watch?v=DGtalg5efCw
https://youtube.com/watch?v=_K-eupuDVEc
-->

## Framework

1. Define the problem space
   - Ask lots of questions to clarify the problem
     - Functional requirements
       - What's in and out of scope?
       - Who are our clients?
       - Do we need to talk to pieces of the existing system?
       - What are the existing pieces?
       - What are the metrics of success?
     - Non-functional requirements
       - Scalability
       - High availability / Reliability
       - Low latency / Performance
       - Security
       - Maintainability
       - Usability
     - Core entities / Data model
       - User
       - Message
       - Group
       - Channel
       - Server
   - Don't get bogged down in the details
   - What is the expected volume of requests?
2. Design the system at a high level

   - Start by designing the APIs
   - What type of API we wanna use? (Explain why)
     - REST
     - GraphQL
     - gRPC
     - WebSocket
     - SOAP

   ```mermaid
   graph LR
     User([User]) --> APIServer[API server]

     APIServer --> UserService[User service]
     APIServer --> FriendshipService[Friendship service]
     APIServer --> TweetService[Tweet service]
     APIServer --> FeedService[Feed service]

     UserService --> UserDB1[(User database)]
     FriendshipService --> UserDB2[(User database)]
     TweetService --> UserDB3[(User database)]

     FeedService --> UserDB2
     FeedService --> UserDB3
     TweetService --> UserDB2
   ```

3. Deep dive into the design
4. Identify bottlenecks and scaling opportunities
   - Is there a single point of failure?
   - Is data available enough to require replication?
   - Try to consider edge-cases
5. Review and wrap up
   - What did we miss?

## Components

- Application Server
- Batch Processing
- Cache
- CDN
- Database
- Load Balancer
- Message Queue
- Pub/Sub
- Rate Limiter
- Search
- Stream Processing
- Web Server

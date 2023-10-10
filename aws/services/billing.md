# AWS Billing

<!--
https://s3-us-west-2.amazonaws.com/map-2.0-customer-documentation/html/latest/en/index.html
-->

## Links

- [Dashboard](https://console.aws.amazon.com/billing/home#/)
- Billing
  - [Bills](https://console.aws.amazon.com/billing/home#/bills)

## Glossary

- Month To Date (MTD)
- Simple Notification Service (SNS)

## Tips

### Billing Alarm

1. Go to [CloudWatch](https://us-east-1.console.aws.amazon.com/cloudwatch/home?region=us-east-1#home:) -> Alarms -> Billing
2. Create alarm
   - Step 1 - Specify metric and conditions
     - Namespace: AWS/Billing
     - Metric name: EstimatedCharges
     - Currency: USD
     - Statistic: Maximum
     - Period: 6 hours
     - Conditions:
       - Threshold type: Static
       - Whenever EstimatedCharges is...: Greater
       - than…: 10 USD
   - Step 2 - Notification
     - Alarm state trigger: In alarm
     - Send a notification to the following SNS topic: Create new topic
     - Create a new topic…: BillingAlarm
     - Create topic
     - Next
   - Step 3 - Add name and description
     - Alarm name: Billing Alarm
     - Alarm description: Send me an email if my bill goes over $10.
     - Next
   - Step 4 - Preview and create
     - Create alarm

### Create MAP & CUR

#### Step 1

1. [AWS Console / Migration Hub / Settings](https://console.aws.amazon.com/migrationhub/home?region=us-east-1#/settings)
2. Choose your region in "Migration Hub home region" / Select your region
3. In "Automatic redirect to home region" check "Automatically switch to my home region next time."

#### Step 2

1. [AWS Console / CloudFormation / Stacks](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks?filteringStatus=active&filteringText=&viewNested=true&hideStacks=false)
2. Create stack / With new resources (standard)
3. Create stack Tab
   - Prerequisite - Prepare template / Prepare template / Select "Template is ready"
   - Specify template / Template source / Select "Amazon S3 URL"
   - Specify template / Amazon S3 URL: `https://map-automation.s3.us-west-2.amazonaws.com/cur-server-ids-automator.yaml`
   - Next
4. Specify stack details Tab
   - Stack name / Stack name: MyOrg-MC
   - Parameters / MPE: `MPE11111`
   - Parameters / S3Region: Select your region
   - Next
5. Configure stack options -> Next
6. Review MyOrg-MC
   - Capabilities / Agree
   - Create stack
7. Outputs Tab -> Wait 5 minutes and click in Refresh -> Save "ServerID" value
8. Events Tab -> Wait progress to the end

#### Step 3

TODO

<!--
Waite 24 hours to accesses AWS Cost and Usage Reports

Enable tags

Access Denied
Cost allocation tags are managed at the payer account level.
-->

#### Step 4

TODO

<!--
[Cost allocation tags](https://console.aws.amazon.com/billing/home?region=us-east-1#/tags)
[AWS Cost and Usage Reports](https://console.aws.amazon.com/billing/home?region=us-east-1#/reports]
-->

#### Step 5

TODO

<!--
[Cost Anomaly Detection](https://console.aws.amazon.com/cost-management/home?#/anomaly-detection/home)
[Rightsizing recommendations](https://console.aws.amazon.com/cost-management/home?#/rightsizing)
-->

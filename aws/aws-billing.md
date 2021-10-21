# AWS Billing

<!--
https://s3-us-west-2.amazonaws.com/map-2.0-customer-documentation/html/latest/en/index.html
-->

## Docs

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
https://console.aws.amazon.com/billing/home?region=us-east-1#/tags
https://console.aws.amazon.com/billing/home?region=us-east-1#/reports
-->

#### Step 5

TODO

<!--
https://console.aws.amazon.com/cost-management/home?#/anomaly-detection/home
https://console.aws.amazon.com/cost-management/home?#/rightsizing
-->

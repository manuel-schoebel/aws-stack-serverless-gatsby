# aws-stack-serverless-gatsby
AWS stack setup using cloudformation for a static hosted gatsby website and serverless CI.

## Getting Started

### Prerequisites

- Install [Gatsby](https://www.gatsbyjs.org/docs/)
- Create a certificate on AWS using [ACM](https://console.aws.amazon.com/acm/home?region=us-east-1#/) **in region `us-east-1`** and note down the ARN
- Create a `config.env` file with your settings
    - Copy [config-template.env](config-template.env) and rename to config.env
    - `DOMAIN_NAME` is the main domain (e.g. example.com) without any sub-domains (not e.g. www.example.com)
- Make sure the files inside `bin/` are executable (`chmod +x bin/*`)

### Creating the Stack

In order to create the initial stack use:

`npm run stack:create`

Note: Especially the setup of the cloudfront will take a while, could be up to 30 minutes.

Once done setup the Name Server (NS) from the created Route 53 hosted zone and copy them to the DNS settings of your domain. Make sure the TTL is set to s.th. like 60 seconds before you update the NS, otherwise it will take long until the updates will apply.

### Creating the gatsby blog
- Follow instructions for the [Gatsby Starter Blog](https://github.com/gatsbyjs/gatsby-starter-blog)
- Initialize git inside the blog folder: 
    - `git init`
- Add the Code Commit repo as a remote: 
    - `git remote add origin https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/DOMAIN_NAME`

### Deploying the gatsby blog
- First commit to master
    - `git add .`
    - `git commit -m "Initial commit"`
- Push to remote master
    - `git push`
    - or if first push create upstream: `git push --set-upstream origin master`
- The CodePipeline on AWS will take care to build and deploy

## Authors

* **Manuel Schoebel** - [www.manuel-schoebel.com](https://www.manuel-schoebel.com)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments
- https://cloudonaut.io/pitfall-acm-certificate-cloudfront-cloudformation/
- https://github.com/velomash/aws-git-backed-gatsby-static-site
FROM ruby:2.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
RUN bundle install
COPY . /usr/src/app
COPY config/docker_newrelic_plugin.yml config/newrelic_plugin.yml

ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""
ENV NEW_RELIC_LICENSE_KEY ""
ENV MONITOR_EC2 false
ENV MONITOR_EBS false
ENV MONITOR_ELB false
ENV MONITOR_RDS false
ENV MONITOR_SQS false
ENV MONITOR_SNS false
ENV MONITOR_EC false
ENV MONITOR_ECR false
ENV REGION_US_EAST_1 false
ENV REGION_US_WEST_2 false
ENV REGION_US_WEST_1 false
ENV REGION_EU_WEST_1 false
ENV REGION_EU_CENTRAL_1 false
ENV REGION_AP_SOUTHEAST_1 false
ENV REGION_AP_NORTHEAST_1 false
ENV REGION_AP_SOUTHEAST_2 false
ENV REGION_AP_NORTHEAST_2 false
ENV REGION_SA_EAST_1 false
    
CMD ["bundle", "exec", "./bin/newrelic_aws"]

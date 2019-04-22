#!/bin/bash

## Prometheus operator deployment to strimzi ns
oc login -u system:admin
oc apply -f prometheus-crd.yml -n strimzi
oc process -f prometheus-operator.yml -p NAMESPACE=strimzi -p KAFKA_SERVICE_TEAM=aims | oc apply -f -


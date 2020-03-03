#!/bin/bash

## Prometheus operator deployment to strimzi ns
# oc login -u system:admin
oc apply -f prometheus-crd.yml -n strimzi
oc create secret generic alertmanager-alertmanager --from-file=alertmanager.yaml -n strimzi
oc process -f prometheus-operator.yml -p NAMESPACE=strimzi -p KAFKA_SERVICE_TEAM=aims | oc apply -f -
# oc process -f prometheus.yml -p NAMESPACE=kafka-1 | oc apply -f -

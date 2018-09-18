#!/bin/bash
# Waits for a deployment to complete before continue

NEXT_WAIT_TIME=0
PENDING_POD=$(kubectl get pod --all-namespaces --field-selector=status.phase!=Running | wc -l)

until [ $PENDING_POD -eq 0 ] || [ $NEXT_WAIT_TIME -eq 24 ]; do
   sleep $(( NEXT_WAIT_TIME++ ))
   echo "Waiting for ${PENDING_POD} deployment to be completed"
   PENDING_POD=$(kubectl get pod --all-namespaces --field-selector=status.phase!=Running | wc -l)
done

echo "Timeout 300 seconds exceeded. Please check your configuration"
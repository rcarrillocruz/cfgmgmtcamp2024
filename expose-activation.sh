#!/bin/bash
#
kubectl -n eda-server-operator-system port-forward $(kubectl -n eda-server-operator-system get svc -l app=eda -oname) 5000:5000

#!/bin/bash

curl -X POST --data-binary '{"id":1,"orgId":1,"name":"Graphite","type"","url":"http://localhost:8000","password":"","user":"","database":"","basicAuth":false,"basicAuthUser":"","basicAuthPassword":"","isDefault":false,"jsonData":null}' http://admin:admin@localhost:80/api/datasources -H 'Content-Type: application/json;charset=UTF-8'

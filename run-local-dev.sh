#!/bin/bash
export PATH=$PATH:$(go env GOPATH)/bin
export VIKUNJA_SERVICE_PUBLICURL=http://localhost:3456
export VIKUNJA_DATABASE_TYPE=postgres
export VIKUNJA_DATABASE_HOST=localhost:5433
export VIKUNJA_DATABASE_DATABASE=vikunja
export VIKUNJA_DATABASE_USER=vikunja
export VIKUNJA_DATABASE_PASSWORD=vikunja123
export VIKUNJA_LOG_LEVEL=DEBUG

./vikunja web

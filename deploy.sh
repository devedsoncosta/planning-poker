#!/bin/bash
git pull origin main
docker stack deploy -c docker-compose.yml poker-stack

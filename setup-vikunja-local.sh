#!/bin/bash
set -e

echo "🚀 Setting up local Vikunja instance..."

# Start the containers
echo "📦 Starting containers..."
docker compose -f docker-compose.vikunja-local.yml up -d

# Wait for PostgreSQL to be ready
echo "⏳ Waiting for PostgreSQL to be ready..."
sleep 5

# Import the database dump
echo "📥 Importing database backup..."
docker exec -i vikunja-local-db psql -U vikunja -d vikunja < vikunja-backup.sql

echo ""
echo "✅ Local Vikunja setup complete!"
echo ""
echo "📍 Vikunja is now running at: http://localhost:8081"
echo "🗄️  PostgreSQL is running on port 5433"
echo ""
echo "Database credentials:"
echo "  Host: localhost:5433"
echo "  Database: vikunja"
echo "  User: vikunja"
echo "  Password: vikunja123"
echo ""
echo "To stop: docker compose -f docker-compose.vikunja-local.yml down"
echo "To view logs: docker logs vikunja-local -f"

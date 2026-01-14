# BeauTV Vikunja Local Development Setup

This directory contains the production Vikunja database from BeauTV and setup scripts for local development testing.

## Files

- **vikunja-backup.sql** - Production database dump from vikunja.v-diversity.de (122KB)
- **docker-compose.vikunja-local.yml** - Docker Compose configuration for local testing
- **setup-vikunja-local.sh** - Automated setup script

## Quick Start

### Option 1: Automated Setup (Recommended)

Run the setup script to start everything automatically:

```bash
cd ~/git/vikunja
./setup-vikunja-local.sh
```

This will:
1. Start PostgreSQL and Vikunja containers
2. Import the production database dump
3. Make Vikunja available at http://localhost:8081

### Option 2: Manual Setup

If you want more control or need to troubleshoot:

1. **Start the containers:**
```bash
docker compose -f docker-compose.vikunja-local.yml up -d
```

2. **Wait for PostgreSQL to be ready:**
```bash
docker logs vikunja-local-db --tail 10
```

3. **Import the database:**
```bash
docker exec -i vikunja-local-db psql -U vikunja -d vikunja < vikunja-backup.sql
```

4. **Access Vikunja:**
   - Open http://localhost:8081 in your browser
   - Use your existing production credentials

## Configuration

### Services

- **Vikunja Web UI:** http://localhost:8081
- **PostgreSQL Database:** localhost:5433

### Database Credentials

- Host: `localhost`
- Port: `5433`
- Database: `vikunja`
- User: `vikunja`
- Password: `vikunja123`

### Docker Containers

- `vikunja-local` - Vikunja application
- `vikunja-local-db` - PostgreSQL 15

## Testing Your Fork

To test your Vikunja fork with the production data:

1. **Build your fork:**
```bash
# Make sure you're in the vikunja directory
cd ~/git/vikunja

# Build your local version
docker build -t vikunja-fork:latest .
```

2. **Update docker-compose to use your fork:**
```bash
# Edit docker-compose.vikunja-local.yml
# Change:
#   image: vikunja/vikunja:latest
# To:
#   image: vikunja-fork:latest
```

3. **Restart with your fork:**
```bash
docker compose -f docker-compose.vikunja-local.yml down
docker compose -f docker-compose.vikunja-local.yml up -d
```

4. **View logs:**
```bash
docker logs vikunja-local -f
```

## Useful Commands

### View Logs
```bash
# Vikunja logs
docker logs vikunja-local -f

# Database logs
docker logs vikunja-local-db -f
```

### Access Database
```bash
# Using psql in the container
docker exec -it vikunja-local-db psql -U vikunja -d vikunja

# Or from your host (if you have psql installed)
psql -h localhost -p 5433 -U vikunja -d vikunja
```

### Stop Everything
```bash
docker compose -f docker-compose.vikunja-local.yml down
```

### Stop and Remove Data
```bash
docker compose -f docker-compose.vikunja-local.yml down -v
```

### Restart from Scratch
```bash
# Remove everything
docker compose -f docker-compose.vikunja-local.yml down -v

# Run setup again
./setup-vikunja-local.sh
```

## Production Environment Reference

The backup was taken from:
- **URL:** https://vikunja.v-diversity.de
- **Database:** PostgreSQL 15
- **Production Compose:** `/opt/beautv2/docker-compose.prod.yml`
- **Server:** PiaServer (159.195.40.84)

Production configuration:
```yaml
environment:
  VIKUNJA_DATABASE_TYPE: postgres
  VIKUNJA_DATABASE_HOST: postgres
  VIKUNJA_DATABASE_DATABASE: vikunja
  VIKUNJA_DATABASE_USER: vikunja
  VIKUNJA_SERVICE_PUBLICURL: http://vikunja.v-diversity.de
```

## Troubleshooting

### Port Already in Use
If ports 8081 or 5433 are already in use, edit `docker-compose.vikunja-local.yml` and change:
- `"8081:3456"` to `"8082:3456"` (or any other free port)
- `"5433:5432"` to `"5434:5432"` (or any other free port)

### Database Import Fails
Make sure PostgreSQL is fully ready before importing:
```bash
docker exec vikunja-local-db pg_isready -U vikunja
```

### Vikunja Won't Start
Check if the database connection is working:
```bash
docker logs vikunja-local --tail 50
```

### Reset Everything
```bash
docker compose -f docker-compose.vikunja-local.yml down -v
docker volume rm vikunja_local_data vikunja_local_files 2>/dev/null || true
./setup-vikunja-local.sh
```

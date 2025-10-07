# Security Policy

## Supported Versions

Use this section to tell people about which versions of your project are
currently being supported with security updates.

| Version | Supported          |
| ------- | ------------------ |
| 5.1.x   | :white_check_mark: |
| 5.0.x   | :x:                |
| 4.0.x   | :white_check_mark: |
| < 4.0   | :x:                |

## Reporting a Vulnerability

Use this section to tell people how to report a vulnerability.

Tell them where to go, how often they can expect to get an update on a
reported vulnerability, what to expect if the vulnerability is accepted or
declined, etc.

## Default Data and Seed Files Policy

**⚠️ IMPORTANT: Do not commit seed data or configuration files to the `default_data/` directory.**

The `default_data/` directory is intentionally kept empty in version control to prevent:
- Exposure of potentially sensitive configuration values
- Accidental inclusion of production data
- Security vulnerabilities from default credentials or test data

### Recommended Alternatives for Data Seeding

Instead of using committed files in `default_data/`, please use one of these secure alternatives:

1. **Database Migrations**: Use CakePHP migrations (`config/Migrations/`) to create and seed database structures
2. **Environment Variables**: Store configuration in `.env` files (never committed to git)
3. **Admin UI**: Use the application's admin interface to create initial data
4. **Runtime Fixtures**: For testing, create fixtures programmatically or use test-specific fixture files

### Using the default_data Commands

The `default_data_import` and `default_data_export` commands are available for local development:

```bash
# Export current database data to JSON files (for backup/migration)
docker compose exec willowcms bin/cake default_data_export

# Import data from JSON files (if you have local seed files)
docker compose exec willowcms bin/cake default_data_import
```

**Note**: These commands work with local files only. Keep any generated JSON files in `default_data/` 
out of version control. The `.gitignore` is configured to prevent accidental commits.

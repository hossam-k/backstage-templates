# ${{ values.name }}

${{ values.description }}

## Stack

- Ruby ${{ values.rubyVersion }}
- Rails ${{ values.railsVersion }}
- Database: ${{ values.database }}
{%- if values.apiOnly %}
- API-only application
{%- endif %}

## Getting started

```bash
bundle install
bin/rails db:setup
bin/rails server
```

## Owner

${{ values.owner }}

# Installing this template in Backstage

1. **Push this folder** to a git repo Backstage can reach (e.g. your `backstage-templates` repo),
   keeping the structure:
   ```
   rails-service/
     template.yaml
     skeleton/
       catalog-info.yaml
       Gemfile
       Dockerfile
       README.md
       mkdocs.yml
       .gitignore
       config/
         application.rb
         database.yml
       docs/
         index.md
   ```

2. **Register the template location** in your `app-config.yaml`:
   ```yaml
   catalog:
     locations:
       - type: url
         target: https://github.com/<org>/backstage-templates/blob/main/rails-service/template.yaml
         rules:
           - allow: [Template]
   ```
   (Or add it via the "Register Existing Component" UI page instead of editing config.)

3. **Ensure the GitHub integration is configured** (`integrations.github` in `app-config.yaml`,
   with a token that has repo-creation scope) since the template uses `publish:github`.
   If you use GitLab/Bitbucket instead, swap the `publish:github` step for
   `publish:gitlab` / `publish:bitbucket` and adjust `allowedHosts` in the `RepoUrlPicker`.

4. Restart/reload Backstage — the template will appear under **Create... → Ruby on Rails Service**.

## Notes

- The skeleton is a curated set of Rails config files (not a full `rails new` output). Extend
  `skeleton/` with the rest of a standard Rails app structure (`app/`, `bin/`, `config/environments/`,
  `config/initializers/`, `config/routes.rb`, `spec/`, etc.) to match your org's baseline app.
- All skeleton files use Nunjucks templating (`${{ values.xxx }}` / `{%- if -%}`) — this is the
  standard Backstage `fetch:template` syntax, evaluated against the `parameters` the user fills in.
- If you'd rather generate a *real* fresh Rails app at scaffold time (running `rails new` itself)
  instead of a static skeleton, that requires a custom scaffolder action (Backstage's built-in
  actions don't shell out arbitrarily) — happy to write that action if you want this instead.

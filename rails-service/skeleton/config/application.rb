require_relative "boot"

require "rails"
{%- if values.apiOnly %}
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
{%- else %}
require "rails/all"
{%- endif %}

Bundler.require(*Rails.groups)

module {{ values.name | replace("-", "_") | capitalize }}
  class Application < Rails::Application
    config.load_defaults ${{ values.railsVersion }}
    {%- if values.apiOnly %}
    config.api_only = true
    {%- endif %}
  end
end

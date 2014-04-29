# <%= metadata.name %> cookbook

<%= metadata.description %>

# Requirements

<%- unless metadata.platforms.empty? %>
## Platforms

  <%- metadata.platforms.each do |name, version| %>
* <%= name %> <%= version %>
  <%- end %>

<%- end %>
<%- unless metadata.dependencies.empty? %>
## Dependencies

  <%- metadata.dependencies.each do |name, version| %>
* `<%= name %> <%= version %>`
  <%- end %>

<%- end %>
<%- unless metadata.recommendations.empty? %>
## Recommendations

  <% metadata.recommendations.each do |name, version| %>
* `<%= name %> <%= version %>`
  <% end %>

<%- end %>
<%- unless metadata.suggestions.empty? %>
## Suggestions

  <%- metadata.suggestions.each do |name, version| %>
* `<%= name %> <%= version %>`
  <%- end %>

<%- end %>
<%- unless metadata.conflicting.empty? %>
## Conflicts

  <%- metadata.conflicting.each do |name, version| %>
* `<%= name %>` `<%= version %>`
  <%- end %>

<%- end %>
# Attributes

<%- metadata.attributes.each do |name, data| %>
* `node['<%= name.split('/').join('][') %>']` - <%= data[:description] %>
  * Type: `<%= data[:type] %>`
  * Default: `<%= data[:default] %>`
  * Requirement: `<%= data[:required] %>`
  <%- unless data[:choice].empty? %>
  * Choices
    <%- data[:choice].each do |choice| %>
    * `<%= choice %>`
    <%- end %>
  <%- end %>
<%- end %>

# Recipes

<%- metadata.recipes.each do |name, description| %>
* `<%= name %>` - <%= description %>
<%- end %>

# Usage

Just include `recipe[<%= metadata.name %>]` in your node's `run_list`

# License and Authors

- Author: <%= metadata.maintainer %> (<<%= metadata.maintainer_email %>>)

```text
Copyright (C) <%= Time.now.year %> <%= metadata.maintainer %>

<%= metadata.license %>
```

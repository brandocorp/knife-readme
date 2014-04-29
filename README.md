# Knife Readme

Generate a default README file for a cookbook based on its metadata file.

## Installation

Add this line to your application's Gemfile:

    gem 'knife-readme'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knife-readme

## Usage

    knife cookbook readme COOKBOOK (options)

## Example

Create a new cookbook

```
$ knife cookbook create bozomatic
** Creating cookbook bozomatic
** Creating README for cookbook: bozomatic
** Creating CHANGELOG for cookbook: bozomatic
** Creating metadata for cookbook: bozomatic
** Creating specs for cookbook: bozomatic
```

Define your cookbooks [metadata](/examples/metadata.rb/)
Generate your base README.md from your metadata

> *Warning*: This operation is currently destructive!

```
$ knife cookbook readme bozomatic
Generated README for bozomatic at /path/to/cookbooks/bozomatic/README.md
```

The output should look like [this](/examples/README.md/)

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

###### Create a new cookbook

```
$ knife cookbook create bozomatic
** Creating cookbook bozomatic
** Creating README for cookbook: bozomatic
** Creating CHANGELOG for cookbook: bozomatic
** Creating metadata for cookbook: bozomatic
** Creating specs for cookbook: bozomatic
```

###### Define your cookbooks metadata

```ruby
name             'bozomatic'
maintainer       'Bozo D. Clown'
maintainer_email 'bozo@clownshoes.com'
license          'Apache 2.0'
description      'Provides Support for Bozo'
long_description 'Helps Bozo by providing support in preparing for his show'
version          '0.1.0'

%w(centos redhat oracle).each do |os|
  supports os
end
supports 'ubuntu', '>= 12.04'

recommends 'clown_college'
depends 'clown_car', '~> 1.0.0'

recipe 'bozomatic::prepare_show', 'Prepares for the show'
recipe 'bozomatic::makeup', 'Applies all required makeup'
recipe 'bozomatic::clown_shoes', 'Finds the requisite pair of clown shoes'

attribute "bozomatic/shoe_size",
  :display_name => "Shoe Size",
  :description => "The required shoe size",
  :required => "required",
  :type => "string",
  :default => "14",
  :choice => [],
  :recipes => [ "bozomatic::clown_shoes" ]

attribute "bozomatic/nose_color",
  :display_name => "Nose Color",
  :description => "The required nose color",
  :required => "required",
  :type => "string",
  :default => "red",
  :choice => [
    'red',
    'green',
    'blue'
  ],
  :recipes => [ "bozomatic::makeup" ]

attribute "bozomatic/timezone",
  :display_name => "Timezone",
  :description => "The shows timezone",
  :required => "optional",
  :type => "string",
  :default => "",
  :choice => [],
  :recipes => [ "bozomatic::prepare_show" ]
```

###### Generate your base README.md from your metadata

> *Warning*: This operation is currently destructive!

```
$ knife cookbook readme bozomatic
Generated README for bozomatic at $COOKBOOKS/bozomatic/README.md
```

The output should look like [this](/examples/README.md/)

```markdown
# bozomatic cookbook

Provides Support for Bozo

# Requirements

## Platforms

* centos >= 0.0.0
* redhat >= 0.0.0
* oracle >= 0.0.0
* ubuntu >= 12.04

## Dependencies

* `clown_car ~> 1.0.0`

## Recommendations

* `clown_college >= 0.0.0`

# Attributes

* `node['bozomatic][shoe_size']` - The required shoe size
  * Type: `string`
  * Default: `14`
  * Requirement: `required`
* `node['bozomatic][nose_color']` - The required nose color
  * Type: `string`
  * Default: `red`
  * Requirement: `required`
  * Choices
    * `red`
    * `green`
    * `blue`
* `node['bozomatic][timezone']` - The shows timezone
  * Type: `string`
  * Default: ``
  * Requirement: `optional`

# Recipes

* `bozomatic::prepare_show` - Prepares for the show
* `bozomatic::makeup` - Applies all required makeup
* `bozomatic::clown_shoes` - Finds the requisite pair of clown shoes

# Usage

Just include `bozomatic` in your node's `run_list`

# License and Authors

Author:: Bozo D. Clown (<bozo@clownshoes.com>)

Copyright:: 2014, Bozo D. Clown

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

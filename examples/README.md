# bozomatic cookbook

Provides Support for Bozo

## Requirements

### Platforms

* centos >= 0.0.0
* redhat >= 0.0.0
* oracle >= 0.0.0
* ubuntu >= 12.04

### Dependencies

* `clown_car ~> 1.0.0`

### Recommendations

* `clown_college >= 0.0.0`

## Attributes

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

## Recipes

* `bozomatic::prepare_show` - Prepares for the show
* `bozomatic::makeup` - Applies all required makeup
* `bozomatic::clown_shoes` - Finds the requisite pair of clown shoes

## Usage

Just include `recipe[bozomatic]` in your node's `run_list`

## License and Authors

- Author: Bozo D. Clown (<bozo@clownshoes.com>)

```text

Copyright (C) 2014 Bozo D. Clown

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

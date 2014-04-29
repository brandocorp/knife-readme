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


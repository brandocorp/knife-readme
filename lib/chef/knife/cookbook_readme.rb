# Encoding: utf-8
#
#
# Copyright: Copyright (c) 2014
#   License: Apache License, Version 2.0
#    Author: Brandon Raabe (<brandocorp@gmail.com>)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'pry'
require 'erubis'
require 'chef/knife'

class Chef
  class Knife
    class CookbookReadme < Knife

      deps do
        require 'chef/cookbook/metadata'
      end

      banner "knife cookbook readme COOKBOOK (options)"

      option :cookbook_path,
        :short => "-o PATH:PATH",
        :long => "--cookbook-path PATH:PATH",
        :description => "A colon-separated path to look for cookbooks in",
        :proc => lambda { |o| o.split(":") }

      option :readme_format,
        :short => "-f FORMAT",
        :long => "--readme-format FORMAT",
        :description => "The format of the generated readme file",
        :default => 'md'

      option :license,
        :short => "-l FORMAT",
        :long => "--license TYPE",
        :description => "The license text to place in the readme file",
        :default => 'apachev2'

      def run
        config[:cookbook_path] ||= Chef::Config[:cookbook_path]
        cookbook_name = @name_args[0]
        if cookbook_name.nil? || cookbook_name.empty?
          ui.error "You must specify the cookbook to generate metadata for, or use the --all option."
          exit 1
        end
        generate_readme(cookbook_name)
      end

      def generate_readme(cookbook)
        metadata = generate_metadata(cookbook)
        File.open(readme_path, 'w+') do |f|
          f.write render_readme(metadata)
        end
        ui.info("Generated README for #{cookbook} at #{readme_path}")
      end

      def render_readme(metadata)
        metadata.license license_text
        Erubis::Eruby.new(template).result(binding)
      end

      def license
        @license ||= config[:license]
      end

      def license_text
        IO.read(File.join(File.dirname(__FILE__), 'template', license))
      end

      def template
        IO.read(File.join(File.dirname(__FILE__), 'template', 'README.' + format))
      end

      def format
        @format ||= config[:readme_format]
      end

      def generate_metadata(cookbook)
        cookbook_path(cookbook)
        unless File.exists?(metadata_path)
          ui.error "ERROR: The cookbook '#{cookbook}' does not contain a metadata.rb file."
        end
        generate_metadata_from_file(cookbook, metadata_path)
      end

      def metadata_path
        @metadata_path ||=
          File.expand_path(File.join(cookbook_path, 'metadata.rb'))
      end

      def readme_path
        @readme_path ||=
          File.expand_path(File.join(cookbook_path, 'README.' +  format ))
      end

      def cookbook_path(cookbook = nil)
        @cookbook_path ||= locate_cookbook_path(cookbook)
      end

      def locate_cookbook_path(cookbook)
        raise if cookbook.nil?
        Array(config[:cookbook_path]).reverse.each do |path|
          path = File.join(path, cookbook)
          return path if File.exists? path
        end
      end

      def generate_metadata_from_file(cookbook, file)
        md = Chef::Cookbook::Metadata.new
        md.name(cookbook)
        md.from_file(file)
        md
      rescue Exceptions::ObsoleteDependencySyntax, Exceptions::InvalidVersionConstraint => e
        ui.stderr.puts "ERROR: The cookbook '#{cookbook}' contains invalid or obsolete metadata syntax."
        ui.stderr.puts "in #{file}:"
        ui.stderr.puts
        ui.stderr.puts e.message
        exit 1
      end

    end
  end
end

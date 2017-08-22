# Copyright 2017 Google Inc.
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

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by puppet-codegen and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'puppet/property'

module Google
  module Sql
    module Data
      # A class to manage data for failover_replica for instance.
      class InstancFailoveReplica
        include Comparable

        attr_reader :available
        attr_reader :name

        def to_json(_arg = nil)
          {
            'available' => available,
            'name' => name
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            available: available,
            name: name
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstancFailoveReplica
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstancFailoveReplica
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        private

        def compare_fields(other)
          [
            { self: available, other: other.available },
            { self: name, other: other.name }
          ]
        end
      end

      # Manages a InstancFailoveReplica nested object
      # Data is coming from the GCP API
      class InstancFailoveReplicaApi < InstancFailoveReplica
        def initialize(args)
          @available =
            Google::Sql::Property::Boolean.api_munge(args['available'])
          @name = Google::Sql::Property::String.api_munge(args['name'])
        end
      end

      # Manages a InstancFailoveReplica nested object
      # Data is coming from the Puppet manifest
      class InstancFailoveReplicaCatalog < InstancFailoveReplica
        def initialize(args)
          @available =
            Google::Sql::Property::Boolean.unsafe_munge(args['available'])
          @name = Google::Sql::Property::String.unsafe_munge(args['name'])
        end
      end
    end

    module Property
      # A class to manage input to failover_replica for instance.
      class InstancFailoveReplica < Puppet::Property
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::InstancFailoveReplicaCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::InstancFailoveReplicaApi.new(value)
        end
      end
    end
  end
end

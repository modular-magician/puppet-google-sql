# Copyright 2018 Google Inc.
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
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/sql/property/boolean'
require 'google/sql/property/integer'
require 'google/sql/property/string'
require 'google/sql/property/string_array'
require 'puppet'

Puppet::Type.newtype(:gsql_flag) do
  @doc = 'Represents a flag that can be configured for a Cloud SQL instance.'

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  newparam :credential do
    desc <<-DESC
      A gauth_credential name to be used to authenticate with Google Cloud
      Platform.
    DESC
  end

  newparam(:project) do
    desc 'A Google Cloud Platform project to manage.'
  end

  newparam(:name, namevar: true) do
    # TODO(nelsona): Make this description to match the key of the object.
    desc 'The name of the Flag.'
  end

  newproperty(:allowed_string_values, parent: Google::Sql::Property::StringArray) do
    desc 'For STRING flags, List of strings that the value can be set to. (output only)'
  end

  newproperty(:applies_to, parent: Google::Sql::Property::StringArray) do
    desc 'The database versions this flag is supported for. (output only)'
  end

  newproperty(:max_value, parent: Google::Sql::Property::Integer) do
    desc 'For INTEGER flags, the maximum allowed value. (output only)'
  end

  newproperty(:min_value, parent: Google::Sql::Property::Integer) do
    desc 'For INTEGER flags, the minimum allowed value. (output only)'
  end

  newproperty(:name, parent: Google::Sql::Property::String) do
    desc <<-DOC
      This is the name of the flag. Flag names always use underscores, not hyphens, e.g.
      max_allowed_packet
    DOC
  end

  newproperty(:requires_restart, parent: Google::Sql::Property::Boolean) do
    desc <<-DOC
      Indicates whether changing this flag will trigger a database restart. Only applicable to
      Second Generation instances. (output only)
    DOC
    newvalue(:true)
    newvalue(:false)
  end

  newproperty(:type, parent: Google::Sql::Property::String) do
    desc <<-DOC
      The type of the flag. Flags are typed to being BOOLEAN, STRING, INTEGER or NONE. NONE is used
      for flags which do not take a value, such as skip_grant_tables. (output only)
    DOC
  end
end

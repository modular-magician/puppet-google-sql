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

require 'google/sql/property/instance_name'
require 'google/sql/property/string'
require 'puppet'

Puppet::Type.newtype(:gsql_database) do
  @doc = "Represents a SQL database inside the Cloud SQL instance, hosted in Google's cloud."

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  autorequire(:gsql_instance) do
    reference = self[:instance]
    raise "#{ref} required property 'instance' is missing" if reference.nil?
    reference.autorequires
  end

  ensurable

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
    desc 'The name of the Database.'
  end

  newparam(:instance, parent: Google::Sql::Property::InstancNameRef) do
    desc 'The name of the Cloud SQL instance. This does not include the project ID.'
  end

  newproperty(:charset, parent: Google::Sql::Property::String) do
    desc 'The MySQL charset value.'
  end

  newproperty(:collation, parent: Google::Sql::Property::String) do
    desc 'The MySQL collation value.'
  end

  newproperty(:name, parent: Google::Sql::Property::String) do
    desc <<-DOC
      The name of the database in the Cloud SQL instance. This does not include the project ID or
      instance name.
    DOC
  end
end

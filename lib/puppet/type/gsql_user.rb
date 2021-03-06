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

Puppet::Type.newtype(:gsql_user) do
  @doc = <<-DOC
    The Users resource represents a database user in a Cloud SQL instance.
  DOC

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
    desc 'The name of the User.'
  end

  newparam(:instance, parent: Google::Sql::Property::InstancNameRef) do
    desc 'A reference to Instance resource'
  end

  newparam(:password, parent: Google::Sql::Property::String) do
    desc 'The password for the user.'
  end

  newproperty(:host, parent: Google::Sql::Property::String) do
    desc <<-DOC
      The host name from which the user can connect. For insert operations,
      host defaults to an empty string. For update operations, host is
      specified as part of the request URL. The host name cannot be updated
      after insertion.
    DOC
  end

  newproperty(:name, parent: Google::Sql::Property::String) do
    desc 'The name of the user in the Cloud SQL instance.'
  end
end

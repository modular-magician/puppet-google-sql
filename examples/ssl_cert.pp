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

# Getting Started
# ---------------
# The following example requires two environment variables to be set:
#     * cred_path - a path to a JSON service account file
#     * project - the name of your GCP project
#
# If running from the command line you can pass these via Facter:
#
#   FACTER_cred_path=/path/to/my/cred.json \
#   FACTER_project='my-test-project'
#       puppet apply examples/ssl_cert.pp
#
# For convenience you optionally can add it to your ~/.bash_profile (or the
# respective .profile settings) environment:
#
#   export FACTER_cred_path=/path/to/my/cred.json
#   export FACTER_project='my-test-project'
#
# Authentication to GCP
# ---------------
# `gauth_credential` defines a credential to be used when communicating with
# Google Cloud Platform.
#
# For more information on the gauth_credential parameters and providers please
# refer to its detailed documentation at:
#
#   https://forge.puppet.com/google/gauth
#
gauth_credential { 'mycred':
  path     => $cred_path, # e.g. '/home/nelsonjr/my_account.json'
  provider => serviceaccount,
  scopes   => [
    'https://www.googleapis.com/auth/sqlservice.admin',
  ],
}

# TODO(alexstephen): Change this warning and remove the "requires to to exists"
# once a resource reference is added (it will enforce that automatically).
#
# This example requires an instance to exist. You should set
# FACTER_sql_instance_suffix, or use any other Puppet # supported way, to set a
# global variable $sql_instance_suffix.
#
# For example you can define the fact to be an always increasing value:
#
# $ FACTER_sql_instance_suffix=100 puppet apply examples/user.pp
#
# If that instance does not exist in your project run the examples/instance.pp
# to create it, with the same $sql_instance_suffix.
if !defined('$sql_instance_suffix') {
  fail('For this example to run you need to define a fact named
       "sql_instance_suffix". Please refer to the documentation inside
       the example file "examples/ssl_cert.pp"')
}

gsql_instance { "sql-test-${sql_instance_suffix}":
  ensure     => present,
  project    => $project, # e.g. 'my-test-project'
  credential => 'mycred',
}

gsql_ssl_cert { 'server-certificate':
  cert_serial_number => '729335786',
  common_name        => 'CN=www.mydb.com,O=Acme',
  sha1_fingerprint   => '8fc295bf77a002db5182e04d92c48258cbc1117a',
  instance           => "sql-test-${sql_instance_suffix}",
  project            => $project, # e.g. 'my-test-project'
  credential         => 'mycred',
}

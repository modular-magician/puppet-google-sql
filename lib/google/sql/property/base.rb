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

require 'puppet/property'

module Google
  module Sql
    module Property
      # A Puppet property that can compare its values
      class Base < Puppet::Property
        def insync?(is)
          debug("insync? #{name}: '#{is}' == '#{should}'")
          insync = false
          insync = true if is == :absent && should == :absent
          insync = (is == should) unless is == :absent || should == :absent
          debug("insync? #{name}: '#{is}' == '#{should}': #{insync}")
          resource.provider.dirty name, is, should unless insync
          insync
        end
      end
    end
  end
end

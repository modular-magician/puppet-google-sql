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

require 'google/hash_utils'
require 'google/sql/network/get'
require 'google/sql/network/put'
require 'google/sql/property/integer'
require 'google/sql/property/string'
require 'google/sql/property/string_array'
require 'puppet'

Puppet::Type.type(:gsql_tier).provide(:google) do
  mk_resource_methods

  def self.instances
    debug('instances')
    raise [
      '"puppet resource" is not supported at the moment:',
      'TODO(nelsonjr): https://goto.google.com/graphite-bugs-view?id=167'
    ].join(' ')
  end

  def self.prefetch(resources)
    Puppet.warning [
      "gsql_tier will be deprecated in a future release.",
      "You can use strings to reference GCP Tier.",
      "A gsql_tier is no longer necessary"
    ].join(" ")
    debug('prefetch')
    resources.each do |name, resource|
      project = resource[:project]
      debug("prefetch #{name}") if project.nil?
      debug("prefetch #{name} @ #{project}") unless project.nil?
      fetch = fetch_wrapped_resource(resource, 'sql#tier', 'sql#tiersList', 'items')
      resource.provider = present(name, fetch) unless fetch.nil?
    end
  end

  def self.present(name, fetch)
    result = new({ title: name, ensure: :present }.merge(fetch_to_hash(fetch)))
    result
  end

  def self.fetch_to_hash(fetch)
    {
      disk_quota: Google::Sql::Property::Integer.api_munge(fetch['DiskQuota']),
      ram: Google::Sql::Property::Integer.api_munge(fetch['RAM']),
      region: Google::Sql::Property::StringArray.api_munge(fetch['region'])
    }.reject { |_, v| v.nil? }
  end

  def flush
    debug('flush')
    # return on !@dirty is for aiding testing (puppet already guarantees that)
    return if @created || @deleted || !@dirty
    raise('Cloud SQL tier does not match expectations.')
  end

  def dirty(field, from, to)
    @dirty = {} if @dirty.nil?
    @dirty[field] = {
      from: from,
      to: to
    }
  end

  private

  def self.resource_to_hash(resource)
    {
      project: resource[:project],
      name: resource[:name],
      kind: 'sql#tier',
      disk_quota: resource[:disk_quota],
      ram: resource[:ram],
      region: resource[:region],
      tier: resource[:tier]
    }.reject { |_, v| v.nil? }
  end

  def resource_to_request
    request = {
      kind: 'sql#tier'
    }.reject { |_, v| v.nil? }
    debug "request: #{request}" unless ENV['PUPPET_HTTP_DEBUG'].nil?
    request.to_json
  end

  def unwrap_resource_filter(resource)
    self.class.unwrap_resource_filter(resource)
  end

  def self.unwrap_resource_filter(resource)
    {
      tier: resource[:tier]
    }
  end

  def fetch_auth(resource)
    self.class.fetch_auth(resource)
  end

  def self.fetch_auth(resource)
    Puppet::Type.type(:gauth_credential).fetch(resource)
  end

  def debug(message)
    puts("DEBUG: #{message}") if ENV['PUPPET_HTTP_VERBOSE']
    super(message)
  end

  def self.collection(data)
    URI.join(
      'https://www.googleapis.com/sql/v1beta4/',
      expand_variables(
        'projects/{{project}}/tiers',
        data
      )
    )
  end

  def collection(data)
    self.class.collection(data)
  end

  def self.self_link(data)
    URI.join(
      'https://www.googleapis.com/sql/v1beta4/',
      expand_variables(
        'projects/{{project}}/tiers',
        data
      )
    )
  end

  def self_link(data)
    self.class.self_link(data)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def self.return_if_object(response, kind)
    raise "Bad response: #{response.body}" \
      if response.is_a?(Net::HTTPBadRequest)
    raise "Bad response: #{response}" \
      unless response.is_a?(Net::HTTPResponse)
    return if response.is_a?(Net::HTTPNotFound)
    return if response.is_a?(Net::HTTPNoContent)
    result = JSON.parse(response.body)
    raise_if_errors result, %w[error errors], 'message'
    raise "Bad response: #{response}" unless response.is_a?(Net::HTTPOK)
    result
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def return_if_object(response, kind)
    self.class.return_if_object(response, kind)
  end

  def self.extract_variables(template)
    template.scan(/{{[^}]*}}/).map { |v| v.gsub(/{{([^}]*)}}/, '\1') }
            .map(&:to_sym)
  end

  def self.expand_variables(template, var_data, extra_data = {})
    data = if var_data.class <= Hash
             var_data.merge(extra_data)
           else
             resource_to_hash(var_data).merge(extra_data)
           end
    extract_variables(template).each do |v|
      unless data.key?(v)
        raise "Missing variable :#{v} in #{data} on #{caller.join("\n")}}"
      end
      template.gsub!(/{{#{v}}}/, CGI.escape(data[v].to_s))
    end
    template
  end

  def self.fetch_resource(resource, self_link, kind)
    get_request = ::Google::Sql::Network::Get.new(
      self_link, fetch_auth(resource)
    )
    return_if_object get_request.send, kind
  end

  def fetch_wrapped_resource(resource, kind, wrap_kind, wrap_path)
    self.class.fetch_wrapped_resource(resource, kind, wrap_kind, wrap_path)
  end

  def self.fetch_wrapped_resource(resource, kind, wrap_kind, wrap_path)
    result = fetch_resource(resource, self_link(resource), wrap_kind)
    return if result.nil? || !result.key?(wrap_path)
    result = unwrap_resource(result[wrap_path], resource)
    return if result.nil?
    raise "Incorrect result: #{result['kind']} (expected #{kind})" \
      unless result['kind'] == kind
    result
  end

  def unwrap_resource(result, resource)
    self.class.unwrap_resource(result, resource)
  end

  def self.unwrap_resource(result, resource)
    query_predicate = unwrap_resource_filter(resource)
    matches = result.select do |entry|
      query_predicate.all? do |k, v|
        entry[k.id2name] == v
      end
    end
    raise "More than 1 result found: #{matches}" if matches.size > 1
    return if matches.empty?
    matches.first
  end

  def self.raise_if_errors(response, err_path, msg_field)
    errors = ::Google::HashUtils.navigate(response, err_path)
    raise_error(errors, msg_field) unless errors.nil?
  end

  def self.raise_error(errors, msg_field)
    raise IOError, ['Operation failed:',
                    errors.map { |e| e[msg_field] }.join(', ')].join(' ')
  end
end

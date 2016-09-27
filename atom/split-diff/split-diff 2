require 'rspec/expectations'

RSpec::Matchers.define :equal_time do |expected|
  match do |actual|
    expect(actual).to be_within(1.second).of(expected)
  end
end

class SerializationContext
  attr_reader :request_url, :query_parameters

  def initialize(request)
    @request_url      = request.original_url[/\A[^?]+/]
    @query_parameters = request.query_parameters
  end
end

def collection_order(collection)
  first, last = json_data.pluck(:id).map(&:to_i)

  first < last ? 'ASC' : 'DESC'
end

def sort_hash(h)
  {}.tap do |h2|
    h.sort.each do |k,v|
      h2[k] = v.is_a?(Hash) ? sort_hash(v) : v
    end
  end
end

RSpec::Matchers.define :equal_serialized do |records|
  match do |actual|
    if records.kind_of?(ActiveRecord::AssociationRelation) && json_data.count > 1
      order = collection_order(actual)

      records = records.order("id #{order}")
    end

    context = SerializationContext.new(request)

    resource = if records.kind_of?(Merit::Badge)
      ActiveModelSerializers::SerializableResource.new(
        records, serializer: AchievementSerializer, serialization_context: context
      )
    elsif records.kind_of?(Array) && records[0].kind_of?(Merit::Badge)
      ActiveModelSerializers::SerializableResource.new(
        records, each_serializer: AchievementSerializer, serialization_context: context
      )
    else
      ActiveModelSerializers::SerializableResource.new(
        records, serialization_context: context
      )
    end

    expected = sort_hash(JSON.parse(resource.to_json)).to_json

    result = sort_hash(JSON.parse(actual).except('meta')).to_json

    result == expected
  end
end

RSpec::Matchers.define :equal_sort do |records|
  match do |actual|
    # Pluck can't be used on active record collections with some joins without
    # getting an error, therefore we have to map the id directly.
    json_data.pluck(:id) == records.map(&:id).map(&:to_s)
  end
end

def mail_attributes(mail)
  mail.instance_values.slice('from', 'reply_to', 'to', 'subject')
end

RSpec::Matchers.define :equal_mail do |expected|
  match do |actual|
    actual != nil && mail_attributes(actual) == mail_attributes(expected)
  end
end

RSpec::Matchers.define :equal_mails do |expected|
  match do |actual|
    expect(
      actual.map   { |m| mail_attributes(m) }
    ).to match_array(
      expected.map { |m| mail_attributes(m) }
    )
  end
end

RSpec::Matchers.define :equal_sms do |expected|
  match do |actual|
    actual.options == expected.options
  end
end

RSpec::Matchers.define :equal_front_url_with do |path|
  match do |actual|
    expect(actual).to eq(
      URI::join(Rails.application.config.front_url, path).to_s
    )
  end
end

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

RSpec::Matchers.define :equal_serialized do |records|
  match do |actual|
    resource = if records.kind_of?(ActiveRecord::AssociationRelation) && json_data.count > 1

      order = collection_order(actual)

      ActiveModel::SerializableResource.new(records.order("id #{order}"))
    else
      ActiveModel::SerializableResource.new(records)
    end

    expected = resource.to_json({
      serialization_context: SerializationContext.new(request)
    })
    result = JSON.parse(actual).except('meta').to_json

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

RSpec::Matchers.define :equal_mail do |expected|
  match do |actual|
    actual != nil && attributes(actual) == attributes(expected)
  end

  def attributes(mail)
    mail.instance_values.slice('from', 'reply_to', 'to', 'subject')
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

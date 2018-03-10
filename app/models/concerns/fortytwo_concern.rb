module FortytwoConcern
  extend ActiveSupport::Concern

  included do
  end

  class_methods do
    def process_payload_for_fortytwo(data)
      case data
      when Array
        data.map do |el|
          block_given? ? yield(el) : el
        end
      else
        block_given? ? yield(data) : data
      end
    end

    def fetch_from_json(payload)
      self.process_payload_for_fortytwo(
        JSON.parse(payload, object_class: FortyTwo::Api::DataStruct)
      )
    end

    def fetch_from_fortytwo(id)
      return unless block_given?

      payload = FortyTwo::Api.instance.get(yield(id))

      return unless payload.success?

      self.process_payload_for_fortytwo(payload.body)
    end
  end

  # Based on https://github.com/rails/rails/blob/v5.1.4/activerecord/lib/active_record/nested_attributes.rb#L395
  def assign_nested_attributes_for_one_to_one_association(association_name, attributes)
    if attributes.respond_to?(:permitted?)
      attributes = attributes.to_h
    end

    attributes = attributes.with_indifferent_access
    existing_record = send(association_name)
    association = association(association_name)

    # Add specificity
    if attributes['id'].present? && !existing_record
      existing_record = association.klass.create!(attributes)
      association.initialize_attributes existing_record
      association.reload
    end

    # Call immediate parent
    super(association_name, attributes)
  end

  # Based on https://github.com/rails/rails/blob/v5.1.4/activerecord/lib/active_record/nested_attributes.rb#L454
  def assign_nested_attributes_for_collection_association(association_name, attributes_collection)
    options = nested_attributes_options[association_name]

    if attributes_collection.respond_to?(:permitted?)
      attributes_collection = attributes_collection.to_h
    end

    unless attributes_collection.is_a?(Hash) || attributes_collection.is_a?(Array)
      raise ArgumentError, "Hash or Array expected, got #{attributes_collection.class.name} (#{attributes_collection.inspect})"
    end

    check_record_limit!(options[:limit], attributes_collection)

    if attributes_collection.is_a?(Hash)
      keys = attributes_collection.keys
      attributes_collection = if keys.include?('id') || keys.include?(:id)
        [attributes_collection]
      else
        attributes_collection.values
      end
    end

    association = association(association_name)
    attribute_ids = attributes_collection.map { |el| el['id'] || el[:id] }.compact

    existing_records = if association.loaded?
      association.target
    else
      attribute_ids.empty? ? [] : association.scope.where(association.klass.primary_key => attribute_ids)
    end

    # Add specificity
    if attribute_ids.present?
      new_record_ids = (attribute_ids - existing_records.ids)
      new_records = attributes_collection.select { |el| new_record_ids.include?(el['id'] || el[:id]) }

      new_records.each do |record_attributes|
        existing_record = association.klass.create!(record_attributes.with_indifferent_access)
        association.add_to_target(existing_record, :skip_callbacks)
      end

      association.reload if new_records.present?
    end

    # Call immediate parent
    super(association_name, attributes_collection)
  end

  def fetch_from_fortytwo
    self.class.fetch_from_fortytwo(self.id)
  end
end

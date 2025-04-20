# config/initializers/solid_queue_patch.rb

Rails.application.config.to_prepare do
    SolidQueue::Job.class_eval do
      # Remove broken serialize declaration from older SolidQueue
      if respond_to?(:serialized_attributes) && serialized_attributes.key?("arguments")
        serialized_attributes.delete("arguments")
      end
  
      if respond_to?(:_serialize_attribute) && _serialize_attribute.include?(:arguments)
        _serialize_attribute.delete(:arguments)
      end
    end
  end
  
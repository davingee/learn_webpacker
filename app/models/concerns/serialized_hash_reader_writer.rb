module SerializedHashReaderWriter
# module ActiveRecord::Extra

  # def date_range(start_date, end_date, column = 'created_at')
  #   where("#{ column } >= ? and #{ column } <= ?", start_date, end_date)
  # end
  #
  # def filter_by(args = {})
  #   where(status: true)
  # end

  def serialized_attr_accessible_structure(serialized_attribute_name, *key_names)
    key_names.each do |name|
      define_method ( "#{serialized_attribute_name}_#{name}=" ) do |val|
        self.send("#{serialized_attribute_name}_will_change!")
        self.send("#{serialized_attribute_name}")[name] = val
      end
      define_method ( "#{serialized_attribute_name}_#{name}" ) do
        self.read_attribute("#{serialized_attribute_name}")[name]
      end

      define_method( "#{serialized_attribute_name}_#{name}?" ) do
        self.read_attribute("#{serialized_attribute_name}")[name].present?
      end
      # attr_accessible "#{serialized_attribute_name}_#{name}"
    end
  end

  # def serialized_attr_accessible_flag(serialized_attribute_name, *key_names)
  #   key_names.each do |name|
  #     define_method ( "#{serialized_attribute_name}_#{name}=" ) do |val|
  #       val = ( val.to_i > 0 ? 1 : nil ) rescue nil
  #       self.send("#{serialized_attribute_name}_will_change!")
  #       self.send("#{serialized_attribute_name}")[name] = val
  #     end
  #     define_method ( "#{serialized_attribute_name}_#{name}" ) do
  #       self.read_attribute("#{serialized_attribute_name}")[name]
  #     end
  #
  #     define_method( "#{serialized_attribute_name}_#{name}?" ) do
  #       val = self.read_attribute("#{serialized_attribute_name}")[name]
  #       val.present?
  #     end
  #
  #     # attr_accessible "#{serialized_attribute_name}_#{name}"
  #   end
  # end
  #
  #
  # # generate accessor wrappers for ActiveRecord::Dirty change tracking
  # def serialized_attr_accessible(serialized_attribute_name, *key_names)
  #   key_names.each do |name|
  #     define_method ( "#{serialized_attribute_name}_#{name}=" ) do |val|
  #       self.send("#{serialized_attribute_name}_will_change!")
  #       self.send("#{serialized_attribute_name}")[name] = val.to_s
  #     end
  #     define_method ( "#{serialized_attribute_name}_#{name}" ) do
  #       self.read_attribute("#{serialized_attribute_name}")[name]
  #     end
  #     # attr_accessible "#{serialized_attribute_name}_#{name}"
  #   end
  # end
  #
  # # generate accessor wrappers for ActiveRecord::Dirty change tracking
  # # generate accessors with fallback options
  # def serialized_attr_accessible_with_fallback(serialized_attribute_name, fallback_attribute_name, *key_names)
  #   key_names.each do |name|
  #     serialized_attr_accessible serialized_attribute_name, name
  #
  #     define_method ( "#{serialized_attribute_name}_#{name}_no_fallback" ) do
  #       val = self.send("#{serialized_attribute_name}")[name]
  #       val.present? ? val : nil
  #     end
  #     define_method ( "#{serialized_attribute_name}_#{name}" ) do
  #       val = self.send("#{serialized_attribute_name}")[name]
  #       return val if val.present?
  #
  #       fallback_item = self.send(fallback_attribute_name)
  #       fallback_item.send(serialized_attribute_name)[name]
  #     end
  #
  #   end
  # end
  #
  # # generate accessors with fallback options
  # def attr_accessible_with_fallback(fallback_attribute_name, *key_names)
  #   key_names.each do |name|
  #     # attr_accessible name
  #     define_method ( "#{name}_no_fallback" ) do
  #       val = self.read_attribute(name)
  #       val.present? ? val : nil
  #     end
  #     define_method ( name ) do
  #       val = self.read_attribute(name)
  #       return val if val.present?
  #       fallback_item = self.send(fallback_attribute_name)
  #       fallback_item.send(name)
  #     end
  #   end
  # end

end


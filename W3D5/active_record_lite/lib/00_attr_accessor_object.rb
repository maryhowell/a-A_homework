class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # going through each of the names provided
    names.each do |name|
      define_method(name) do
        #getting the name and setting that to get
        instance_variable_get("@#{name}")
      end
      define_method("#{name}=") do |value|
        # accessing the value of the variable and storing it. 
        instance_variable_set("@#{name}", value)
      end
    end
  end
end

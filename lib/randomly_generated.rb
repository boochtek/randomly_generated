require "randomly_generated/version"
require "randomly_generated/object"
require "randomly_generated/integer"


module RandomlyGenerated
  def self.respond_to?(method_name)
    class_name = method_name.to_s.split("_").map(&:capitalize).join
    Object.const_defined?("::RandomlyGenerated::#{class_name}")
  end

  def self.method_missing(method_name, *args, &block)
    if respond_to?(method_name)
      class_name = method_name.to_s.split("_").map(&:capitalize).join
      class_const = Object.const_get("::RandomlyGenerated::#{class_name}")
      class_const.new(*args, &block)
    else
      super
    end
  end
end

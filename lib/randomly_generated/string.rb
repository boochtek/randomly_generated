class RandomlyGenerated::String < RandomlyGenerated::Object
  attr_reader :length

  def initialize(options={})
    super
    @length = options.fetch(:length) { (1..5000) }
    @length = rand.rand(@length) if @length.is_a?(Range)
  end

  def call
    @value ||= rand.bytes(length) # TODO: This doesn't handle Unicode characters, only code points 0-255.
  end
end

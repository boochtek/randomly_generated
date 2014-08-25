# From https://gist.github.com/pithyless/9738125
class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end


class RandomlyGenerated::Integer < RandomlyGenerated::Object
  attr_reader :minimum
  attr_reader :maximum

  def initialize(options={})
    super
    options[:range] ||= Integer::MIN..Integer::MAX
    @minimum = options.fetch(:minimum) { options.fetch(:range).first }
    @maximum = options.fetch(:maximum) { options.fetch(:range).last }
  end

  def call
    # TODO: We should weight this to make more "special edge-case" results show up -- like 0, 1, Integer::MAX, etc.
    @value ||= rand.rand(minimum..maximum)
  end
end

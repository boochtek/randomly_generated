# This is the base class for all classes used to generate random objects.
class RandomlyGenerated::Object
  attr_reader :seed
  attr_reader :rand

  def initialize(options={})
    @seed = options.fetch(:seed) { Random.new_seed }
    @rand = Random.new(seed)
  end

  # Returns the generated object.
  def call
    raise NotImplementedError
  end

  # Returns an array of "shrunken" proper subsets of the object.
  # These subsets are intended to find simpler cases that will reproduce a test failure.
  # WARNING: This API will likely change. We plan to experiment with it heavily.
  # One idea is to have it take a block instead, and pass the various subsets to the block.
  def shrunken_subsets
    # By default, assume that the object is atomic and cannot be simplified.
    []
  end
end

module Wallhavened
  class Collection
    attr_reader :id, :label

    def initialize(id, label)
      @id = id
      @label = label
    end
  end
end

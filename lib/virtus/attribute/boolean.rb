module Virtus
  class Attribute

    # Bolean attribute allows true or false values to be set
    # Additionally it adds boolean reader method, like "admin?"
    #
    # @example
    #   class Post
    #     include Virtus
    #
    #     attribute :published, Boolean
    #   end
    #
    #   post = Post.new(:published => false)
    #   post.published?  # => false
    #
    class Boolean < Object
      primitive       TrueClass
      coercion_method :to_boolean

      # Returns if the given value is either true or false
      #
      # @example
      #   Virtus::Attribute::Boolean.primitive?(true)    # => true
      #   Virtus::Attribute::Boolean.primitive?(false)   # => true
      #   Virtus::Attribute::Boolean.primitive?(1)       # => false
      #   Virtus::Attribute::Boolean.primitive?('true')  # => false
      #
      # @return [Boolean]
      #
      # @api public
      def self.primitive?(value)
        value.equal?(true) || value.equal?(false)
      end

      # Creates an attribute reader method as a query
      #
      # @param [Module] mod
      #
      # @return [self]
      #
      # @api private
      def define_reader_method(mod)
        super

        mod.define_attribute_getter(self, "#{name}?", reader_visibility)

        self
      end

    end # class Boolean
  end # class Attribute
end # module Virtus

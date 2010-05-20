module Psych
  ###
  # Psych::Stream is a streaming YAML emitter.  It will not buffer your YAML,
  # but send it straight to an IO.
  #
  # Here is an example use:
  #
  #   stream = Psych::Stream.new($stdout)
  #   stream.start
  #   stream.push({:foo => 'bar'})
  #   stream.finish
  #
  # YAML will be immediately emitted to $stdout with no buffering.
  #
  # Psych::Stream#start will take a block and ensure that Psych::Stream#finish
  # is called, so you can do this form:
  #
  #   stream = Psych::Stream.new($stdout)
  #   stream.start do |em|
  #     em.push(:foo => 'bar')
  #   end
  #
  class Stream < Psych::Visitors::YAMLTree
    class Emitter < Psych::Emitter # :nodoc:
      def end_document implicit_end = !streaming?
        super
      end

      def streaming?
        true
      end
    end

    ###
    # Create a new streaming emitter.  Emitter will print to +io+.  See
    # Psych::Stream for an example.
    def initialize io
      super({}, Emitter.new(io))
    end

    ###
    # Start streaming using +encoding+
    def start encoding = Nodes::Stream::UTF8
      super.tap { yield self if block_given?  }
    ensure
      finish if block_given?
    end

    private
    def register target, obj
    end
  end
end

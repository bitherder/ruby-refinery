module RubyRefinery
  refine URI::Generic do
    # TODO: use better aliasing
    alias :query_without_ruby_refinery :query
    def query
      result = query_without_ruby_refinery
      class << result
        def to_a
          URI.decode_www_form(self)
        end

        def to_h
          to_a.to_h
        end
      end
      result
    end
  end
end

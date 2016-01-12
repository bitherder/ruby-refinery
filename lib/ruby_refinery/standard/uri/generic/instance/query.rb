module RubyRefinery
  module URIGenericQueryExtension
    def query
      result = super
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

  refine URI::Generic do
    prepend URIGenericQueryExtension
  end
end

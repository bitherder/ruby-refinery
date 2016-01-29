module Refinery
  module URIGenericQueryEqualExtension
    def query=(value)
      if value.kind_of? Enumerable
        value = URI.encode_www_form(value)
      end
      super value
    end
  end

  refine URI::Generic do
    prepend URIGenericQueryEqualExtension
  end
end

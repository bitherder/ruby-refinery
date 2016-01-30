module Refinery
  refine URI.singleton_class do
    def build(scheme: , **args)
      scheme_list[scheme.to_s.upcase].build(**args)
    end
  end
end

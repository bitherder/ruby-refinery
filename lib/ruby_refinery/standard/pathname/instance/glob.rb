module RubyRefinery
  refine Pathname do
    def glob(pattern)
      Dir.glob(self+pattern).map{|result| self.class.new(result)}
    end
  end
end

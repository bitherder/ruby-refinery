module Refinery
  module PathnameRefinement
    module Instance
      module Glob
        refine Pathname do
          def glob(pattern)
            Dir.glob(self+pattern).map{|result| self.class.new(result)}
          end
        end
      end
    end
  end
end

container = Refinery::PathnameRefinement::Instance::Glob
container_string = container.to_s
while /::/ =~ container_string
  container_string.sub!(/::[^:]*$/, '')
  container = eval(container_string)
  container.include Refinery::PathnameRefinement::Instance::Glob
end


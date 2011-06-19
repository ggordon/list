module List

  class Base

    def render
      system("cat ~/.list.data")
      puts "done rendering"
    end
  end
end

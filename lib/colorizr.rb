class String

  @colors = {"red" => 31, "green" => 32, "yellow" => 33, "blue" => 34, "pink" => 95, "light_blue" => 94, "white" => 97, "light_gray" => 37, "black" => 30}

  def self.create_colors
    @colors.each do |color, number|
      define_method(color){"\e[#{number}m#{self}\e[0m"}
    end
  end

  def self.colors
    color_list = []
    @colors.each_key do |color|
      color_list.push(color.to_sym)
    end
    p color_list
  end

  def self.sample_colors
    @colors.each do |color, number|
      puts "This is \e[#{number}m#{color}\e[0m"
    end
  end

end

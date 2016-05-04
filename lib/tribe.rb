class Tribe
  attr_accessor :name, :members
  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts "A new Tribe was created: #{@name}".light_blue
  end
  def to_s
    @name
  end
  def tribal_council(options = {})
    @immune = options[:immune]
    voted_out_array = @members.reject { |member| @immune == member} 
    voted_out = voted_out_array.sample
    puts "#{voted_out.name.capitalize} was voted off.".red
    @members.delete(voted_out)
    return voted_out
	end
end

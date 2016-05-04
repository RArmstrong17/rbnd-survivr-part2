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
    voted_out = @members.reject { |member| @immune.include?(member)} if @immune.is_a?(Array)
    voted_out = @members.reject { |member| @immune == member} if @immune.is_a?(Contestant)
    puts "#{voted_out[0].name.capitalize} was voted off.".red
    @members.delete(voted_out[0])
    return voted_out[0]
	end
end

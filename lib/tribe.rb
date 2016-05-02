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
    @members.each_with_index do |member, index|
      if member != @immune
        puts "#{@members[index].name.capitalize} was voted off.".red
        return @members.delete_at(index)
      end
    end
	end
end

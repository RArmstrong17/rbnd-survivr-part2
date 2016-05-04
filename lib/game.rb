require_relative "../lib/colorizr"
String.create_colors

class Game
  attr_reader :tribes
  def initialize(*tribes)
    @tribes = *tribes
  end
  def add_tribe(tribe)
    @tribes.push(tribe)
  end
  def immunity_challenge
    if @tribes.is_a?(Array)
      tribes_new = @tribes.shuffle(random: Random.new).first
      puts "#{tribes_new} lost the immunity challange.".pink
      return tribes_new
    else
      tribes_new = @tribes
    end
  end
  def clear_tribes
    @tribes.drop(@tribes.length)
  end
  def merge(name)
    members = @tribes.map(&:members).flatten
    combined = Tribe.new(name: name, members: members)
    @tribes = combined
  end
  def individual_immunity_challenge
    if @tribes.is_a?(Array)
      @tribes.each do |tribe|
        losers = tribe.members.shuffle(random: Random.new(1))
        immune = losers.sample
        return tribe.tribal_council(immune: immune)
      end
    else
      losers = @tribes.members.shuffle(random: Random.new(1))
      immune = losers.sample
      return @tribes.tribal_council(immune: immune)
    end
  end
end

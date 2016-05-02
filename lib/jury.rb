class Jury
  attr_accessor :members
  def initialize
    @finalists_votes = {}
    @members = []
  end
  def add_member(member)
    @members.push(member)
  end
  def cast_votes(finalists)
    finalists.each do |contestant|
      @finalists_votes[contestant.name] = 0
    end
    @members.each do |jury|
      finalist = finalists.shuffle(random: Random.new).first
      puts "#{jury.name.capitalize} voted for #{finalist.name.capitalize}".yellow
        @finalists_votes.keys.each do |contestant|
          @finalists_votes[contestant] += 1 if finalist.name == contestant
        end
    end
    return @finalists_votes
  end
  def report_votes(options = {})
    options.each do |name, votes|
      puts "#{name.capitalize} was voted for #{votes} times.".red
    end
  end
  def announce_winner(finalist)
    finalist.each do |contestant, votes|
      puts "The Survivr champion is #{contestant.name.capitalize}".green if votes >= 4 && contestant.instance_of?(Contestant)
      puts "The Survivr champion is #{contestant.capitalize}".green if votes >= 4 && contestant.is_a?(String)
      return contestant if votes >= 4
    end
  end
end

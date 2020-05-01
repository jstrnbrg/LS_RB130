class School
  attr_accessor :school

  def initialize
    @school = Hash.new {|hash, key| hash[key] = [] }
  end

  def add(name, grade)
    #school.fetch(grade, nil) ? school[grade].push(name) : school[grade] = [name]
    school[grade].push(name)
  end

  def to_h
    school.sort.map {|grade, pupils| [grade, pupils.sort]}.to_h
  end

  def grade(grade)
    school.fetch(grade, [])
  end
end

class Employee
  def initialize(name:, email:, phone:, salary:)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ''
    @satisfactory = nil
  end

  def name
    @name
  end

  def email
    @email
  end

  def phone
    @phone
  end

  def salary
    @salary
  end

  def review
    @review
  end

  def satisfactory
    @satisfactory
  end

  def add_review(r)
    @review << r
  end

  def satisfactory_performance?(s)
    @satisfactory = s
  end

  def raise(amount, type)
    if type == 'percent'
      @salary += amount * @salary
    elsif type == 'dollar'
      @salary += amount
    else
      puts "Accepted raise types are 'percent' and 'dollar'"
    end
  end
end

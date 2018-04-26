class AssertionList
  def initialize
    @assertions = []
  end

  def add(assertion)
    @assertions << assertion
  end

  def run_all_assertions
    @assertions.each do |assertion|
      assertion.check
    end
  end
end

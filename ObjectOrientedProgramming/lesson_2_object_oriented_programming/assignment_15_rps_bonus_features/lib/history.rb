class History
  attr_reader :keys, :report

  def initialize(keys)
    @keys = keys
    reset
  end

  def reset
    @report = []
  end

  def update(data)
    hsh = keys.zip(data).to_h
    @report.push(hsh)
  end
end

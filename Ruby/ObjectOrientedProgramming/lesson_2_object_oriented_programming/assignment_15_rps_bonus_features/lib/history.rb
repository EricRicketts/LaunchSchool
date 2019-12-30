class History
  attr_reader :keys, :report

  def initialize(keys)
    @keys = keys
    reset
  end

  def data
    report.inject([]) do |data, hsh|
      data.push(hsh.values)
    end
  end

  def reset
    @report = []
  end

  def size
    report.size
  end

  def update(data)
    hsh = keys.zip(data).to_h
    @report.push(hsh)
  end
end

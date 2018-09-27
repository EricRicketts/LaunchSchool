Card = Struct.new :suit, :rank, :value, :face_down do
  def initialize(*)
    super
    self.value = 0
    self.face_down ||= false
  end

  def to_s
    rank == "10" ? rank + suit[0] : rank[0] + suit[0]
  end
end

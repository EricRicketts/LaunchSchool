Card = Struct.new :suit, :rank, :value, :face_down do
  def initialize(*)
    super
    self.value = 0
    self.face_down ||= false
  end
end

class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
    @lock = true
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
    if @lock
      fail 'Go away!'
    else
      @diary.read
    end
  end

  def lock
    @lock = true
  end

  def unlock
    @lock = false
  end
end
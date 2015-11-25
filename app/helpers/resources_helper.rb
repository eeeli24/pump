module ResourcesHelper

  def added_on(time)
    time.strftime('%b %d')
  end
end

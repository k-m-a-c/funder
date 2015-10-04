module RidingsHelper
  def previous_riding
    unless @previous.nil?
      riding_path(@previous)
    end
  end

  def next_riding
    unless @next.nil?
      riding_path(@next)
    end
  end
end

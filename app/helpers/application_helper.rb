module ApplicationHelper
  def highlight(text)
    text.gsub(/@\w+/) { |result| "<strong>#{result}<\/strong>"}
  end
end

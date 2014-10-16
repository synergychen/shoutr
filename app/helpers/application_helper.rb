module ApplicationHelper
  def highlight(text)
    text.gsub(/@\w+/) { |result| link_if_exist(result) }
  end

  private

  def link_if_exist(result)
    user = User.find_by(username: result[1..-1])
    if user
      "<strong>#{ link_to result, user_path(user) }<\/strong>"
    else
      result
    end
  end
end

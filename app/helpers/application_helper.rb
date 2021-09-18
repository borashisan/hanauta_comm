module ApplicationHelper
  def full_title(page_title = '')
    basetitle = "hanauta_comm"
    if page_title.empty?
      return basetitle
    else
      return basetitle + " | " + page_title 
    end
  end
end

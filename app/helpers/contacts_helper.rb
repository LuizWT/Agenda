module ContactsHelper

  def remove_faker_characters_rmk(rmk)
    rmk.gsub('[', "").gsub(']', "")
  end

end

module UserLibrariesHelper

def owner_disc
owner_discs = UserLibrary.where(user_id: current_user.id)
owner_disc = Disc.where(id: owner_discs.ids)

  return owner_disc
end

end

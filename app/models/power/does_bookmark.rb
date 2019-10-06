
module Power::DoesBookmark
  as_trait do
    power :bookmarks do
      drawers.traverse_association(:bookmarks)
    end

    power :updatable_bookmarks do
      updatable_drawers.traverse_association(:bookmarks)
    end

    power :creatable_bookmarks do
      Bookmark.none
    end
  end
end

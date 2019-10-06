module Power::DoesAttachment
  as_trait do
    power :attachments do
      drawers.traverse_association(:attachments)
    end

    power :updatable_attachments do
      updatable_drawers.traverse_association(:attachments)
    end

    power :creatable_attachments do
      Attachment.none
    end
  end
end

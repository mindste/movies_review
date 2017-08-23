class MovieAttachment < ApplicationRecord
  
  mount_uploader  :attachment,  MovieAttachmentUploader
  belongs_to  :movie
end

module ApplicationHelper

  def randomized_background_image
    images = ["assets/images/background_images/*"]
    images[rand(images.size)]
  end

end

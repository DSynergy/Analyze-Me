module ApplicationHelper

    BACKGROUND = ['ankor', 'aspen', 'beats', 'berlin', 'buenos_aires', 'copper', 'cusco',
   'cz', 'dcmetro', 'Denver', 'Haup', 'iguazu', 'jamaica', 'jamaica_country', 'Japan', 'Jelly_Fish',
   'Kebler', 'rio', 'salt_flats', 'uyuni']

  def randomized_background_image
    images = BACKGROUND.each {|image| ["#{image}.JPG"]}
    images[rand(images.size)]
  end

end

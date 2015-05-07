class MBResult < ActiveRecord::Base

  def calculate_personality(user)
    type = []
    if user.introversion > user.extraversion ? type << 'I' : type << 'E';end
    if user.intuition > user.sensing ? type << 'N' : type << 'S';end
    if user.thinking > user.feeling ? type << 'T' : type << 'F';end
    if user.judging > user.perceiving ? type << 'J' : type << 'P';end

    Personality.all.each do |personality|
      if type.join == personality.MBPT
        user.personality_id = personality.id
        user.save
      end
    end

  end

end

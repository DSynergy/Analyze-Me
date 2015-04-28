class Types::TypeController < ApplicationController

  def index
  end

  def ESTP
    @personality = Personality.find_by(:MBPT => 'ESTP')
  end

  def ESFP
    @personality = Personality.find_by(:MBPT => 'ESFP')
  end

  def ENFP
    @personality = Personality.find_by(:MBPT => 'ENFP')
  end

  def ENTP
    @personality = Personality.find_by(:MBPT => 'ENTP')
  end

  def ESTJ
    @personality = Personality.find_by(:MBPT => 'ESTJ')
  end

  def ESFJ
    @personality = Personality.find_by(:MBPT => 'ESFJ')
  end

  def ENFJ
    @personality = Personality.find_by(:MBPT => 'ENFJ')
  end

  def ENTJ
    @personality = Personality.find_by(:MBPT => 'ENTJ')
  end

  def INTJ
    @personality = Personality.find_by(:MBPT => 'INTJ')
  end

  def INFJ
    @personality = Personality.find_by(:MBPT => 'INFJ')
  end

  def ISTJ
    @personality = Personality.find_by(:MBPT => 'ISTJ')
  end

  def ISFJ
    @personality = Personality.find_by(:MBPT => 'ISFJ')
  end

  def INFP
    @personality = Personality.find_by(:MBPT => 'INFP')
  end

  def INTP
    @personality = Personality.find_by(:MBPT => 'INTP')
  end

  def ISTP
    @personality = Personality.find_by(:MBPT => 'ISTP')
  end

  def ISFP
    @personality = Personality.find_by(:MBPT => 'ISFP')
  end

end

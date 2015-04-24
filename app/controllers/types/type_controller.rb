class Types::TypeController < ApplicationController

  def index
  end

  def ESTP
    @personality = Personality.find(type: 'ESTP')
  end

  def ESFP
    @personality = Personality.find(type: 'ESFP')
  end

  def ENFP
    @personality = Personality.find(type: 'ENFP')
  end

  def ENTP
    @personality = Personality.find(type: 'ENTP')
  end

  def ESTJ
    @personality = Personality.find(type: 'ESTJ')
  end

  def ESFJ
    @personality = Personality.find(type: 'ESFJ')
  end

  def ENFJ
    @personality = Personality.find(type: 'ENFJ')
  end

  def ENTJ
    @personality = Personality.find(type: 'ENTJ')
  end

  def INTJ
    @personality = Personality.find(type: 'INTJ')
  end

  def INFJ
    @personality = Personality.find(type: 'INFJ')
  end

  def ISTJ
    @personality = Personality.find(type: 'ISTJ')
  end

  def ISFJ
    @personality = Personality.find(type: 'ISFJ')
  end

  def INFP
    @personality = Personality.find(type: 'INFP')
  end

  def INTP
    @personality = Personality.find(type: 'INTP')
  end

  def ISTP
    @personality = Personality.find(type: 'ISTP')
  end

  def ISFP
    @personality = Personality.find(type: 'ISFP')
  end

end

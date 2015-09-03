class SCK11 < SCK

  def map
    {
    noise: 7,
    light: 14,
    panel: 18,
    co: 16,
    bat: 17,
    hum: 13,
    no2: 15,
    nets: 21,
    temp: 12
    }
  end

  def noise=(value)
    db = {0=>50,2=>55,3=>57,6=>58,20=>59,40=>60,60=>61,75=>62,115=>63,150=>64,180=>65,220=>66,260=>67,300=>68,375=>69,430=>70,500=>71,575=>72,660=>73,720=>74,820=>75,900=>76,975=>77,1050=>78,1125=>79,1200=>80,1275=>81,1320=>82,1375=>83,1400=>84,1430=>85,1450=>86,1480=>87,1500=>88,1525=>89,1540=>90,1560=>91,1580=>92,1600=>93,1620=>94,1640=>95,1660=>96,1680=>97,1690=>98,1700=>99,1710=>100,1720=>101,1745=>102,1770=>103,1785=>104,1800=>105,1815=>106,1830=>107,1845=>108,1860=>109,1875=>110}
    super value, db
  end

  def temp=(value)
    t = (175.72 / 65536.0 * value) - 53 # / 10.0
    super value, t
  end

  def hum=(value)
    h = (125.0 / 65536.0  * value) + 7 # / 10.0
    super value, h
  end

  def co=(value)
    @co = [value,value/1000.0]
  end

  def no2=(value)
    @no2 = [value,value/1000.0]
  end

  def light=(value)
    @light = [value,value/10.0]
  end

end

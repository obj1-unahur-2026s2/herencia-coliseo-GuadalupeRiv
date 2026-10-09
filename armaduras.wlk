import Gladiador.*

class Armadura{
  method puntosDeArmadura(unGladiador)
}

class Casco inherits Armadura{

 override method puntosDeArmadura(unGladiador)= 10
}

class Escudo inherits Armadura{
 override method puntosDeArmadura(unGladiador)= 5 + (unGladiador.puntosDeDestreza().0.1)
}
class Arma{
 method poderDeAtaque() 

}

class DeFilo inherits Arma{
 const longitud
 const filo 
 override method poderDeAtaque()= longitud * (filo.max(0).min(1))
}

class Contundente inherits Arma{
 const peso

 override method poderDeAtaque()= peso
}

class Armadura{
  method puntosDeArmadura(unGladiador)

}

class Casco inherits Armadura{

 override method puntosDeArmadura(unGladiador)= 10
}

class Escudo inherits Armadura{
 override method puntosDeArmadura(unGladiador)= 5 + (unGladiador.puntosDeDestreza.0.1)
}

class Gladiador{
  var Vida = 100
  var fuerza
  var destreza
  method puntosDeDefensa()
  method atacar(unGladiadorAtacado){ unGladiadorAtacado.recibirDanio(self)}
  
  
  method puntosDeDestreza() = destreza
  method recibirDanio(unGladiadorAtacante){
    vida = vida -(unGladiadorAtacante.poderDeAtaque - self.puntosDeDefensa())
  }
  method poderDeAtaque()
  method pelea(unGladiadorAtacado){
    self.atacar(unGladiadorAtacado)
    unGladiadorAtacado.atacar(self)
  }
}

class Mirmillones inherits Gladiador(destreza=15){
  var armadura 
  var Arma
  method cambiarArma(unArma){
    arma = unArma
  }
 method cambiarFuerza(unaFuerza){
  fuerza = unaFuerza
 }

 method cambiarArmadura(unaArmadura){
  armadura = unaArmadura
 }
  override method puntosDeDefensa()= armadura.puntosDeArmadura() + destreza
  
  override method poderDeAtaque()= arma.poderDeAtaque() + fuerza
  
}

class Dimachaerus inherits Gladiador(fuerza=10){
  const arma =[]
  method cambiarDestreza(){
    destreza =+ 1
}
 override method puntosDeDefensa() = destreza /2
 override method poderDeAtaque()= fuerza + arma.sum({a=>a.})
 override method atacar(unGladiadorAtacado){
   super(unGladiadorAtacado)
   self.cambiarDestreza()
 }
}

class GrupoDeGladiadores{
  const listaDeGladiadores=[]
  const nombreDeGrupo
  var cantCombates

  method agregarGladiador(unGladiador){
    listaDeGladiadores.add(unGladiador)
  } 
  method quitarGladiador(unGladiador){
    listaDeGladiadores.remove(unGladiador)
  } 
  method campeonMasFuerte(){
    listaDeGladiadores.filter({l=>l.vida() > 0}).max({l=>l.fuerza()})
  }
  method combate(otroGrupo){
    self.campeonMasFuerte().atacar(otroGrupo.campeonMasFuerte())
  }

 // method ejecutarNVeces(){
 //   (1..3).forEach(e => )
 //   3.times(i=>)
//  }

  
}
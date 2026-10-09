import armas.*
import armaduras.*

class Gladiador{
  var vida = 100
  var fuerza
  var destreza

  method fuerza()=fuerza
  method vida() = vida
  method puntosDeDefensa()
  method puntosDeDestreza() = destreza 
  method poderDeAtaque()
 
  method atacar(unGladiadorAtacado){ unGladiadorAtacado.recibirDanio(self)}
  
  method recibirDanio(unGladiadorAtacante){
    vida = vida -(unGladiadorAtacante.poderDeAtaque() - self.puntosDeDefensa()).max(0)
  }
  
  method pelea(unGladiadorAtacado){
    self.atacar(unGladiadorAtacado)
    unGladiadorAtacado.atacar(self)
  }
  method crearNombreGrupoCon(UnGladiador)
  
  method crearGrupoCon(unGladiador){
    const grupo = new GrupoDeGladiadores(nombreDeGrupo = self.crearNombreGrupoCon(unGladiador))
    grupo.agregarGladiador(self)
    grupo.agregarGladiador(unGladiador)
    return grupo
  }

}

class Mirmillones inherits Gladiador(destreza=15){
  var armadura 
  var arma
  method cambiarArma(unArma){
    arma = unArma
  }
 method cambiarFuerza(unaFuerza){
  fuerza = unaFuerza
 }

 method cambiarArmadura(unaArmadura){
  armadura = unaArmadura
 }
  override method puntosDeDefensa()= armadura.puntosDeArmadura(self) + destreza
  
  override method poderDeAtaque()= arma.poderDeAtaque() + fuerza
  
  override method crearNombreGrupoCon(unGladiador) = "mirmillolandia"
}

class Dimachaerus inherits Gladiador(fuerza=10){
  const armas =[]
  method agregarArma(unArma){
    armas.add(unArma)
  }
  method cambiarDestreza(){
    destreza =destreza + 1
}
 override method puntosDeDefensa() = destreza /2
 override method poderDeAtaque()= fuerza + arma.sum({a=>a.poderDeAtaque()})
 override method atacar(unGladiadorAtacado){
   super(unGladiadorAtacado)
   self.cambiarDestreza()
 }

 override method crearNombreGrupoCon(unGladiador) = "D-" + (self.poderDeAtaque() + unGladiador.poderDeAtaque())
}

class GrupoDeGladiadores{
  const listaDeGladiadores=[]
  const nombreDeGrupo
  var cantCombates = 0

  method cambiarCantCombates(){
    cantCombates = cantCombates + 1
  }

  method agregarGladiador(unGladiador){
    listaDeGladiadores.add(unGladiador)
  } 
  method quitarGladiador(unGladiador){
    listaDeGladiadores.remove(unGladiador)
  } 
  method campeonMasFuerte()=
    listaDeGladiadores.filter({l=>l.vida() > 0}).max({l=>l.fuerza()})
  
  method combate(otroGrupo){
   self.campeonMasFuerte().pelea(otroGrupo.campeonMasFuerte())
  }

 

 // method ejecutarNVeces(){
 //   (1..3).forEach(e => )
 //   3.times(i=>)
//  }

  
}
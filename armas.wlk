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

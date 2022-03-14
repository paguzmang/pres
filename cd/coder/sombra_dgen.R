sombra.dgen <- function(x0, x1, a = 0.01, fun = dnorm, ...){
  # Creacion: 5-ago-2018
  # Actualizada: 29-nov-2018
  # Esta funcion (generica) entrega una lista con valores (x,y) para usarse
  # dentro de la funcion polygon para agregar sombras de areas desde
  # modelos de probabilidad (tales como: dnorm, dexp, dweibull, etc.). Tambien
  # sirve para funciones definadas por el usuario (ver ejemplos abajo).
  #
  # Argumentos:
  # x0 = limite inferior de x
  # x1 = limiter superior de x para el area deseada
  # a = tamano de paso para generar rango de x
  # fun = comando que indica alguna funcion de densidad, tal como dnorm, dexp, etc.
  # ... argumentos adicionales para ser pasados a fun (p.e, los parametros del modelo)
  #
  rx <- seq(x0, x1, a)    # rango de valores de x solicitado
  d <- fun(x = rx, ...)   # densidad evaluada en rx
  x <- c(x0, rx, x1)      # ajuste de rango de x
  y <- c(0, d, 0)         # ajuste de valores de y
  list(x = x,y = y)       # entrega de resultados: (x, y) para polygon
  #
  # Forma de uso:
  # Ejemplo 1: Con una funcion de densidad de probabilidad:
  # rp <- sombra.dgen(x0 = 3, x1 = 3.5, a = 0.001, fun = dnorm, mean = 3, sd = 0.3)
  # curve(dnorm(x, mean = 3, sd = 0.3), xlim = c(1,5))
  # polygon(rp, border = 'brown', col = 'blue')  # ejemplo feo pero esa es la idea
  #
  # Ejemplo 2: Con una funcion cualquiera definida por el usuario:
  # fx <- function(x) x^2  # se define la funcion (una parabola con minimo en el origen)
  # rp <- sombra.dgen(x0 = 1, x1 = 3, fun = fx)  # se aplica sombra.dgen
  # curve(fx, xlim = c(-5,5), lwd = 2, col = 'blue')
  # polygon(rp, border = NA, col = 'gre60')
}

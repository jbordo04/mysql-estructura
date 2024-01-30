// // Prueba de nivel
interface IProductos {
  id: number;
  nombre: string;
  cantidad: number;
}

// // Refactoriza la clase para implementar IProductos y que no de error
class Productos implements IProductos {
  id: number;
  nombre: string;
  cantidad: number;
  constructor(id: number, nombre: string, cantidad: number) {
    this.id = id;
    this.nombre = nombre;
    this.cantidad = cantidad;
  }
  info() {
    console.log(`El producto ${this.nombre} tiene el id ${this.id}`);
  }
}

// // Nivel 2 - Extiende la clase Productos y añade un método que devuelva la cantidad de productos
class CantidadProductos extends Productos {
  constructor(id: number, nombre: string, cantidad: number) {
    super(id, nombre, cantidad);
  }

  devolverProducto() {
    return this.cantidad;
  }
}

// // Nivel 3 - Usa un tipo utilitario para omitir el id en el constructor de la clase Productos
type TipoPersonalizado = Omit<Productos, "id">;
type Tipo2 = Partial<Productos> & Omit<Productos, "id">;

const newPRio: TipoPersonalizado = new Productos();

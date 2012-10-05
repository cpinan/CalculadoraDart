class Logic {
  
  HTMLElement elemento;
  double cantidad, tmpCantidad;
  String operacion, tmpOperacion;
  bool digitacion;

  Logic() {
    
  }

  void run() {
    
    elemento = document.query("#divResultado");
    cantidad = 0.0;
    tmpCantidad = 0.0;
    operacion = "";
    tmpOperacion = "";
    digitacion = false;    
    
    for (var e in document.queryAll(".btnCalculadora"))
      {
      e.on.click.add((ele) => calculateFunction(ele));
      }
          
  }
  
  void calculateFunction(e)
  {
    String valor = e.target.value;
    int isNumber = -1;
    
    try
    {
        isNumber = Math.parseInt(valor);
    }catch(BadNumberFormatException e1)
    {
      
    }
    
    if(isNumber == -1)
    {
      operacion = valor;
      performOperation(valor);
    }else
    {
      setValue(valor);
    }
  }
  
  void setValue(valor)
  {
    if (digitacion == true) {
      elemento.innerHTML = elemento.innerHTML + "" + valor;
    } else {
      if (valor != "0") {
        elemento.innerHTML = valor;
        digitacion = true;
      }
    }    
    cantidad = Math.parseDouble(elemento.innerHTML);
  } 
  
  void performOperation(valor) {
    if (operacion == "AC") {
      operacion = "";
      tmpOperacion = "";
      cantidad = 0.0;
      tmpCantidad = 0.0;
      digitacion = false;
      elemento.innerHTML = "0";
    } else if (operacion == "Sqrt") {
      cantidad = Math.sqrt(cantidad);
    } else {
      doOperation();
      tmpCantidad = cantidad;
      tmpOperacion = operacion;
    }
    elemento.innerHTML = ""+cantidad;
    digitacion = false;
  } 
  
  void doOperation()
  {
    if (tmpOperacion == "+") {
      cantidad = tmpCantidad + cantidad;
    } else if (tmpOperacion == "-") {
      cantidad = tmpCantidad - cantidad;
    } else if (tmpOperacion == "*") {
      cantidad = tmpCantidad * cantidad;
    } else if (this.tmpOperacion == "/") {
      if (cantidad != 0) {
        cantidad = tmpCantidad / cantidad;
      }
    }
  }

}

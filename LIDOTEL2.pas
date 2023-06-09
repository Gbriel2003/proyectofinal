{El programa es un sistema de registro de clientes para un hotel, que permite registrar y
mostrar la información de los clientes. El programa está escrito en Pascal y utiliza el tipo de datos
"record" para definir la estructura del cliente, y utiliza tres arreglos diferentes para almacenar los clientes,
según el tipo de reservación que hayan realizado.

La función "NuevoCliente" es la encargada de solicitar los datos del nuevo cliente 
y almacenarlos en el arreglo correspondiente, dependiendo del tipo de reservación. La función utiliza la instrucción
"setlength" para redimensionar el arreglo cada vez que se agrega un nuevo cliente.

La función "MostrarClientes" muestra la información de todos los clientes 
registrados en el sistema, separados por tipo de reservación.

La función "MostrarRegistroCliente" se utiliza para mostrar la información
detallada de un cliente específico, y es utilizada por la función "MostrarClientes".}

program HotelLidotel;
uses crt;

type
  THabitacion = (FAMILY_ROOM, SENCILLA, DOBLE, SUITE);
  TCliente = record
    nombre, apellido, email: string;
    cedula, telefono, diasEstadia: string;
    habitacion: THabitacion;
    precio: real;  
  end;

var
  clientesIndividuales: array of TCliente;
  clientesAcompanados: array of TCliente;
  clientesGrupos: array of TCliente;

procedure MostrarRegistroCliente(cliente: TCliente);
begin
  writeln('Nombre: ', cliente.nombre, ' ', cliente.apellido);
  writeln;
  writeln('Cedula: ', cliente.cedula);
  writeln;
  writeln('Email: ', cliente.email);
  writeln;
  writeln('Telefono: ', cliente.telefono);
  writeln;
  writeln('Dias de estadia: ', cliente.diasEstadia);
  writeln;
  writeln('Tipo de habitacion: ', cliente.habitacion);
  writeln;
  writeln('Precio: ', cliente.precio:0:2);  
end;

procedure NuevoCliente();
var
  nuevoCliente: TCliente;
  tipoReservacion: integer;
  tipoHabitacion: integer;
begin
  writeln('Ingrese los datos del nuevo cliente:');
  write('Nombre: ');
  readln(nuevoCliente.nombre);
  write('Apellido: ');
  readln(nuevoCliente.apellido);
  write('Cedula: ');
  readln(nuevoCliente.cedula);
  write('Email: ');
  readln(nuevoCliente.email);
  write('Telefono: ');
  readln(nuevoCliente.telefono);
  write('Dias de estadia: ');
  readln(nuevoCliente.diasEstadia);
  writeln('----------------------------------');
  writeln('Seleccione el tipo de reservacion:');
  writeln('1. Individual');
  writeln('2. Acompanado');
  writeln('3. Grupo/Familia');
  writeln('---------------------------------');
  readln(tipoReservacion);
  case tipoReservacion of
    1:
      begin
        writeln('---------------------------------');
        writeln('Seleccione el tipo de habitacion:');
        writeln('1. Sencilla');
        writeln('2. Doble');
        writeln('3. Suite');
        writeln('---------------------------------');
        readln(tipoHabitacion);
        case tipoHabitacion of
          1: 
            begin
              nuevoCliente.habitacion := SENCILLA;
              nuevoCliente.precio := 50.00; 
            end;
          2: 
            begin
              nuevoCliente.habitacion := DOBLE;
              nuevoCliente.precio := 75.00; 
            end;
          3: 
            begin
              nuevoCliente.habitacion := SUITE;
              nuevoCliente.precio := 100.00; 
            end;
        end;
        setlength(clientesIndividuales, length(clientesIndividuales) + 1);
        clientesIndividuales[length(clientesIndividuales) - 1] := nuevoCliente;
      end;
    2:
      begin
        writeln('---------------------------------');
        writeln('Seleccione el tipo de habitacion:');
        writeln('1. Sencilla');
        writeln('2. Doble');
		writeln('3. Suite');
		writeln('---------------------------------');
		readln(tipoHabitacion);
		case tipoHabitacion of
	1:
	begin
		nuevoCliente.habitacion := SENCILLA;
		nuevoCliente.precio := 50.00; 
	end;
	2:
	begin
		nuevoCliente.habitacion := DOBLE;
		nuevoCliente.precio := 75.00; 
	end;
	3:
	begin
		nuevoCliente.habitacion := SUITE;
		nuevoCliente.precio := 100.00; 
	end;
end;
		setlength(clientesAcompanados, length(clientesAcompanados) + 1);
		clientesAcompanados[length(clientesAcompanados) - 1] := nuevoCliente;
	end;
	3:
	begin
	writeln('---------------------------------');
	writeln('Seleccione el tipo de habitacion:');
	writeln('1. Family Room');
	writeln('2. Suite');
	writeln('---------------------------------');
	readln(tipoHabitacion);
	case tipoHabitacion of
	1:
	begin
		nuevoCliente.habitacion := FAMILY_ROOM;
		nuevoCliente.precio := 150.00; 
	end;
	2:
	begin
		nuevoCliente.habitacion := SUITE;
		nuevoCliente.precio := 100.00;
		end;
	end;
		setlength(clientesGrupos, length(clientesGrupos) + 1);
		clientesGrupos[length(clientesGrupos) - 1] := nuevoCliente;
	end;
end;
    clrscr;
	writeln('El cliente ha sido registrado exitosamente.');
	writeln;
	end;
	
procedure MostrarClientes();
var
i: integer;
begin
writeln('--- Clientes Individuales ---');
for i := 0 to length(clientesIndividuales) - 1 do
begin
MostrarRegistroCliente(clientesIndividuales[i]);
end;
writeln('--- Clientes Acompanados ---');
writeln;
for i := 0 to length(clientesAcompanados) - 1 do
begin
MostrarRegistroCliente(clientesAcompanados[i]);
end;
writeln('--- Clientes Grupos/Familias ---');
writeln;
for i := 0 to length(clientesGrupos) - 1 do
begin
MostrarRegistroCliente(clientesGrupos[i]);
end;
end;

var
opcion: integer;

begin
repeat
writeln('---------------------------------');
writeln('BIENVENIDO AL HOTEL LIDOTEL');
writeln('---------------------------------');
writeln('Seleccione una opcion:');
writeln;
writeln('1. Registrar un nuevo cliente');
writeln('2. Mostrar lista de clientes');
writeln('3. Salir');
readln(opcion);
clrscr;
case opcion of
1: NuevoCliente();
2: MostrarClientes();
end;
until opcion = 3;
end.




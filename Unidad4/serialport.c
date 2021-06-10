// Compilar: gcc -m64 serialport.c -o serialport
// Ejecutar: ./serialport

// virtualizar puertos: socat -d -d pty,raw,echo=0 pty,raw,echo=0

#include <stdio.h>
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

const char *puerto="/dev/pts/1";
int tam = 11;

int main()
{
    int tam = strlen(puerto);
    // nombre del puerto serial
    //char puerto[]="/dev/pts/0";
    // cadena que enviaremos por el puerto serial
    char datos_salida[]="hola mundo!!!\n";
    // cantidad de bytes enviados
    int bytes_enviados = 0;
    // estructura que almacena la configuración del puerto
    struct termios configuracionPuertoSerial;

    asm (".intel_syntax noprefix");
    asm ("mov rax,4");
    asm ("mov rbx,1");
    asm ("mov rcx,puerto");
    asm ("mov rdx,[tam]");
    asm ("int 128");
    asm (".att_syntax noprefix");
    int fd; // descriptor del archivo
    // llamada al sistema sys_open para abrir el puerto
    fd = open(puerto,O_RDWR | O_NOCTTY);
    if(fd == -1)
    {
        printf("\nError al abrir el puerto ... %s\n",puerto);
    } else {
        printf("\n%s abierto ...\n",puerto);
        // obtenemos la configuración actual del puerto
        tcgetattr(fd, &configuracionPuertoSerial);
        // definimos un baud rate de 9600 para envio y recepción
        cfsetispeed(&configuracionPuertoSerial,B9600);
        cfsetospeed(&configuracionPuertoSerial,B9600);
        // sin bit de paridad
        configuracionPuertoSerial.c_cflag &= ~PARENB;
        // stop bit = 1
        configuracionPuertoSerial.c_cflag &= ~CSTOPB;
        // declaramos 8 bits de datos
        configuracionPuertoSerial.c_cflag &= ~CSIZE;
        configuracionPuertoSerial.c_cflag |= CS8;
        // deshabilitar señales de control RTS y CTS
        configuracionPuertoSerial.c_cflag &= ~CRTSCTS;
        // habilitamos la recepción
        configuracionPuertoSerial.c_cflag |= CREAD | CLOCAL;
        // deshabilitamos control por software
        configuracionPuertoSerial.c_iflag &= ~(IXON | IXOFF | IXANY);
        // modo de operación
        configuracionPuertoSerial.c_iflag &= ~(ICANON | ECHO | ECHOE | ISIG);
        // leer al menos 10 caracteres
        //configuracionPuertoSerial.c_cc[VMIN] = 10;
        // tiempo de espera hasta que se reciban datos
        //configuracionPuertoSerial.c_cc[VTIME] = 0; // siempre a la espera
        // hacemos que el puerto tome la configuración indicada
        tcsetattr(fd,TCSANOW,&configuracionPuertoSerial);
        // indicamos que estamos realizando un envio
        printf("\nEnviando ...\n");
        // llamada al sistema sys_write
    bytes_enviados = write(fd,datos_salida,sizeof(datos_salida));
        // imprimimos la cantidad de bytes enviados
        printf("\n%d bytes enviados ...\n",bytes_enviados);
    }
    // llamada al sistema sys_close para cerrar el puerto
    printf("\nCerrando puerto %s ...\n\n",puerto);
    close(fd);
// terminación del programa
return 0;
}

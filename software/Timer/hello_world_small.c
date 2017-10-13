/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */

#include "system.h"
#include <sys/alt_irq.h>
#include <io.h>
#include <alt_types.h>



int * TIMER = (int*) 0x5000;
int * PH = (int*) 0x500c;
int * PL = (int *) 0x5008;
int * TC = (int *) 0x5004;
int * SSEG0 = (int*) 0x5080;
int * SSEG1 = (int*) 0x5070;
int * SSEG2 = (int*) 0x5060;
int * SSEG3 = (int*) 0x5050;
int * SWITCHES = (int*) 0x5040;
int * LEDS = (int*) 0x5030;
int * BUTTON = (int*) 0x5020;

int minutos = 0;
int minutos2 = 0;
int horas = 0;
int horas2 = 0;

int sminutos = 0;
int sminutos2 = 0;
int shoras = 0;
int shoras2 = 0;

int aminutos = 0;
int aminutos2 = 0;
int ahoras = 0;
int ahoras2 = 0;

int naminutos = 0;
int naminutos2 = 0;
int nahoras = 0;
int nahoras2 = 0;

int alarma = 0;

//int segundos=0;

static void irqhandler (void * context){
minutos=minutos + 1;
//segundos=segundos + 1;
//*LEDS=0xff;
*TIMER=0b0;// reset request
}

void SDECO(){ //deco de confiugracion de hora
	  switch (sminutos){ /*deco Tiempo a 7-segmentos*/
		  case 0:
			*SSEG0 = 0x40;
			break;
		  case 10000:
			*SSEG0 = 0xf9;
			break;
		  case 20000:
			*SSEG0 = 0xa4;
			break;
		  case 30000:
			*SSEG0 = 0xb0;
			break;
		  case 40000:
			*SSEG0 = 0x99;
			break;
		  case 50000:
			*SSEG0 = 0x92;
			break;
		  case 60000:
			*SSEG0 = 0x02;
			break;
		  case 70000:
			*SSEG0 = 0xf8;
			break;
		  case 80000:
			*SSEG0 = 0x00;
			break;
		  case 90000:
			*SSEG0 = 0x10;
			break;
		  case 100000:
			*SSEG0 = 0x40;
			sminutos = 0;
			sminutos2 = sminutos2 + 1;
			break;
	  }
	  switch (sminutos2){ /*deco Tiempo decenas a 7-segmentos*/
		  case 0:
			*SSEG1 = 0x40;
			break;
		  case 1:
			*SSEG1 = 0xf9;
			break;
		  case 2:
			*SSEG1 = 0xa4;
			break;
		  case 3:
			*SSEG1 = 0xb0;
			break;
		  case 4:
			*SSEG1 = 0x99;
			break;
		  case 5:
			*SSEG1 = 0x92;
			break;
		  case 6:
			*SSEG1 = 0x40;
			sminutos2 = 0;
			break;
	  }
	  switch (shoras){ /*deco Tiempo a 7-segmentos*/
	  		  case 0:
	  			*SSEG2 = 0x40;
	  			break;
	  		  case 10000:
	  			*SSEG2 = 0xf9;
	  			break;
	  		  case 20000:
	  			*SSEG2 = 0xa4;
	  			break;
	  		  case 30000:
	  			*SSEG2 = 0xb0;
	  			break;
	  		  case 40000:
	  			*SSEG2 = 0x99;
	  			break;
	  		  case 50000:
	  			*SSEG2 = 0x92;
	  			break;
	  		  case 60000:
	  			*SSEG2 = 0x02;
	  			break;
	  		  case 70000:
	  			*SSEG2 = 0xf8;
	  			break;
	  		  case 80000:
	  			*SSEG2 = 0x00;
	  			break;
	  		  case 90000:
	  			*SSEG2 = 0x10;
	  			break;
	  		  case 100000:
	  			*SSEG2 = 0x40;
	  			shoras = 0;
	  			shoras2 = shoras2 + 1;
	  			break;
	  	  }
	  	  switch (shoras2){ /*deco Tiempo decenas a 7-segmentos*/
	  		  case 0:
	  			*SSEG3 = 0x40;
	  			break;
	  		  case 1:
	  			*SSEG3 = 0xf9;
	  			break;
	  		  case 2:
	  			*SSEG3 = 0xa4;
	  			break;
	  		  case 3:
	  			*SSEG3 = 0x40;
	  			shoras2 = 0;
	  			break;
	  	  }
	 }

void ADECO(){ //deco de configuracion de alarma
	  switch (aminutos){ /*deco Tiempo a 7-segmentos*/
		  case 0:
			*SSEG0 = 0x40;
			break;
		  case 10000:
			*SSEG0 = 0xf9;
			break;
		  case 20000:
			*SSEG0 = 0xa4;
			break;
		  case 30000:
			*SSEG0 = 0xb0;
			break;
		  case 40000:
			*SSEG0 = 0x99;
			break;
		  case 50000:
			*SSEG0 = 0x92;
			break;
		  case 60000:
			*SSEG0 = 0x02;
			break;
		  case 70000:
			*SSEG0 = 0xf8;
			break;
		  case 80000:
			*SSEG0 = 0x00;
			break;
		  case 90000:
			*SSEG0 = 0x10;
			break;
		  case 100000:
			*SSEG0 = 0x40;
			aminutos = 0;
			aminutos2 = aminutos2 + 1;
			break;
	  }
	  switch (aminutos2){ /*deco Tiempo decenas a 7-segmentos*/
		  case 0:
			*SSEG1 = 0x40;
			break;
		  case 1:
			*SSEG1 = 0xf9;
			break;
		  case 2:
			*SSEG1 = 0xa4;
			break;
		  case 3:
			*SSEG1 = 0xb0;
			break;
		  case 4:
			*SSEG1 = 0x99;
			break;
		  case 5:
			*SSEG1 = 0x92;
			break;
		  case 6:
			*SSEG1 = 0x40;
			aminutos2 = 0;
			break;
	  }
	  switch (ahoras){ /*deco Tiempo a 7-segmentos*/
	  		  case 0:
	  			*SSEG2 = 0x40;
	  			break;
	  		  case 10000:
	  			*SSEG2 = 0xf9;
	  			break;
	  		  case 20000:
	  			*SSEG2 = 0xa4;
	  			break;
	  		  case 30000:
	  			*SSEG2 = 0xb0;
	  			break;
	  		  case 40000:
	  			*SSEG2 = 0x99;
	  			break;
	  		  case 50000:
	  			*SSEG2 = 0x92;
	  			break;
	  		  case 60000:
	  			*SSEG2 = 0x02;
	  			break;
	  		  case 70000:
	  			*SSEG2 = 0xf8;
	  			break;
	  		  case 80000:
	  			*SSEG2 = 0x00;
	  			break;
	  		  case 90000:
	  			*SSEG2 = 0x10;
	  			break;
	  		  case 100000:
	  			*SSEG2 = 0x40;
	  			ahoras = 0;
	  			ahoras2 = ahoras2 + 1;
	  			break;
	  	  }
	  	  switch (ahoras2){ /*deco Tiempo decenas a 7-segmentos*/
	  		  case 0:
	  			*SSEG3 = 0x40;
	  			break;
	  		  case 1:
	  			*SSEG3 = 0xf9;
	  			break;
	  		  case 2:
	  			*SSEG3 = 0xa4;
	  			break;
	  		  case 3:
	  			*SSEG3 = 0x40;
	  			ahoras2 = 0;
	  			break;
	  	  }
	 }

void DECO(){ //deco de hora actual
	  switch (minutos){ /*deco Tiempo a 7-segmentos*/
		  case 0:
			*SSEG0 = 0x40;
			break;
		  case 1:
			*SSEG0 = 0xf9;
			break;
		  case 2:
			*SSEG0 = 0xa4;
			break;
		  case 3:
			*SSEG0 = 0xb0;
			break;
		  case 4:
			*SSEG0 = 0x99;
			break;
		  case 5:
			*SSEG0 = 0x92;
			break;
		  case 6:
			*SSEG0 = 0x02;
			break;
		  case 7:
			*SSEG0 = 0xf8;
			break;
		  case 8:
			*SSEG0 = 0x00;
			break;
		  case 9:
			*SSEG0 = 0x10;
			break;
		  case 10:
			*SSEG0 = 0x40;
			minutos = 0;
			minutos2 = minutos2 + 1;
			break;
	  }
	  switch (minutos2){ /*deco Tiempo decenas a 7-segmentos*/
		  case 0:
			*SSEG1 = 0x40;
			break;
		  case 1:
			*SSEG1 = 0xf9;
			break;
		  case 2:
			*SSEG1 = 0xa4;
			break;
		  case 3:
			*SSEG1 = 0xb0;
			break;
		  case 4:
			*SSEG1 = 0x99;
			break;
		  case 5:
			*SSEG1 = 0x92;
			break;
		  case 6:
			*SSEG1 = 0x40;
			minutos2 = 0;
			horas=horas+1;
			break;
	  }
	  switch (horas){ /*deco Tiempo a 7-segmentos*/
	  		  case 0:
	  			*SSEG2 = 0x40;
	  			break;
	  		  case 1:
	  			*SSEG2 = 0xf9;
	  			break;
	  		  case 2:
	  			*SSEG2 = 0xa4;
	  			break;
	  		  case 3:
	  			*SSEG2 = 0xb0;
	  			break;
	  		  case 4:
	  			*SSEG2 = 0x99;
	  			break;
	  		  case 5:
	  			*SSEG2 = 0x92;
	  			break;
	  		  case 6:
	  			*SSEG2 = 0x02;
	  			break;
	  		  case 7:
	  			*SSEG2 = 0xf8;
	  			break;
	  		  case 8:
	  			*SSEG2 = 0x00;
	  			break;
	  		  case 9:
	  			*SSEG2 = 0x10;
	  			break;
	  		  case 10:
	  			*SSEG2 = 0x40;
	  			horas = 0;
	  			horas2 = horas2 + 1;
	  			break;
	  	  }
	  	  switch (horas2){ /*deco Tiempo decenas a 7-segmentos*/
	  		  case 0:
	  			*SSEG3 = 0x40;
	  			break;
	  		  case 1:
	  			*SSEG3 = 0xf9;
	  			break;
	  		  case 2:
	  			*SSEG3 = 0xa4;
	  			break;
	  		  case 3:
	  			*SSEG3 = 0x40;
	  			horas2 = 0;
	  			break;
	  	  }
	 }

int main()
{
  volatile int context;
 //IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_BASE, 0xf080);
 *PL=0xf080;
 //IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_BASE, 0x2fa);
 *PH = 0x2fa;
 //IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_BASE, 7);
 *TC = 0x7;
 alt_irq_register(TIMER_IRQ, (void*)&context, irqhandler);

 //alt_ic_isr_register(TIMER_IRQ_INTERRUPT_CONTROLLER_ID,TIMER_IRQ,irqhandler,NULL,0x0);
  while (1){
	  //
	  if(*SWITCHES==0x6){//configuracion de hora
	 		  if(*BUTTON==0x3){//modifica la hora
	 			  shoras=shoras+1;
	 			  SDECO();
	 		  }
	 		  else if(*BUTTON==0x5){//modifica los minutos
	 			  sminutos=sminutos+1;
	 			  SDECO();
	 		  }
	 		  else{//normaliza la hora configurada a la hora actual
	 		  horas=shoras/10000;
	 		  horas2=shoras2;
	 		  minutos=sminutos/10000;
	 		  minutos2=sminutos2;
	 		  }
		  }
	 	  else if(*SWITCHES==0x5){//enciende la alarma
	 		  alarma = 1;
	 		  if(*BUTTON==0x3){//configura horas en alarma
				  ahoras=ahoras+1;
				  ADECO();
	 		  		  }
			  else if(*BUTTON==0x5){//configura minutos en alarma
				  aminutos=aminutos+1;
				  ADECO();
			  }
			  else{ //normaliza la alarma para compararla con el reloj
				  nahoras=ahoras/10000;
				  nahoras2=ahoras2;
				  naminutos=aminutos/10000;
				  naminutos2=aminutos2;
			  }
	 	  }
	 	  /*else if(segundos==60){
	 		  segundos=0;
	 		  minutos=minutos+1;
	 	  }*/
	 	  else{
	 		  if(alarma==1&&horas2==nahoras2&&horas==nahoras&&minutos2==naminutos2&&minutos==naminutos){
	 			  *LEDS=0xff;
	 		  }
	 		  else{
	 		  DECO();
	 		  if(*BUTTON==0x6){//apaga la alarma
	 		  	*LEDS=0x00;
	 		  	alarma=0;
	 		  }
	 		  }
	 		  }
}
  return 0;
}

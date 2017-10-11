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

#include "sys/alt_stdio.h"
#include <sys/alt_irq.h>

int alt_irq_enable (alt_u32 id);
int alt_irq_register (alt_u32 id, void* context, void (*isr)(void*, alt_u32));

char * TIMER = (int*) 0x1800;
char * SSEG0 = (int*) 0x1820;
char * SSEG1 = (int*) 0x1830;
char * SWITCHES = (int*) 0x1860;
char * LEDS = (int*) 0x1870;
char * BUTTON = (int*) 0x1880;
int segundos = 0;
int segundos2 = 0;

int main()
{ 
  while (1){
	  if(*SWITCHES==0x6){/*Config hora*/
		  *LEDS=0x0f;
		  segundos = 0;
		  segundos2 = 0;
		  if(*BUTTON==0x7){
			  segundos=segundos+1;
		  }
		  else if (){

		  }
		  else if(){

		  }
		  else if(){

		  }
		  else{
		  switch (segundos){ /*deco Tiempo a 7-segmentos*/
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
		  		  case 500000:
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
		  			segundos = 0;
		  			segundos2 = segundos2 + 1;
		  			break;
		  	  }
		  	  switch (segundos2){ /*deco Tiempo decenas a 7-segmentos*/
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
		  			segundos2 = 0;
		  			break;
		  	  }
		  }
	  }
	  else if(*SWITCHES==0x5){/*Config alarma*/
		  *LEDS=0xf0;
	  }
	  else{
	  segundos = segundos + 1;
	  *LEDS=*BUTTON;
	  switch (segundos){ /*deco Tiempo a 7-segmentos*/
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
		  case 500000:
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
			segundos = 0;
			segundos2 = segundos2 + 1;
			break;
	  }
	  switch (segundos2){ /*deco Tiempo decenas a 7-segmentos*/
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
			segundos2 = 0;
			break;
	  }
	  }
  }
  return 0;
}

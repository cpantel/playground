#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/poll.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/mm.h>




#define DEFAULT_MAJOR   168
#define DEFAULT_DEBUG   1
#define DEFAULT_NAME    "charDevice"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Carlos Pantelides carlos.pantelides@gmail.com");
MODULE_DESCRIPTION("Char Device Module");
MODULE_VERSION("0.0.2");

static int major = DEFAULT_MAJOR;
static int debug = DEFAULT_DEBUG;
static char * name = DEFAULT_NAME;

module_param(major,int,S_IRUGO);
MODULE_PARM_DESC(major,"Override major number");

module_param(debug,int,S_IRUGO);
MODULE_PARM_DESC(debug,"Set to 1 for debugging output");

module_param(name,charp,S_IRUGO);
MODULE_PARM_DESC(name,"Name of the char device");



ssize_t charDevice_read( struct file *, char *, size_t, loff_t *);
ssize_t charDevice_write( struct file *, const char *, size_t, loff_t *);

static struct file_operations charDevice_fops = {
	.read = charDevice_read,
	.write = charDevice_write,
	.owner = THIS_MODULE
};
#define NUMMINORS 5

#define BUFFER_SIZE 1000
static char char_buffer[BUFFER_SIZE];
static int buffer_length = 0;

static dev_t charDeviceDev;
static struct cdev * charDeviceCdev;

int charDeviceInit(void) {
	int retval;
	if (debug) printk("%s: init...\n", DEFAULT_NAME);
	charDeviceCdev = cdev_alloc();
	charDeviceDev = MKDEV(major,0);
	retval = register_chrdev_region(charDeviceDev, NUMMINORS,name);
	if (retval < 0) return retval;
	if (!major) major = retval;
	if (debug) printk("%s registered with major = %d\n", name, major);
	charDeviceCdev->ops = &charDevice_fops;
	charDeviceCdev->owner = THIS_MODULE;
	retval = cdev_add(charDeviceCdev, charDeviceDev, NUMMINORS);

	return retval;
}	
void charDeviceExit(void) {

	if (debug) printk("%s: exit\n", DEFAULT_NAME);
	unregister_chrdev_region(charDeviceDev, NUMMINORS);
	cdev_del(charDeviceCdev);

}

ssize_t charDevice_read( struct file *filep, char *buf, size_t nbytes, loff_t *ppos){
    int avail;
    int failed, transferred;
    if (debug) {
        printk("READ     : %d bytes  ppos  : %lld\n",(int)nbytes, *ppos);
    }

    if (*ppos >= buffer_length || !nbytes) {
	printk("READ     : 1\n");
        return 0;
    }
    avail = buffer_length - *ppos;
    if (nbytes > avail)
        nbytes = avail;

    failed = copy_to_user(buf, char_buffer + *ppos, nbytes);
    transferred = nbytes - failed;

    if (!transferred) {
	printk("READ     : 2\n");
        return -EFAULT;
    }
    *ppos += transferred;
     
    return transferred;

}
ssize_t charDevice_write( struct file *filep, const char *buf, size_t nbytes, loff_t *ppos){
	  int failed, transferred;
  if (debug)
    printk("WRITE : %d flags: %x\n",(int)nbytes, filep->f_flags);

  if (!nbytes)
    return 0;

  if (filep->f_flags & O_APPEND) {
    printk("WRITE : Appending %ld bytes\n",nbytes);
  } else {
    printk("WRITE : Saving %ld bytes\n",nbytes);
    buffer_length = 0;
  }

  if (nbytes >= BUFFER_SIZE - buffer_length)
    nbytes =  BUFFER_SIZE - buffer_length -1;

  failed = copy_from_user(char_buffer + buffer_length, buf, nbytes);
  transferred = nbytes - failed;

  if (!transferred)
    return -EFAULT;

  buffer_length += transferred;

  char_buffer[ buffer_length] = '\0';
  return transferred;

}



module_init(charDeviceInit);

module_exit(charDeviceExit);

